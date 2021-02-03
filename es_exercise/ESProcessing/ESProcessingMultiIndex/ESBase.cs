using Elasticsearch.Net;
using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;

namespace ESProcessingMultiIndex
{
    public class ESBase
    {
        public ElasticClient client;
        List<string> logList = new List<string>();

        string multiIndexPattern = null;

        public ESBase(string url="", string defaultIndex="")
        {
            if (url == null)
                url = "http://localhost:9200";
            if (defaultIndex == null)
                defaultIndex = "test";

            var pool = new SingleNodeConnectionPool(new Uri(url));
            ConnectionSettings settings = new ConnectionSettings(pool)
                .DefaultIndex(defaultIndex)
                .DisableDirectStreaming() /// capture the request and/or response
                .ThrowExceptions() /// throw exceptions when a call results in an exception
                .OnRequestCompleted(apiCallDetails =>
                {
                    /// log out the request and the request body, if one exists for the type of request
                    if (apiCallDetails.RequestBodyInBytes != null)
                    {
                        logList.Add($"{apiCallDetails.HttpMethod} {apiCallDetails.Uri}"); //{ Encoding.UTF8.GetString(apiCallDetails.RequestBodyInBytes)}");
                    }
                    else
                    {
                        logList.Add($"{apiCallDetails.HttpMethod} {apiCallDetails.Uri}");
                    }
                    /// log out the response and the response body, if one exists for the type of response
                    if (apiCallDetails.ResponseBodyInBytes != null)
                    {
                        logList.Add($"Status: {apiCallDetails.HttpStatusCode}");// {Encoding.UTF8.GetString(apiCallDetails.ResponseBodyInBytes)}");
                    }
                    else
                    {
                        logList.Add($"Status: {apiCallDetails.HttpStatusCode}");
                    }
                });

            client = new ElasticClient(settings); 
        }

        public void Logging(string path="./", string filename="es.log")
        {
            File.AppendAllLines(Path.Combine(path, filename), logList);
        }

        /// <summary>
        /// 创建索引
        /// </summary>
        /// <param name="indexName"></param>
        public void Create(string indexName, int nShards=1, int nReplicas=1)
        {
            try
            {
                var response = client.Indices.Create(indexName, c => c
                    .Index(indexName)
                    .Settings(n => n
                        .NumberOfReplicas(nReplicas)
                        .NumberOfShards(nShards)
                        )
                    .Map<RevitModel>(m => m
                        .AutoMap<Project>()  ///映射Project的属性
                        .AutoMap<Element>()  ///映射element的属性
                    )
                );
            }
            catch { }
        }

        /// <summary>
        /// 删除索引
        /// </summary>
        /// <param name="indexName"></param>
        public void Dispose(string indexName)
        {
            try
            {
                var descriptor = new DeleteIndexDescriptor(indexName).AllIndices();
                var response = client.Indices.Delete(Indices.Parse(indexName));
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }



        #region HighLevel Client index
        /// <summary>
        /// 解析自定义导出的json数据
        /// </summary>
        /// <param name="projStr"></param>
        /// <returns></returns>
        public List<RevitModel> EsDataProvider(string projStr)
        {
            List<RevitModel> docs = new List<RevitModel>();
            ///解析json
            RevitModelJson proj = JsonConvert.DeserializeObject<RevitModelJson>(projStr);

            ///抽取project
            var project = new Project()
            {
                Id = Guid.NewGuid(),
                Level = "project",
                OwnerProject = proj.project_info.Name,
                FileName = proj.project_info.FileName,
                FilePath = System.Text.RegularExpressions.Regex.Unescape(proj.project_info.FilePath),
                Elevation = proj.project_info.Elevation,
                Address = new GeoLocation(double.Parse(proj.project_info.Latitude), double.Parse(proj.project_info.Longitude)),
                PlaceName = proj.project_info.PlaceName,
                TimeZone = proj.project_info.TimeZone,
                Status = proj.project_info.Status,
                IssueDate = proj.project_info.IssueDate,
                OtherProps = proj.project_info.OtherProperties
            };
            docs.Add(project);

            ///抽取elements
            foreach (var elem in proj.element_info)
            {
                var element = new Element()
                {
                    Level = "element",
                    FileName = proj.project_info.FileName,
                    Id = elem.Id,
                    Name = elem.Name,
                    Category = elem.Category,
                    CategoryName = elem.CategoryName,
                    FamilyId = elem.FamilyId,
                    FamilyName = elem.FamilyName,
                    FamilyType = elem.FamilyType,
                    TypeId = elem.TypeId,
                    TypeName = elem.TypeName,
                    OtherProps = elem.OtherProperties
                };
                docs.Add(element);
            }
            return docs;
        }

        /// <summary>
        /// 向ES批量上传自定义导出的文档
        /// </summary>
        /// <param name="docs"></param>
        public void IndexMany(List<RevitModel> docs)
        {
            if (docs.Count < 2)
                return;
            Project project = docs[0] as Project;

            string indexName = GenerateIndexName();
            Create(indexName);

            var bulkAllObservable = client.BulkAll(docs, b => b
                  .Index(indexName)
                  .Routing(project.Id.ToString())
                  .BackOffTime("10s")
                  .BackOffRetries(2)
                  .RefreshOnCompleted()
                  .Size(1000))
                .Wait(TimeSpan.FromMinutes(3), next => { });
        }

        /// <summary>
        /// 设置多索引名称pattern
        /// </summary>
        /// <param name="pattern"></param>
        public void SetMultiIndexPattern(string pattern)
        {
            this.multiIndexPattern = pattern;
        }

        /// <summary>
        /// 创建索引名
        /// </summary>
        /// <returns></returns>
        private string GenerateIndexName()
        {
            if (multiIndexPattern == null)
            {
                throw new Exception("The multiIndexPattern is not initialized. Use method multiIndexPattern to set it.");
            }
            CatResponse<CatIndicesRecord> response1 = client.Cat.Indices(s => s.Index(this.multiIndexPattern + "*"));
            string indexName = this.multiIndexPattern + String.Format("{0:D4}", response1.Records.Count + 1);
            return indexName;
        }
        #endregion
    }
}
