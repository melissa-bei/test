using Autodesk.Revit.DB;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;

namespace CustomExport
{
    public class MyExportJsonContext : IExportContext //IModelExportContext
    {
        #region fields

        Document _doc;
        FileInfo rvtPath;//rvt的路径
        DirectoryInfo jsonDir = new DirectoryInfo(Path.Combine(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "exportedjson")));//所有json文件导出的根目录
        FileInfo jsonPath;//导出json的路径

        Dictionary<string, string> _ProjectDict = new Dictionary<string, string>();
        Dictionary<string, Dictionary<string, string>> _TypeDict = new Dictionary<string, Dictionary<string, string>>();
        Dictionary<string, Dictionary<string, string>> _ElementDict = new Dictionary<string, Dictionary<string, string>>();

        Dictionary<string, object> _dicts = new Dictionary<string, object>();

        #endregion

        #region constructor
        /// <summary>
        /// 
        /// </summary>
        /// <param name="doc"></param>
        /// <param name="rvtPath">需要导出的rvt文件的全路径</param>
        /// <param name="jsonDir">所有json文件导出的根目录，结合rvt相对于unexported文件夹的相对路径构成完整的json路径</param>
        public MyExportJsonContext(Document doc, FileInfo rvtPath, DirectoryInfo jsonDir)
        {
            this._doc = doc;
            this.rvtPath = rvtPath ?? new FileInfo(_doc.PathName);
            this.jsonDir = jsonDir ?? jsonDir;
            this.jsonPath = new FileInfo(Path.ChangeExtension(Path.Combine(jsonDir.FullName, rvtPath.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)), ".json"));

        }
        public MyExportJsonContext(Document doc, FileInfo rvtPath) : this(doc, rvtPath, null) { }
        public MyExportJsonContext(Document doc) : this(doc, null, null) { }
        #endregion

        #region methods
        public bool Start()
        {
            //获取所有的project_info
            _ProjectDict["FileName"] = rvtPath.Name.Replace("_已分离", "").Replace(".rvt", "");
            _ProjectDict["FilePath"] = System.Text.RegularExpressions.Regex.Escape(rvtPath.DirectoryName);
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
            _dicts["type_info"] = _TypeDict;
            _dicts["element_info"] = _ElementDict;
            if (_ProjectDict.Count == 0 && _TypeDict.Count == 0 && _ElementDict.Count == 0)
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
                if (null == elementId && elementId == ElementId.InvalidElementId)  ///无效id 跳过
                    return RenderNodeAction.Skip;

                Element elem = this._doc.GetElement(elementId);
                if (null == elem)  ///图元异常 跳过
                    return RenderNodeAction.Skip;
                if (elem.Category != null && elem.Category.CategoryType != CategoryType.Model)  ///非模型类别 跳过
                    return RenderNodeAction.Skip;
                if (_ElementDict.ContainsKey(elem.UniqueId))
                    return RenderNodeAction.Skip;  ///图元重复 跳过
                if (elem is ElementType)  ///类型跳过
                    return RenderNodeAction.Skip;
                if (elem is RevitLinkInstance)  ///链接模型跳过
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
                        if (!_TypeDict.ContainsKey(elementType.UniqueId))
                        {
                            /// record Type
                            typeInfo["Id"] = elementType.UniqueId;
                            typeInfo["Name"] = elementType.Name;
                            others.Clear();
                            GetParameterMapInformation(elementType.ParametersMap, others);
                            typeInfo["OtherProperties"] = JsonConvert.SerializeObject(others);
                        }
                    }
                }
                else
                {
                    return RenderNodeAction.Skip;  ///element没有有效type 跳过
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
                {
                    FamilyInstance fi = elem as FamilyInstance;
                    if (null != fi.Symbol && null != fi.Symbol.Family)
                    {
                        /// record Family
                        elementInfo["FamilyId"] = fi.Symbol.Family.UniqueId;
                        elementInfo["FamilyName"] = fi.Symbol.Family.Name;
                        elementInfo["SymbolName"] = fi.Symbol.Name;

                        typeInfo["FamilyId"] = fi.Symbol.Family.UniqueId;
                        typeInfo["FamilyName"] = fi.Symbol.Family.Name;
                        typeInfo["SymbolName"] = fi.Symbol.Name;

                        if (!fi.Symbol.CanBeCopied)  ///内建族
                        {
                            elementInfo["FamilyType"] = "BuiltInFamily";
                            typeInfo["FamilyType"] = "BuiltInFamily";
                        }
                        else  /// 载入族
                        {
                            elementInfo["FamilyType"] = "ImportFamily";
                            typeInfo["FamilyType"] = "ImportFamily";
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
                    if (builtInCate == BuiltInCategory.OST_RvtLinks)
                        Console.WriteLine();
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
                else
                {
                    elementInfo["Category"] = "Unknow";
                    elementInfo["CategoryName"] = "未知类别";
                    typeInfo["Category"] = "Unknow";
                    typeInfo["CategoryName"] = "未知类别";
                }
                if (elementType != null && !_TypeDict.ContainsKey(elementType.UniqueId))
                {
                    this._TypeDict.Add(elementType.UniqueId, typeInfo);
                }
                this._ElementDict.Add(elem.UniqueId, elementInfo);
            }
            catch
            {
                return RenderNodeAction.Skip; /// 处理异常 跳过
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
                    string value = GetParameterInformation(param, _doc);
                    InternalDefinition def = param.Definition as InternalDefinition;
                    if (value != null && def != null && def.BuiltInParameter != BuiltInParameter.INVALID)
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
