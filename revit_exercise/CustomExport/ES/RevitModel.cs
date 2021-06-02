using Nest;

namespace ES
{
    public class RevitModel
    {
        public string FileName { get; set; }
        [Keyword]
        public string Level { get; set; }
    }

    public class Project : RevitModel
    {
        public string OwnerProject { get; set; } // => rvt file name
        public string FilePath { get; set; }  // => file path
        public string Elevation { get; set; }
        public GeoLocation Address { get; set; } // location
        [Keyword]
        public Id Id { get; set; } // => id
        [Keyword]
        public string Number { get; set; } // => id
        [Keyword]
        public string TimeZone { get; set; } // => subId
        [Keyword]
        public string Status { get; set; } // 阶段
        [Keyword]
        public string PlaceName { get; set; }
        [Text]
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
    public class Element : Project
    {
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
    }
}
