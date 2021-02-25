using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;

namespace ESProcessingMultiIndex
{
    class Program
    {
        static void Main(string[] args)
        {
            const string url = "http://localhost:9200";
            try
            {
                //string jsonDir = @"C:\Users\lib\Desktop\tmp";
                //UpdateJsonPath(jsonDir);
                //RemoveDuplicates(jsonDir);

                string indexPattern = "test_revit_model_index_";
                ///Load json file to ES
                string jsonDir = @"E:\cbim_revit_batch\resource\exportedjson";
                LoadToES(jsonDir, url, indexPattern);

                ///Add information
                string excelPath = @"E:\cbim_revit_batch\resource\revit模型项目级信息.xlsx";
                AddInformation(excelPath, url, indexPattern);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        /// <summary>
        /// 加载路径下的json到ES
        /// </summary>
        /// <param name="path"></param>
        public static void LoadToES(string path, string url, string indexPattern)
        {
            foreach (FileInfo file in new DirectoryInfo(path).GetFiles("*.json", SearchOption.AllDirectories))
            {
                try
                {
                    ESDataLoader esDataLoader = new ESDataLoader(url);
                    esDataLoader.SetMultiIndexPattern(indexPattern);

                    Console.WriteLine($"Start index file: {file.Name.Substring(0, file.Name.LastIndexOf("."))}");
                    ///Open json files
                    StreamReader reader = new StreamReader(new FileStream(file.FullName, FileMode.Open));
                    string allText = reader.ReadToEnd();
                    ///Indexing
                    List<RevitModel> docs = esDataLoader.EsDataProvider(allText);
                    esDataLoader.IndexMany(docs);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
        }

        /// <summary>
        /// 追加项目信息
        /// </summary>
        /// <param name="path"></param>
        /// <param name="url"></param>
        /// <param name="indexPattern"></param>
        public static void AddInformation(string path, string url, string indexPattern)
        {
            DataTable dataTable = DataProvider.ExcelDataProvider.Instance.SetPath(path).GetDatas();

            for (int i = 1; i < dataTable.Rows.Count; i++)
            {
                ///获取当前项目的名字
                DataRow dataRow = dataTable.Rows[i];
                var file_name = dataRow.Field<string>("file_name").Replace(".rvt", "").Replace("_已分离", "");
                if (string.IsNullOrEmpty(file_name))
                    continue;

                ///搜索当前项目是否在数据库中
                ///Connecting
                ESBase es = new ESBase(url);

                ISearchResponse<Project> response1 = es.client.Search<Project>(m => m
                    .Size(1)
                    .Index(indexPattern  + "*")
                    .Sort(s => s.Descending("_score"))
                    .Query(n => n
                        .Bool(o => o
                            .Must(
                                p => p.Term(q => q.Level, "project"),  ///project级别
                                p => p.Match(v => v.Field(w => w.FileName).Query(file_name).Operator(Operator.And)),  ///项目名相同
                                p => p.Match(v => v.Field(w => w.FilePath).Query(dataRow.Field<string>("file_path")).Operator(Operator.And))  ///路径相同
                                )
                            )
                        )
                    );
                string id = null;
                string indexName = null;
                try
                {
                    foreach (var hit in response1.Hits)
                    {
                        id = hit.Id;
                        indexName = hit.Index;
                        break;
                    }
                }
                catch { continue; }
                if (id == null)
                    continue;

                ///更新数据
                var newProject = new Project()
                {
                    FilePath = dataRow.Field<string>("file_path"),
                    OwnerProject = dataRow.Field<string>("project_name"),
                    Address = new GeoLocation(double.Parse(dataRow.Field<string>("latitude")), double.Parse(dataRow.Field<string>("longitude"))),
                    Number = dataRow.Field<string>("project_number"),
                    IssueDate = dataRow.Field<string>("project_issue_date"),
                    Status = dataRow.Field<string>("project_phase"),
                    PlaceName = dataRow.Field<string>("project_address"),
                    BuildingType = dataRow.Field<string>("building_type"),
                    Major = dataRow.Field<string>("major"),
                    SubName = dataRow.Field<string>("sub_Name"),
                    SubNumber = dataRow.Field<string>("sub_number"),
                };
                var docpath = new DocumentPath<Project>(id).Index(IndexName.From<Project>());
                UpdateByQueryResponse response2 = es.client.UpdateByQuery<Project>(m => m
                    .MatchAll().Script(s => s.Source(
                        $"ctx._source.filePath='{dataRow.Field<string>("file_path").Replace("\\", "\\\\")}';" +
                        $"ctx._source.ownerProject='{dataRow.Field<string>("project_name")}';" +
                        $"ctx._source.address='{new GeoLocation(double.Parse(dataRow.Field<string>("latitude")), double.Parse(dataRow.Field<string>("longitude")))}';" +
                        $"ctx._source.number='{dataRow.Field<string>("project_number")}';" +
                        $"ctx._source.issueDate='{dataRow.Field<string>("project_issue_date")}';" +
                        $"ctx._source.status='{dataRow.Field<string>("project_phase")}';" +
                        $"ctx._source.placeName='{dataRow.Field<string>("project_address")}';" +
                        $"ctx._source.buildingType='{dataRow.Field<string>("building_type")}';" +
                        $"ctx._source.major='{dataRow.Field<string>("major")}';" +
                        $"ctx._source.subName='{dataRow.Field<string>("sub_Name")}';" +
                        $"ctx._source.subNumber='{dataRow.Field<string>("sub_number")}'"
                        ))
                    .Index(indexName)
                    .Routing(id));
                if (response2.IsValid)
                    Console.WriteLine($"Successfully update source `{id}` from `{file_name}` to `{indexName}`");
            }
        }

        /// <summary>
        /// 更新项目路径
        /// </summary>
        /// <param name="path"></param>
        public static void UpdateJsonPath(string path)
        {
            foreach (FileInfo file in new DirectoryInfo(path).GetFiles("*.json", SearchOption.AllDirectories))
            {
                try
                {
                    Console.WriteLine($"Start update file: {file.Name.Substring(0, file.Name.LastIndexOf("."))}");
                    ///Open json files
                    StreamReader reader = new StreamReader(new FileStream(file.FullName, FileMode.Open));
                    string allText = reader.ReadToEnd();
                    reader.Close();
                    ///updata path
                    RevitModelJson proj = JsonConvert.DeserializeObject<RevitModelJson>(allText);
                    try
                    {
                        string newPath = file.DirectoryName.Substring(@"C:\Users\lib\Desktop\tmp".Length + 1);
                        proj.project_info.FilePath = System.Text.RegularExpressions.Regex.Escape(newPath);

                        string newName = proj.project_info.FileName.Replace("_已分离", "").Replace(".rvt", "");
                        proj.project_info.FileName = newName;

                        string jsonStr = JsonConvert.SerializeObject(proj);
                        File.WriteAllText(file.FullName, jsonStr);
                    }
                    catch { }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
        }

        /// <summary>
        /// 移除数据中重复的视图
        /// </summary>
        /// <param name="path"></param>
        public static void RemoveDuplicates(string path)
        {
            foreach (FileInfo file in new DirectoryInfo(path).GetFiles("*.json", SearchOption.AllDirectories))
            {
                try
                {
                    Console.WriteLine($"Start update file: {file.Name.Substring(0, file.Name.LastIndexOf("."))}");
                    ///Open json files
                    StreamReader reader = new StreamReader(new FileStream(file.FullName, FileMode.Open));
                    string allText = reader.ReadToEnd();
                    reader.Close();
                    ///解析json
                    RevitModelJson proj = JsonConvert.DeserializeObject<RevitModelJson>(allText);
                    
                    var delType = new List<TypeInfoInJson>();
                    foreach (var t in proj.type_info)
                    {
                        if (t.Name == "三维视图")
                        {
                            delType.Add(t);
                        }
                    }
                    foreach (var t in delType)
                    {
                        proj.type_info.Remove(t);
                    }

                    var delElement = new List<ElementInfoInJson>();
                    foreach (var e in proj.element_info)
                    {
                        if (e.TypeName == "三维视图")
                        {
                            delElement.Add(e);
                        }
                    }
                    foreach (var e in delElement)
                    {
                        proj.element_info.Remove(e);
                    }

                    string newJson = JsonConvert.SerializeObject(proj);
                    File.WriteAllText(file.FullName, newJson);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
        }


        //public static void Test()
        //{
        //    string filePath = @"C:\Users\lib\Desktop\data.json";
        //    StreamReader file = File.OpenText(filePath);
        //    JsonTextReader reader = new JsonTextReader(file);
        //    JObject o = (JObject)JToken.ReadFrom(reader);

        //    List<int> indices = new List<int>();
        //    foreach (var k in o["aggregations"]["file"]["buckets"])
        //    {
        //        var idx = int.Parse(k["key"].ToString().Substring("test_revit_model_index_".Length));
        //        indices.Add(idx);
        //    }
        //    indices.Sort();
        //    Console.WriteLine(string.Join("\n", indices.ToArray()));
        //    Console.ReadKey();
        //}
    }
}
