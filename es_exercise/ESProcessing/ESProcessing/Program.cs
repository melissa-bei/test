using Nest;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;

namespace ESProcessingNested
{
    class Program
    {
        static ESBase es;
        static void Main(string[] args)
        {
            const string url = "http://localhost:9200";
            const string indexName = "test_nested_revit_model";
            try
            {
                ///Connecting
                es = new ESBase(url, indexName);
                es.Create(indexName);

                /////Load json file to ES
                //string jsonDir = @"E:\cbim_revit_batch\resource\exportedjson";
                //LoadToES(jsonDir, indexName);

                ///Add information
                string excelPath = @"E:\cbim_revit_batch\resource\revit模型项目级信息.xlsx";
                AddInformation(excelPath, indexName);

                /////Aggregations
                //var h = Search(indexName);
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
                    ///Data processing
                    RevitProject docs = es.EsDataProvider(allText);
                    ///Indexing
                    var indexResponse = es.client.Index(docs, i => i.Index(indexName).Timeout(new Time(100000)));
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
                var file_name = dataRow.Field<string>("file_name");
                if (string.IsNullOrEmpty(file_name))
                    continue;
                ///搜索当前项目是否在数据库中
                string id = null;
                var project_name_without_extension = file_name.Substring(0, file_name.LastIndexOf("."));
                ISearchResponse<RevitProject> response1 = es.client.Search<RevitProject>(m => m
                    .Index(indexName)
                    .Size(1)
                    .Source(sf => sf
                        .Includes(o => o.Field(p => p._id)))
                    .Query(n => n
                        .Bool(o => o
                            .Must(
                                p => p.Nested(q => q
                                    .Path(r => r.ProjectInfo)
                                    .Query(s => s
                                        .Bool(t => t
                                            .Must(
                                                u => u.MatchPhrasePrefix(v => v.Field(w => w.ProjectInfo.FileName).Query(project_name_without_extension)),  ///项目名相同
                                                u => u.Match(v => v.Field(w => w.ProjectInfo.FilePath).Query(dataRow.Field<string>("file_path")))  ///路径相同
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                );
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
                var newProject = new RevitProject(dataRow.Field<string>("project_name"), new ProjectInfo()
                {
                    FilePath = dataRow.Field<string>("file_path"),
                    Name = dataRow.Field<string>("project_name"),
                    Number = dataRow.Field<string>("project_number"),
                    IssueDate = dataRow.Field<string>("project_issue_date"),
                    Status = dataRow.Field<string>("project_phase"),
                    PlaceName = dataRow.Field<string>("project_address"),
                    BuildingType = dataRow.Field<string>("building_type"),
                    Major = dataRow.Field<string>("major"),
                    SubName = dataRow.Field<string>("sub_Name"),
                    SubNumber = dataRow.Field<string>("sub_number"),
                },
                new List<ElementInfo>()
                );
                var docpath = new DocumentPath<RevitProject>(id).Index(IndexName.From<RevitProject>());
                IUpdateResponse<RevitProject> response2 = es.client.Update<RevitProject>(docpath, m => m.Doc(newProject).Index(indexName));
                if (response2.IsValid)
                    Console.WriteLine($"Successfully update source `{id}` from `{project_name_without_extension}`");
            }
        }

        //public static List<RevitProject> Search(string indexName)
        //{
        //    var hits = new List<RevitProject>();

        //    var response = es.client.Search<RevitProject>(a => a
        //        .Aggregations(aggs => aggs
        //            .Nested("category_count", p => p
        //                .Path(q => q.ElementInfo)
        //                .Aggregations(childaggs => childaggs
        //                    .Terms("category_count", count => count
        //                        .Field(s => s.ElementInfo.Category)
        //                    )
        //                )
        //            )
        //        )
        //    );

        //    var tmp = response.Aggregations["category_count"];
        //    return hits;
        //}
    }
}

