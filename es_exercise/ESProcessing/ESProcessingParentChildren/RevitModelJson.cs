using System.Collections.Generic;

namespace ESProcessingParentChildren
{
    public class RevitModelJson
    {
        public ProjectInfoInJson project_info { get; set; }
        public List<TypeInfoInJson> type_info { get; set; }
        public List<ElementInfoInJson> element_info { get; set; }
    }

    public class ProjectInfoInJson
    {
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public string Elevation { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string PlaceName { get; set; }
        public string TimeZone { get; set; }
        public string OrganizationDescription { get; set; }
        public string OrganizationName { get; set; }
        public string Author { get; set; }
        public string Number { get; set; }
        public string Name { get; set; }
        public string ClientName { get; set; }
        public string Status { get; set; }
        public string IssueDate { get; set; }
        public string BuildingType { get; set; }
        public string Major { get; set; }
        public string OtherProperties { get; set; }
    }

    public class TypeInfoInJson
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public string CategoryName { get; set; }
        public string FamilyId { get; set; }
        public string FamilyName { get; set; }
        public string FamilyType { get; set; }
        public string OtherProperties { get; set; }
    }

    public class ElementInfoInJson
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public string CategoryName { get; set; }
        public string FamilyId { get; set; }
        public string FamilyName { get; set; }
        public string FamilyType { get; set; }
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        public string OtherProperties { get; set; }
    }
}
