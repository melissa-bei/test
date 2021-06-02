using Autodesk.Revit.DB;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;

namespace TestAddInManager
{
    public class MyExportJsonContext : IExportContext //IModelExportContext
    {
        #region fields

        Document _doc;
        FileInfo jsonPath;//导出json的路径

        Dictionary<string, string> _ProjectDict = new Dictionary<string, string>();
        List<Dictionary<string, string>> _TypeList = new List<Dictionary<string, string>>();
        List<ElementId> _TypeIds = new List<ElementId>();
        List<Dictionary<string, string>> _ElementList = new List<Dictionary<string, string>>();

        Dictionary<string, object> _dicts = new Dictionary<string, object>();

        #endregion

        #region constructor
        public MyExportJsonContext(Document doc, FileInfo jsonPath)
        {
            this._doc = doc;
            this.jsonPath = jsonPath;
        }
        #endregion

        #region methods
        public bool Start()
        {
            //获取所有的project_info
            _ProjectDict.Add("FileName", Path.GetFileName(_doc.PathName));
            string FilePath = string.Empty;
            try
            {
                FilePath = System.Text.RegularExpressions.Regex.Escape(Path.GetDirectoryName(_doc.PathName).Substring(Paths.UNEXPORTED_DIR.Length + 1));
            }
            catch { }
            _ProjectDict.Add("FilePath", FilePath);
            _ProjectDict.Add("Elevation", _doc.SiteLocation.Elevation.ToString());
            const double angleRatio = Math.PI / 180;
            _ProjectDict.Add("Latitude", (_doc.SiteLocation.Latitude / angleRatio).ToString());
            _ProjectDict.Add("Longitude", (_doc.SiteLocation.Longitude / angleRatio).ToString());
            _ProjectDict.Add("PlaceName", _doc.SiteLocation.PlaceName);
            _ProjectDict.Add("TimeZone", _doc.SiteLocation.TimeZone.ToString());
            _ProjectDict.Add("WeatherStationName", _doc.SiteLocation.WeatherStationName);

            _ProjectDict.Add("OrganizationDescription", _doc.ProjectInformation.OrganizationDescription);
            _ProjectDict.Add("OrganizationName", _doc.ProjectInformation.OrganizationName);
            _ProjectDict.Add("BuildingName", _doc.ProjectInformation.BuildingName);
            _ProjectDict.Add("Author", _doc.ProjectInformation.Author);
            _ProjectDict.Add("Number", _doc.ProjectInformation.Number);
            _ProjectDict.Add("Name", _doc.ProjectInformation.Name);
            _ProjectDict.Add("Address", _doc.ProjectInformation.Address);
            _ProjectDict.Add("ClientName", _doc.ProjectInformation.ClientName);
            _ProjectDict.Add("Status", _doc.ProjectInformation.Status);
            _ProjectDict.Add("IssueDate", _doc.ProjectInformation.IssueDate);
            _ProjectDict.Add("BuildingType", null);
            _ProjectDict.Add("Major", null);

            Dictionary<string, string> others = new Dictionary<string, string>();
            GetParameterMapInformation(_doc.ProjectInformation.ParametersMap, others);
            _ProjectDict.Add("OtherProperties", JsonConvert.SerializeObject(others));

            return true;
        }

        public void Finish()
        {
            //Serialize
            _dicts.Add("project_info", _ProjectDict);
            _dicts.Add("type_info", _TypeList);
            _dicts.Add("element_info", _ElementList);
            if (_ProjectDict.Count == 0 && _TypeList.Count == 0 && _ElementList.Count == 0)
                throw new IOException("The exported content is empty.");
            string jsonStr = JsonConvert.SerializeObject(_dicts);

            Directory.CreateDirectory(jsonPath.Directory.FullName);
            File.WriteAllText(jsonPath.FullName, jsonStr);
        }

        public Dictionary<string, object> GetData()
        {
            return _dicts;
        }

        public bool IsCanceled()
        {
            return false;
        }

        public RenderNodeAction OnCurve(CurveNode node)
        {
            return RenderNodeAction.Skip;
        }

