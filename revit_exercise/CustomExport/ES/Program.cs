using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;

namespace ES
{
    public class Program
    {
        static void Main(string[] args)
        {
            const string url = "http://10.80.253.135:9200";

            try
            {
                DirectoryInfo currentPath = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);

                string indexPattern = "test_revit_model_index_";
                ///Load json file to ES
                string jsonDir = @"E:\cbim_revit_batch\resource\exportedjson";
                LoadAllToES(jsonDir, url, indexPattern);

                ///Add information
                string resourcePath = Path.Combine(currentPath.Parent.Parent.Parent.Parent.FullName, "resource");
                string excelPath = Path.Combine(resourcePath, "revit模型项目级信息.xlsx");
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
        public static void LoadAllToES(string path, string url, string indexPattern)
        {
            ESBase es = new ESBase(url);
            foreach (FileInfo file in new DirectoryInfo(path).GetFiles("*.json", SearchOption.AllDirectories))
            {
                LoadOneToES(es, file, url, indexPattern);
            }
        }

        public static void LoadOneToES(ESBase es, FileInfo file, string url, string indexPattern)
        {
            try
            {
                ESDataLoader esDataLoader = new ESDataLoader(url);
                esDataLoader.SetMultiIndexPattern(indexPattern);

                ///Open json files
                string allText = string.Empty;
                using (FileStream fs = new FileStream(file.FullName, FileMode.Open))
                {
                    using (StreamReader reader = new StreamReader(fs, Encoding.UTF8))
                    {
                        allText = reader.ReadToEnd();
                    }
                }
                ///Prepare data
                List<RevitModel> docs = esDataLoader.EsDataProvider(allText);
                ///Checking
                string id = null;
                string indexName = null;
                IsAlreadUploaded(es, indexPattern, docs[0].FileName, ((Project)docs[0]).FilePath, ref id, ref indexName);
                if (id == null)
                {///Indexing
                    esDataLoader.IndexMany(docs);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }


        public static void AddInformation(string excelPath, string url, string indexPattern)
        {
            DataTable dataTable = ExcelDataProvider.Instance.SetPath(excelPath).GetDatas();

            for (int i = 1; i < dataTable.Rows.Count; i++)
            {
                DataRow dataRow = dataTable.Rows[i];
                ///Get current file name
                var file_name = dataRow.Field<string>("file_name").Replace("_已分离", "").Replace(".rvt", "");
                if (string.IsNullOrEmpty(file_name))
                    continue;
                ///Connecting
                ESBase es = new ESBase(url);
                ///Checking
                string id = null;
                string indexName = null;
                IsAlreadUploaded(es, indexPattern, file_name, dataRow.Field<string>("file_path"), ref id, ref indexName);
                if (id == null)
                    continue;
                ///Create a new Project object
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
                    SubName = dataRow.Field<string>("sub_name"),
                    SubNumber = dataRow.Field<string>("sub_number"),
                };
                var docpath = new DocumentPath<Project>(id).Index(IndexName.From<Project>());
                ///Update project
                IUpdateByQueryResponse response = es.client.UpdateByQuery<Project>(m => m
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
                if (response.IsValid)
                    Console.WriteLine($"Successfully update source `{id}` from `{file_name}` to `{indexName}`");
            }
        }

        public static void IsAlreadUploaded(ESBase es, string indexPattern, string fileName, string filePath, ref string id, ref string indexName)
        {
            ISearchResponse<Project> response = es.client.Search<Project>(m => m
                    .Index(indexPattern + "*")
                    .Size(1)
                    .Sort(s => s.Descending("_score"))
                    .Query(n => n
                        .Bool(o => o
                            .Must(
                                p => p.Term(q => q.Level, "project"),  ///project级别
                                p => p.Match(v => v.Field(w => w.FileName).Query(fileName).Operator(Operator.And)),  ///项目名相同
                                p => p.Match(v => v.Field(w => w.FilePath).Query(filePath).Operator(Operator.And))  ///路径相同
                                )
                            )
                        )
                    );
            try
            {
                foreach (var hit in response.Hits)
                {
                    id = hit.Id;
                    indexName = hit.Index;
                    break;
                }
            }
            catch { }
        }

        /// <summary>
        /// 更新path下所有json文件中的路径参数
        /// </summary>
        /// <param name="jsonDir"></param>
        public static void UpdateAllJsonPath(string jsonDir)
        {
            foreach (FileInfo jsonFile in new DirectoryInfo(jsonDir).GetFiles("*.json", SearchOption.AllDirectories))
            {
                UpdateOneJsonPath(jsonFile);
            }
        }

        /// <summary>
        /// 更新一个json文件中的路径参数
        /// </summary>
        /// <param name="jsonDir"></param>
        /// <param name="file"></param>
        public static void UpdateOneJsonPath(FileInfo file)
        {
            ///Open json files
            string allText = string.Empty;
            using (FileStream fs = new FileStream(file.FullName, FileMode.Open))
            {
                using (StreamReader reader = new StreamReader(fs, Encoding.UTF8))
                {
                    allText = reader.ReadToEnd();
                }
            }
            RevitModelJson proj = JsonConvert.DeserializeObject<RevitModelJson>(allText);
            ///Updata path
            proj.project_info.FilePath = System.Text.RegularExpressions.Regex.Escape(file.DirectoryName);
            ///Normalize file name
            proj.project_info.FileName = proj.project_info.FileName.Replace("_已分离", "").Replace(".rvt", "");

            string jsonStr = JsonConvert.SerializeObject(proj);
            File.WriteAllText(file.FullName, jsonStr);
        }
    }
}
