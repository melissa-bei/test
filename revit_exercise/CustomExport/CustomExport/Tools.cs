using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autodesk.Revit;
using Autodesk.Revit.DB;
using Autodesk.RevitAddIns;

namespace CustomExport
{
    class Tools
    {
        static FilteredElementCollector GetAllElement(Document document)
        {
            FilteredElementCollector collectorAll = new FilteredElementCollector(document);
            collectorAll.WherePasses(new LogicalOrFilter(new ElementIsElementTypeFilter(false), new ElementIsElementTypeFilter(true)));
            return collectorAll;
        }

        public static IEnumerable<View> FindAllViewsThatCanDisplayElements(Document doc)
        {
            ElementMulticlassFilter filter = new ElementMulticlassFilter(new List<Type> { typeof(ViewPlan) });

            return new FilteredElementCollector(doc)
                .WherePasses(filter)
                .Cast<View>()
                .Where(v => !v.IsTemplate && v.CanBePrinted);
        }

        /// <summary>
        /// 获取一个parameter的值
        /// </summary>
        /// <param name="param"></param>
        /// <param name="document"></param>
        /// <returns></returns>
        public static String GetParameterInformation(Parameter param, Document document)
        {
            string defValue = string.Empty;
            //根据存储类型使用不同方法获取参数
            switch (param.StorageType)
            {
                case StorageType.Double:
                    //把浮点数转化为字符
                    defValue = param.AsValueString();
                    break;
                case StorageType.ElementId:
                    //根据Id获取图元名称
                    ElementId Id = param.AsElementId();
                    if (Id.IntegerValue >= 0)
                    {
                        defValue = document.GetElement(Id).Name;
                    }
                    else
                    {
                        defValue = Id.IntegerValue.ToString();
                    }
                    break;
                case StorageType.Integer:
                    //把整型转化为True和false
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
                    break;
                case StorageType.String:
                    defValue = param.AsString();
                    break;
                case StorageType.None:
                    defValue = param.AsValueString();
                    break;
                default:
                    defValue = "未知类型参数";
                    break;
            }
            if (defValue != null)
            {
                defValue = defValue.Replace("\n", " ").Replace("\r", " ");
            }
            //返回参数名+参数值
            return defValue;
        }
    }
}
