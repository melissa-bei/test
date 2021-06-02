using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace TestAddInManager
{
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    public class CmdPrintInfo : IExternalCommand
    {
        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            try
            {
                List<Element> selectElements = Tools.GetSelectElement(commandData);
                if (selectElements.Count == 0)
                {
                    return Result.Cancelled;
                }
                PrintElementsInfo(selectElements, commandData);
            }
            catch (Exception e)
            {
                message = e.Message;
                return Result.Failed;
            }
            return Result.Succeeded;
        }

        /// <summary>
        /// 弹窗打印List中图元的信息
        /// </summary>
        /// <param name="selectElements"></param>
        /// <param name="commandData"></param>
        private void PrintElementsInfo(List<Element> selectElements, ExternalCommandData commandData)
        {
            Document doc = commandData.Application.ActiveUIDocument.Document;

            StringBuilder param_str = new StringBuilder();
            foreach (Element element in selectElements)
            {
                string info = "选中图元的信息如下：";
                param_str.AppendFormat("{0}\t\r", info);

                //遍历Parameters中所有参数
                foreach (Parameter param in element.Parameters)
                {
                    //获取参数的值
                    param_str.AppendFormat("Paramter--{0}\t\r", GetParameterInformation(param, doc));
                }
                foreach (PropertyInfo property in element.GetType().GetProperties())
                {
                    try
                    {
                        param_str.AppendFormat(GetPropertyValue(property, element));
                        //param_str.AppendFormat("Property--{0}: {1}\t\n", property.Name, property.GetValue(item));
                    }
                    catch
                    {
                        continue;
                    }
                }
                foreach (MemberInfo member in element.GetType().GetMembers())
                {
                    param_str.AppendFormat("Member--{0}\t\n", member.Name);
                }
                foreach (MethodInfo method in element.GetType().GetMethods())
                {
                    param_str.AppendFormat("Method--{0}\t\n", method.Name);
                }
            }
            TaskDialog.Show("all Selection", param_str.ToString());
        }

        private String GetPropertyValue(PropertyInfo property, Element element)
        {
            StringBuilder param_str = new StringBuilder();
            string defName = property.Name;
            string defValue = string.Empty;

            try
            {
                if (defName == "Bounding Box")
                {
                    param_str.AppendFormat(property.GetValue(element, new object[1] { new Options() }).ToString());
                }
                else if (defName == "Document") { }
                else if (defName == "Parameters") { }
                else if (defName == "Category")
                {
                    foreach (PropertyInfo p in property.GetType().GetProperties())
                    {
                        param_str.AppendFormat(GetPropertyValue(p, element));
                    }
                }
                else
                {
                    defValue = property.GetValue(element, null).ToString();
                    param_str.AppendFormat("{0}:  {1}\t\n", defName, defValue);
                }
            }
            catch
            {
                return "";
            }
            return "Property--" + param_str.ToString();
        }

        /// <summary>
        /// 获取一个参数的值
        /// </summary>
        /// <param name="param"></param>
        /// <param name="document"></param>
        /// <returns></returns>
        private String GetParameterInformation(Parameter param, Document document)
        {
            string defName = param.Definition.Name + "\t:  ";
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
                default:
                    defValue = "未知类型参数";
                    break;
            }
            //返回参数名+参数值
            return defName + defValue;
        }
    }
}
