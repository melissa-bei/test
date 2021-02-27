using Elasticsearch.Net;
using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;

namespace ESProcessingNested
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
                .DefaultMappingFor<RevitProject>(m => m.IndexName(defaultIndex))
                .DefaultMappingFor<ProjectInfo>(m => m.IndexName(defaultIndex))
                .DefaultMappingFor<ElementInfo>(m => m.IndexName(defaultIndex).RelationName("project"))
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
                    .Settings(s => s
                        .NumberOfReplicas(nReplicas)
                        .NumberOfShards(nShards)
                    )
                    .Map<RevitProject>(m => m
                        .AutoMap<RevitProject>()
                    )
                    .IncludeTypeName(false)
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
        public RevitProject EsDataProvider(string projStr)
        {
            ///解析json
            RevitModelJson proj = JsonConvert.DeserializeObject<RevitModelJson>(projStr);

            ///抽取project
            var project = new ProjectInfo()
            {
                FileName = proj.project_info.FileName,
                FilePath = System.Text.RegularExpressions.Regex.Unescape(proj.project_info.FilePath),
                Elevation = proj.project_info.Elevation,
                Address = new GeoLocation(double.Parse(proj.project_info.Latitude), double.Parse(proj.project_info.Longitude)),
                PlaceName = proj.project_info.PlaceName,
                TimeZone = proj.project_info.TimeZone,
                Name = proj.project_info.Name,
                Status = proj.project_info.Status,
                IssueDate = proj.project_info.IssueDate,
                OtherProps = proj.project_info.OtherProperties
            };

            ///抽取element
            List<ElementInfo> docs = new List<ElementInfo>();
            foreach (var elem in proj.element_info)
            {
                var element = new ElementInfo()
                {
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
            return new RevitProject(proj.project_info.FileName, project, docs);
        }
        #endregion
    }
}
