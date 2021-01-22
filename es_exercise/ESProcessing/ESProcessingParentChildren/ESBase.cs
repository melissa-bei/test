using Elasticsearch.Net;
using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;

namespace ESProcessingParentChildren
{
    public class ESBase
    {
        public ElasticClient client;
        List<string> logList = new List<string>();

        public ESBase(string url, string defaultIndex)
        {
            if (url == null | url == "")
                url = "http://localhost:9200";
            if (defaultIndex == null | defaultIndex == "")
                defaultIndex = "test";

            var pool = new SingleNodeConnectionPool(new Uri(url));
            ConnectionSettings settings = new ConnectionSettings(pool)
                .DefaultIndex(defaultIndex)
                .DefaultMappingFor<RevitModel>(m => m.IndexName(defaultIndex))
                .DefaultMappingFor<Element>(m => m.IndexName(defaultIndex))
                .DefaultMappingFor<Project>(m => m.IndexName(defaultIndex).RelationName("project"))
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
                    .Index<RevitModel>()
                    .Settings(n => n
                        .NumberOfReplicas(nReplicas)
                        .NumberOfShards(nShards)
                        )
                    .Map<RevitModel>(m => m
                        .RoutingField(r => r.Required())  ///将路由设置为必填项
                        .AutoMap<Project>()  ///映射Project的属性
                        .AutoMap<Element>()  ///映射element的属性
                        .Properties(prop => prop
                            .Join(j => j
                                .Name(p => p.MyJoinField)
                                .Relations(r => r
                                    .Join<Project, Element>()  ///另外映射JoinField，因为它不是AutoMap()自动映射的
                                )
                            )
                        )
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

        #region HighLevel  Client index
        public List<RevitModel> EsDataProvider(string projStr)
        {
            List<RevitModel> docs = new List<RevitModel>();
            ///解析json
            RevitModelJson proj = JsonConvert.DeserializeObject<RevitModelJson>(projStr);

            ///抽取project
            var project = new Project()
            {
                Id = Guid.NewGuid(),
                MyJoinField = JoinField.Root<Project>(),
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
                    MyJoinField = JoinField.Link<Element, Project>(project),
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

        public void IndexMany(List<RevitModel> docs, string indexName)
        {
            if (docs.Count < 2)
                return;
            Project project = docs[0] as Project;

            var bulkAllObservable = client.BulkAll(docs, b => b
                  .Index(indexName)
                  .Routing(project.Id.ToString())
                  .BackOffTime("10s")
                  .BackOffRetries(2)
                  .RefreshOnCompleted()
                  .Size(1000))
                .Wait(TimeSpan.FromMinutes(3), next => { });
        }
        #endregion
    }
}
