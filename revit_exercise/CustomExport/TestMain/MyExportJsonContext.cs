using Autodesk.Revit.DB;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;

namespace TestMain
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
            string file_name = Path.GetFileName(_doc.PathName).Split('.')[0];
            file_name = file_name.Replace("_已分离", "");
            //获取所有的project_info
            _ProjectDict["FileName"] = file_name;
            string FilePath = string.Empty;
            try
            {
                FilePath = System.Text.RegularExpressions.Regex.Escape(Path.GetDirectoryName(_doc.PathName).Substring(Paths.UNEXPORTED_DIR.Length + 1));
            }
            catch
            {
                Console.WriteLine($"{Tools.GetTimeStamp()}Failed to get the path of {_doc.PathName}!");
            }

            _ProjectDict["FilePath"] = FilePath;
            _ProjectDict["Elevation"] = _doc.SiteLocation.Elevation.ToString();
            const double angleRatio = Math.PI / 180;
            _ProjectDict["Latitude"] = (_doc.SiteLocation.Latitude / angleRatio).ToString();
            _ProjectDict["Longitude"] = (_doc.SiteLocation.Longitude / angleRatio).ToString();
            _ProjectDict["PlaceName"] = _doc.SiteLocation.PlaceName;
            _ProjectDict["TimeZone"] = _doc.SiteLocation.TimeZone.ToString();
            _ProjectDict["WeatherStationName"] = _doc.SiteLocation.WeatherStationName;

            _ProjectDict["OrganizationDescription"] = _doc.ProjectInformation.OrganizationDescription;
            _ProjectDict["OrganizationName"] = _doc.ProjectInformation.OrganizationName;
            _ProjectDict["BuildingName"] = _doc.ProjectInformation.BuildingName;
            _ProjectDict["Author"] = _doc.ProjectInformation.Author;
            _ProjectDict["Number"] = _doc.ProjectInformation.Number;
            _ProjectDict["Name"] = _doc.ProjectInformation.Name;
            _ProjectDict["Address"] = _doc.ProjectInformation.Address;
            _ProjectDict["ClientName"] = _doc.ProjectInformation.ClientName;
            _ProjectDict["Status"] = _doc.ProjectInformation.Status;
            _ProjectDict["IssueDate"] = _doc.ProjectInformation.IssueDate;
            _ProjectDict["BuildingType"] = "";
            _ProjectDict["Major"] = "";

            Dictionary<string, string> others = new Dictionary<string, string>();
            GetParameterMapInformation(_doc.ProjectInformation.ParametersMap, others);
            _ProjectDict["OtherProperties"] = JsonConvert.SerializeObject(others);

            return true;
        }

        public void Finish()
        {
            //Serialize
            _dicts["project_info"] = _ProjectDict;
            _dicts["type_info"] = _TypeList;
            _dicts["element_info"] = _ElementList;
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
                elementInfo["Id"] = elem.UniqueId;
                elementInfo["Name"] = elem.Name;
                Dictionary<string, string> others = new Dictionary<string, string>();
                GetParameterMapInformation(elem.ParametersMap, others);
                elementInfo["OtherProperties"] = JsonConvert.SerializeObject(others);

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
                        if (elementType.Name == "三维视图")
                        {
                            return RenderNodeAction.Skip;  /// 三维视图就跳过
                        }
                        elementInfo["TypeName"] = elementType.Name;
                        if (!_TypeIds.Contains(elementType.Id))
                        {
                            _TypeIds.Add(elementType.Id);
                            /// record Type
                            typeInfo["Id"] = elementType.UniqueId;
                            typeInfo["Name"] = elementType.Name;
                            others.Clear();
                            GetParameterMapInformation(elementType.ParametersMap, others);
                            typeInfo["OtherProperties"] = JsonConvert.SerializeObject(others);
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

        public RenderNodeAction OnLinkBegin(LinkNode node)
        {
            return RenderNodeAction.Skip;
        }

        public void OnLinkEnd(LinkNode node)
        {
        }

        public void OnMaterial(MaterialNode node)
        { }

        public void OnPolymesh(PolymeshTopology node)
        {
        }

        public void OnRPC(RPCNode node)
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
