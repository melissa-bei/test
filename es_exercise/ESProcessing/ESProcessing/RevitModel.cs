using Nest;
using System.Collections.Generic;

namespace ESProcessingNested
{
    #region nested

    [ElasticsearchType(RelationName = "revitmodel")]
    public class RevitProject
    {
        /// <summary>
        /// element
        /// </summary>
        /// <param name="level"></param>
        /// <param name="proj"></param>
        /// <param name="elemInfo"></param>
        public RevitProject(string proj, ProjectInfo projInfo, List<ElementInfo> elemInfo)
        {
            this.OwnerProject = proj;
            this.ProjectInfo = projInfo;
            this.ElementInfo = elemInfo;
        }

        public Id _id;
        public string OwnerProject { get; set; }
        [Nested]
        public ProjectInfo ProjectInfo { get; set; }
        [Nested]
        public List<ElementInfo> ElementInfo { get; set; }
    }

    public class ProjectInfo
    {
        public string FileName { get; set; } // => rvt file name
        public string FilePath { get; set; }  // => file path
        public string Elevation { get; set; }
        public GeoLocation Address { get; set; } // location
        [Keyword]
        public string Id { get; set; } // => id
        public string Name { get; set; } // => id
        [Keyword]
        public string Number { get; set; } // => id
        [Keyword]
        public string TimeZone { get; set; } // => subId
        [Keyword]
        public string Status { get; set; } // 阶段
        [Keyword]
        public string PlaceName { get; set; }
        public string IssueDate { get; set; } // timeStamp
        [Keyword]
        public string BuildingType { get; set; } // 住宅、公建、
        [Keyword]
        public string Major { get; set; }
        [Keyword]
        public string SubName { get; set; } // => subId
        [Keyword]
        public string SubNumber { get; set; } // => subId
        [Text]
        public string OtherProps { get; set; } // 其他不统一、不重要的字段信息放在一起
    }
    public class ElementInfo
    {
        [Keyword]
        public string Id { get; set; }
        public string Name { get; set; }
        [Keyword]
        public string Category { get; set; }
        public string CategoryName { get; set; }
        [Keyword]
        public string FamilyId { get; set; }
        public string FamilyName { get; set; }
        [Keyword]
        public string FamilyType { get; set; }
        [Keyword]
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        [Text]
        public string OtherProps { get; set; }
    }
    #endregion
}
