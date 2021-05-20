using Nest;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace ES
{
    class ESDataLoader
    {
        ESBase es;
        string multiIndexPattern = null;

        public ESDataLoader(string url=null, string defaultIndex=null)
        {
            this.es = new ESBase(url, defaultIndex);
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
            es.Create(indexName);

            var bulkAllObservable = es.client.BulkAll(docs, b => b
                  .Index(indexName)
                  .Routing(project.Id.ToString())
                  .BackOffTime("10s")
                  .BackOffRetries(2)
                  .RefreshOnCompleted()
                  .Size(1000))
                .Wait(TimeSpan.FromMinutes(3), next => { });

            es.Logging();
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
            ICatResponse<CatIndicesRecord> response1 = es.client.CatIndices(s => s.Index(this.multiIndexPattern + "*"));
            string indexName = this.multiIndexPattern + string.Format("{0:D4}", response1.Records.Count + 1);
            return indexName;
        }


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
                Level = "project",
                Id = Guid.NewGuid(),
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
                    Id = elem.Value.Id,
                    Name = elem.Value.Name,
                    Category = elem.Value.Category,
                    CategoryName = elem.Value.CategoryName,
                    FamilyId = elem.Value.FamilyId,
                    FamilyName = elem.Value.FamilyName,
                    FamilyType = elem.Value.FamilyType,
                    TypeId = elem.Value.TypeId,
                    TypeName = elem.Value.TypeName,
                    OtherProps = elem.Value.OtherProperties,

                    OwnerProject = proj.project_info.Name,
                    FileName = proj.project_info.FileName,
                    FilePath = System.Text.RegularExpressions.Regex.Unescape(proj.project_info.FilePath),
                    Elevation = proj.project_info.Elevation,
                    Address = new GeoLocation(double.Parse(proj.project_info.Latitude), double.Parse(proj.project_info.Longitude)),
                    PlaceName = proj.project_info.PlaceName,
                    TimeZone = proj.project_info.TimeZone,
                    Status = proj.project_info.Status,
                    IssueDate = proj.project_info.IssueDate
                };
                docs.Add(element);
            }
            return docs;
        }
    }
}
