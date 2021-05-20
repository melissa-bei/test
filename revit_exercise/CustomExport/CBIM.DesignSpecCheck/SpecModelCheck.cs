using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;

namespace CBIM.DesignSpecCheck
{
    class SpecModelCheck
    {
        public SpecModelCheck(UIDocument uidoc)
        {
            RvtDoc = uidoc.Document;
            RvtUIDoc = uidoc;

            CheckReltList = new ObservableCollection<CheckReltData>();
            EqualList = new List<CheckReltData>();
            NullValueList = new List<CheckReltData>();

            ParamDict = LoadExcelSpecParams();
            ExcuteModelCheck();
        }

        public void HightlightSelectedItem(CheckReltData curData)
        {
            if (curData is null) return;

            if (curData.ElemId != null)
            {
                RvtUIDoc.Selection.SetElementIds(new List<ElementId> { curData.ElemId });
                RvtUIDoc.ShowElements(curData.ElemId);
            }
        }

        public void AddOrDelEqualItems(Boolean isHide = false)
        {
            foreach (var item in EqualList)
            {
                if (isHide)
                    CheckReltList.Remove(item);
                else
                    CheckReltList.Add(item);
            }
        }

        public void AddOrDelNullItems(Boolean isHide = false)
        {
            foreach (var item in NullValueList)
            {
                if (isHide)
                    CheckReltList.Remove(item);
                else
                    CheckReltList.Add(item);
            }
        }

        void ExcuteModelCheck()
        {
            foreach (var item in CheckConfig)
            {
                String val = "";
                var isExist = ParamDict.TryGetValue(item.Key, out val);
                if (!isExist || String.IsNullOrEmpty(val))
                { // 暂不不支持核查
                    continue;
                }

                foreach (var cate in item.Value)
                {
                    CheckOneCategoryElems(cate, item.Key, val);
                }
            }
        }

        void CheckOneCategoryElems(BuiltInCategory cate, String paramName, String paramValue)
        {
            var colt = new FilteredElementCollector(RvtDoc);
            colt.OfCategory(cate).WhereElementIsNotElementType();

            Dictionary<int, Element> typeDict = new Dictionary<int, Element>();
            foreach (var elem in colt)
            {
                var isFind = false;
                var familyAndTypeStr = elem.get_Parameter(BuiltInParameter.ELEM_FAMILY_AND_TYPE_PARAM).AsValueString();
                ParameterSet instParams = elem.Parameters;
                foreach (Parameter p in instParams)
                {
                    if (p.Definition.Name.Contains(paramName) ||
                        paramName.Contains(p.Definition.Name))
                    {
                        var val = p.AsValueString();
                        if (p.StorageType == StorageType.String && !String.IsNullOrEmpty(p.AsString()))
                            val = p.AsString();

                        CheckReltData checkReltData = new CheckReltData()
                        {
                            ElemId = elem.Id,
                            ParamName = paramName,
                            SpecValue = paramValue,
                            ModelValue = "<-未设置->",
                            ModelElemInfo = $"Id: {elem.Id}; {familyAndTypeStr}"
                        };

                        if (String.IsNullOrEmpty(val))
                        { // 空值，未设置
                            checkReltData.CheckRelt = "<-未设置->";
                            this.NullValueList.Add(checkReltData);
                        }
                        else
                        { // 有值的情况下，进行核查
                            checkReltData.ModelValue = val;

                            if (val.Contains(paramValue) ||
                                paramValue.Contains(val))
                            {
                                checkReltData.CheckRelt = "一致";
                                this.EqualList.Add(checkReltData);
                            }
                            else
                            {
                                checkReltData.CheckRelt = "不一致";
                            }
                        }
                        CheckReltList.Add(checkReltData);
                        isFind = true;
                        break;
                    }
                }

                if (isFind)
                {
                    continue;
                }

                ParameterSet typeParams = null;
                Element type = null;
                if (typeDict.ContainsKey(elem.GetTypeId().IntegerValue))
                {
                    type = typeDict[elem.GetTypeId().IntegerValue];
                }
                else
                {
                    type = RvtDoc.GetElement(elem.GetTypeId());
                    if (null != type)
                        typeDict.Add(elem.GetTypeId().IntegerValue, type);
                }

                if (type != null)
                    typeParams = type.Parameters;

                if (typeParams is null) continue;

                foreach (Parameter p in typeParams)
                {
                    var name = p.Definition.Name;
                    if (name == "气密性能") name = "气密性";
                    if (name == "水密性能") name = "水密性";

                    if (name.Contains(paramName) ||
                        paramName.Contains(name))
                    {
                        var val = p.AsValueString();
                        if (p.StorageType == StorageType.String && !String.IsNullOrEmpty(p.AsString()))
                            val = p.AsString();

                        CheckReltData checkReltData = new CheckReltData()
                        {
                            ElemId = elem.Id,
                            ParamName = paramName,
                            SpecValue = paramValue,
                            ModelValue = "<-未设置->",
                            ModelElemInfo = $"Id: {elem.Id}; {familyAndTypeStr}"
                        };

                        if (String.IsNullOrEmpty(val))
                        { // 空值，未设置
                            checkReltData.CheckRelt = "不一致";
                            this.NullValueList.Add(checkReltData);
                        }
                        else
                        { // 有值的情况下，进行核查
                            checkReltData.ModelValue = val;

                            if (val.Contains(paramValue) ||
                                paramValue.Contains(val))
                            {
                                checkReltData.CheckRelt = "一致";
                                this.EqualList.Add(checkReltData);
                            }
                            else
                            {
                                checkReltData.CheckRelt = "不一致";
                            }
                        }

                        CheckReltList.Add(checkReltData);
                        isFind = true;
                        break;
                    }
                }
            }
        }