        public RenderNodeAction OnElementBegin(ElementId elementId)
        {
            try
            {
                if (null == elementId && elementId == ElementId.InvalidElementId)
                    return RenderNodeAction.Skip;

                Element elem = this._doc.GetElement(elementId);
                if (null == elem)///图元异常 跳过
                    return RenderNodeAction.Skip;
                
                if (elem.Category != null && elem.Category.CategoryType != CategoryType.Model)///非模型类别 跳过
                    return RenderNodeAction.Skip;

                ///1.图元
                Dictionary<string, string> elementInfo = new Dictionary<string, string>();
                /// record Element
                elementInfo.Add("Id", elem.UniqueId);
                elementInfo.Add("Name", elem.Name);
                Dictionary<string, string> others = new Dictionary<string, string>();
                GetParameterMapInformation(elem.ParametersMap, others);
                elementInfo.Add("OtherProperties", JsonConvert.SerializeObject(others));

                ///2.类型
                var typeId = elem.GetTypeId();
                ElementType elementType = null;
                Dictionary<string, string> typeInfo = new Dictionary<string, string>();
                if (null != typeId && typeId != ElementId.InvalidElementId)
                {
                    elementType = this._doc.GetElement(typeId) as ElementType;
                    if (null != elementType)
                    {
                        elementInfo["TypeId"] = elementType.UniqueId;
                        elementInfo["TypeName"] = elementType.Name;
                        if (!_TypeIds.Contains(elementType.Id))
                        {
                            _TypeIds.Add(elementType.Id);
                            /// record Type
                            typeInfo.Add("Id", elementType.UniqueId);
                            typeInfo.Add("Name", elementType.Name);
                            others.Clear();
                            GetParameterMapInformation(elementType.ParametersMap, others);
                            typeInfo.Add("OtherProperties", JsonConvert.SerializeObject(others));
                            this._TypeList.Add(typeInfo);
                        }
                    }
                }

                ///3.族
                Dictionary<string, string> familyInfo = new Dictionary<string, string>();
                if (elem is HostObject)
                { /// 系统族
                    if (null != elementType)
                    {
                        /// record Family
                        elementInfo["FamilyName"] = elementType.FamilyName;
                        elementInfo["FamilyType"] = "HostObject";

                        typeInfo["FamilyName"] = elementType.FamilyName;
                        typeInfo["FamilyType"] = "HostObject";
                    }
                }
                else if (elem is FamilyInstance)
                { /// 载入族
                    if (null != elementType && elementType is FamilySymbol)
                    {
                        var familySymbol = elementType as FamilySymbol;
                        if (null != familySymbol && null != familySymbol.Family)
                        {
                            /// record Family
                            elementInfo["FamilyId"] = familySymbol.Family.UniqueId;
                            elementInfo["FamilyName"] = familySymbol.Family.Name;
                            elementInfo["FamilyType"] = "FamilyInstance";

                            typeInfo["FamilyId"] = familySymbol.Family.UniqueId;
                            typeInfo["FamilyName"] = familySymbol.Family.Name;
                            typeInfo["FamilyType"] = "FamilyInstance";
                        }
                    }
                }
                else
                { /// 内建族 或者 其他类型的族
                    if (null != elementType)
                    {
                        /// record Family
                        elementInfo["FamilyName"] = elementType.FamilyName;
                        elementInfo["FamilyType"] = "Other";

                        typeInfo["FamilyName"] = elementType.FamilyName;
                        typeInfo["FamilyType"] = "Other";
                    }
                }

                ///4.类别
                if (elem.Category != null)
                {
                    var builtInCate = (BuiltInCategory)elem.Category.Id.IntegerValue;
                    Category category = Category.GetCategory(_doc, builtInCate);
                    if (null != category)
                    {
                        /// record Category
                        elementInfo["Category"] = builtInCate.ToString();
                        elementInfo["CategoryName"] = category.Name;

                        typeInfo["Category"] = builtInCate.ToString();
                        typeInfo["CategoryName"] = category.Name;
                    }
                }
                this._ElementList.Add(elementInfo);
            }
            catch
            {
                return RenderNodeAction.Skip; /// 处理异常就跳过
            }

            return RenderNodeAction.Proceed;
        }

