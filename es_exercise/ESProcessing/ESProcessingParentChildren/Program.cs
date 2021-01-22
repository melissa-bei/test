using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;

namespace ESProcessingParentChildren
{
    class Program
    {
        static ESBase es;
        static void Main(string[] args)
        {
            const string url = "http://localhost:9200";
            const string indexName = "test_revit_model_index";
            try
            {
                ///Connecting
                es = new ESBase(url, indexName);
                es.Create(indexName);

                //string jsonDir = @"C:\Users\lib\Desktop\tmp";
                //UpdateJsonPath(jsonDir);

                /////Load json file to ES
                //string jsonDir = @"E:\cbim_revit_batch\resource\exportedjson";
                //LoadToES(jsonDir, indexName);

                ///Add information
                string excelPath = @"E:\cbim_revit_batch\resource\revit模型项目级信息.xlsx";
                AddInformation(excelPath, indexName);
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
        public static void LoadToES(string path, string indexName)
        {
            foreach (FileInfo file in new DirectoryInfo(path).GetFiles("*.json", SearchOption.AllDirectories))
            {
                try
                {
                    Console.WriteLine($"Start index file: {file.Name.Substring(0, file.Name.LastIndexOf("."))}");
                    ///Open json files
                    StreamReader reader = new StreamReader(new FileStream(file.FullName, FileMode.Open));
                    string allText = reader.ReadToEnd();
                    ///Indexing
                    List<RevitModel> docs = es.EsDataProvider(allText);
                    es.IndexMany(docs, indexName);
                    es.Logging();
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
        public static void AddInformation(string path, string indexName)
        {
            DataTable dataTable = DataProvider.ExcelDataProvider.Instance.SetPath(path).GetDatas();

            for (int i = 1; i < dataTable.Rows.Count; i++)
            {
                ///获取当前项目的名字
                DataRow dataRow = dataTable.Rows[i];
                var file_name = dataRow.Field<string>("file_name").Split('.')[0];
                if (string.IsNullOrEmpty(file_name))
                    continue;

                ///搜索当前项目是否在数据库中
                file_name = file_name.EndsWith("_已分离") ? file_name.Remove(file_name.Length - 4) : file_name;
                file_name = file_name + ".rvt";

                ISearchResponse<Project> response1 = es.client.Search<Project>(m => m
                    .Index(indexName)
                    .Size(1)
                    .Source(sf => sf
                        .Includes(o => o.Field(p => p.Id)))
                    .Query(n => n
                        .Bool(o => o
                            .Filter(f => f.HasChild<Element>(q => q.Query(t => t.MatchAll())))  ///project级别
                            .Must(
                                p => p.Match(v => v.Field(w => w.FileName).Query(file_name)),  ///项目名相同
                                p => p.Match(v => v.Field(w => w.FilePath).Query(dataRow.Field<string>("file_path")).Operator(Operator.And))  ///路径相同
                                )
                            )
                        )
                    );
                string id = null;
                try
                {
                    foreach (var hit in response1.Hits)
                    {
                        id = hit.Id;
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
                IUpdateResponse<Project> response2 = es.client.Update<Project>(docpath, m => m
                    .Doc(newProject)
                    .Index(indexName)
                    .Routing(id));
                if (response2.IsValid)
                    Console.WriteLine($"Successfully update source `{id}` from `{file_name}`");
            }
        }

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

                        string newName = proj.project_info.FileName.Split('.')[0];
                        newName = newName.EndsWith("_已分离") ? newName.Remove(newName.Length - 4) : newName;
                        newName = newName + ".rvt";
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
    }
}