        private Dictionary<String, String> LoadExcelSpecParams()
        {
            Dictionary<String, String> paramDict = new Dictionary<string, string>();
            /// 打开文件
            FileOpenDialog fileOpenDialog = new FileOpenDialog("Excel files|*.xlsx");
            fileOpenDialog.Title = "请选择清洗后的设计说明参数 Excel 文件";
            var relt = fileOpenDialog.Show();

            if (relt == ItemSelectionDialogResult.Confirmed)
            {
                var modelPath = fileOpenDialog.GetSelectedModelPath();
                var excelPath = ModelPathUtils.ConvertModelPathToUserVisiblePath(modelPath);
                // TaskDialog.Show("CBIM", $"Selected File Path: \n{localPath}");

                ExcelHelper excelTool = new ExcelHelper(excelPath);
                var tabDict = excelTool.ExcelToDataTable(true);

                var tab = tabDict.Values.FirstOrDefault();
                if (tab is null) return paramDict;

                String tabStr = "";
                for (int i = 0; i < tab.Rows.Count; ++i)
                {
                    var group = tab.Rows[i][1].ToString();
                    var name = tab.Rows[i][2].ToString();
                    var value = tab.Rows[i][3].ToString().Replace("\n", "");

                    if (!String.IsNullOrEmpty(name) && !String.IsNullOrEmpty(value))
                    {
                        tabStr += $"{name}: {value}\n";
                        if (!paramDict.ContainsKey(name))
                        {
                            paramDict.Add(name, value);
                        }
                    }
                }

                // TaskDialog.Show("CBIM", tabStr);
            }

            return paramDict;
        }

        private Document RvtDoc;
        private UIDocument RvtUIDoc;
        private Dictionary<String, String> ParamDict;

        private ObservableCollection<CheckReltData> checkReltDatas;

        public ObservableCollection<CheckReltData> CheckReltList
        {
            get { return checkReltDatas; }
            set { checkReltDatas = value; }
        }

        private List<CheckReltData> EqualList;
        private List<CheckReltData> NullValueList;

        readonly Dictionary<String, List<BuiltInCategory>> CheckConfig = new Dictionary<String, List<BuiltInCategory>>
        {
            {
                "抗渗等级",
                new List<BuiltInCategory>
                {
                    BuiltInCategory.OST_Walls,
                    BuiltInCategory.OST_StructuralColumns,
                    BuiltInCategory.OST_StructuralFraming
                }
            },
            {
                "外门窗-气密性",
                new List<BuiltInCategory>
                {
                    BuiltInCategory.OST_Doors,
                    BuiltInCategory.OST_Windows
                }
            },
            {
                "外门窗-水密性",
                new List<BuiltInCategory>
                {
                    BuiltInCategory.OST_Doors,
                    BuiltInCategory.OST_Windows
                }
            },
        };

    }

    class CheckReltData
    {
        /// <summary>
        /// 参数名称
        /// </summary>
        public String ParamName { get; set; }

        /// <summary>
        /// 设计说明参数值
        /// </summary>
        public String SpecValue { get; set; }

        /// <summary>
        /// 实际模型参数值
        /// </summary>
        public String ModelValue { get; set; }

        /// <summary>
        /// 模型构件信息
        /// </summary>
        public String ModelElemInfo { get; set; }

        /// <summary>
        /// 核查结果
        /// </summary>
        public String CheckRelt { get; set; }

        public ElementId ElemId { get; internal set; }
    }

}