        /// <summary>
        /// 将ParameterMap中的所有参数和值抽取成字典
        /// </summary>
        /// <param name="parameters"></param>
        /// <param name="kvps"></param>
        public void GetParameterMapInformation(ParameterMap parameters, Dictionary<string, string> kvps)
        {
            foreach (Parameter param in parameters)
            {
                try
                {
                    InternalDefinition def = param.Definition as InternalDefinition;
                    string value = GetParameterInformation(param, _doc);
                    if (value != null && def.BuiltInParameter != BuiltInParameter.INVALID)
                    {
                        kvps.Add(def.BuiltInParameter.ToString(), value);
                    }
                }
                catch { }
            }
        }

        /// <summary>
        /// 获取一个parameter的值
        /// </summary>
        /// <param name="param"></param>
        /// <param name="document"></param>
        /// <returns></returns>
        public string GetParameterInformation(Parameter param, Document document)
        {
            string defValue = null;

            switch (param.StorageType)
            {
                case StorageType.Double:
                    defValue = param.AsValueString();
                    break;
                case StorageType.ElementId:
                    ElementId Id = param.AsElementId();
                    if (param.Definition.Name.Contains("_ID"))
                    {
                        if (Id.IntegerValue >= 0)
                        {
                            defValue = document.GetElement(Id).UniqueId.ToString();
                        }
                        else
                        {
                            defValue = Id.ToString();
                        }
                    }
                    else if (Id.IntegerValue >= 0)
                    {
                        defValue = document.GetElement(Id).Name;
                    }
                    else
                    {
                        var builtInCate = (BuiltInCategory)Id.IntegerValue;
                        defValue = builtInCate.ToString();
                    }
                    break;
                case StorageType.Integer:
                    if (param.Definition.ParameterType == ParameterType.YesNo)
                    {
                        if (param.AsInteger() == 0)
                        {
                            defValue = "False";
                        }
                        else
                        {
                            defValue = "True";
                        }
                    }
                    else
                    {
                        defValue = param.AsInteger().ToString();
                    }
                    break;
                case StorageType.String:
                    defValue = param.AsString();
                    break;
                default:
                    defValue = null;
                    break;
            }
            if (defValue == "" | default == "null" | defValue == null)
            {
                defValue = null;
            }
            if (defValue != null)
            {
                defValue = defValue.Replace("\n", " ").Replace("\r", " ");
            }

            return defValue;
        }

        public void OnElementEnd(ElementId elementId)
        {
        }

        public RenderNodeAction OnFaceBegin(FaceNode node)
        {
            return RenderNodeAction.Skip;
        }

        public void OnFaceEnd(FaceNode node)
        {
        }

        public RenderNodeAction OnInstanceBegin(InstanceNode node)
        {
            return RenderNodeAction.Proceed;
        }

        public void OnInstanceEnd(InstanceNode node)
        {
        }

        public void OnLight(LightNode node)
        {
        }

        public void OnLineSegment(LineSegment segment)
        {
        }

        public RenderNodeAction OnLinkBegin(LinkNode node)
        {
            return RenderNodeAction.Skip;
        }

        public void OnLinkEnd(LinkNode node)
        {
        }

        public void OnMaterial(MaterialNode node)
        { }

        public RenderNodeAction OnPoint(PointNode node)
        {
            return RenderNodeAction.Skip;
        }

        public RenderNodeAction OnPolyline(PolylineNode node)
        {
            return RenderNodeAction.Skip;
        }

        public void OnPolylineSegments(PolylineSegments segments)
        {
        }

        public void OnPolymesh(PolymeshTopology node)
        {
        }

        public void OnRPC(RPCNode node)
        {
        }

        public void OnText(TextNode node)
        {
        }

        public RenderNodeAction OnViewBegin(ViewNode node)
        {
            return RenderNodeAction.Proceed;
        }

        public void OnViewEnd(ElementId elementId)
        {
        }

        #endregion
    }
}
