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
    }
}
