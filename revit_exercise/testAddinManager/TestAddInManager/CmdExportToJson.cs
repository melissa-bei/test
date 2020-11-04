using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Autodesk.Revit.DB;
using Autodesk.Revit.UI;


namespace TestAddInManager
{
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    class CmdExportToJson : IExternalCommand
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
                string jsonName = "info.json";
                string json = GenerateJson(selectElements, jsonName, commandData);

                //在桌面创建json文件
                string filePath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\info.json";
                if (!File.Exists(filePath))
                {
                    FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.ReadWrite);
                    fs.Close();
                }
                //写入json文件
                File.WriteAllText(filePath, json);
            }
            catch (Exception e)
            {
                message = e.Message;
                return Result.Failed;
            }
            TaskDialog.Show("ExportToJson", "导出成功");
            return Result.Succeeded;
        }

        /// <summary>
        /// 生成json格式
        /// </summary>
        /// <param name="selectElements"></param>
        /// <param name="jsonName"></param>
        /// <returns></returns>
        private string GenerateJson(List<Element> selectElements, string jsonName, ExternalCommandData commandData)
        {
            UIDocument uidocument = commandData.Application.ActiveUIDocument;

            StringBuilder json = new StringBuilder();
            string indentLevel0 = "";
            string indentLevel1 = "\t";
            string indentLevel2 = "\t\t";
            string indentLevel3 = "\t\t\t";

            json.Append(indentLevel0 + "{" + "\n");
            json.Append(indentLevel1 + "\"Elements\": " + "\n");

            PropertyInfo[] infos = selectElements[0].GetType().GetProperties();
            if (selectElements.Count > 0)
            {
                foreach (Element element in selectElements)
                {
                    json.Append(indentLevel1 + "{" + "\n");
                    //写入elementId
                    json.Append(indentLevel2 + "\"Element\":\t" + element.Id.ToString() + "\n");
                    //写入Property
                    json.Append(indentLevel2 + "\"Property\":\t" + "\n");
                    json.Append(indentLevel2 + "{" + "\n");
                    try
                    {
                        foreach (PropertyInfo property in infos)
                        {
                            json.Append(indentLevel3 + "\"" + property.Name + " \":\t" + GetPropertyValue(property, element, uidocument) + "," + "\n");
                        }
                    }
                    catch
                    {
                        continue;
                    }
                    finally
                    {
                        json.Remove(json.Length - 3, 3);
                        json.Append(indentLevel3 + "\n");
                    }
                    json.Append(indentLevel2 + "}," + "\n");
                    //写入Paramter
                    json.Append(indentLevel2 + "\"Paramters\":" + "\n");
                    json.Append(indentLevel2 + "{" + "\n");
                    try
                    {
                        foreach (Parameter param in element.Parameters)
                        {
                            //获取参数的值
                            json.Append(indentLevel3 + "\"" + param.Definition.Name + " \":\t" + GetParameterInformation(param, uidocument) + "," + "\n");
                        }
                    }
                    catch
                    {
                        continue;
                    }
                    finally
                    {
                        int T = json.ToString().LastIndexOf(",\n");
                        json.Remove(json.Length - 3, 3);
                        json.Append(indentLevel3 + "\n");
                    }
                    json.Append(indentLevel2 + "}" + "\n");
                    //写入Member
                    json.Append(indentLevel2 + "\"Member\":\t" + "\n");
                    json.Append(indentLevel2 + "{" + "\n");
                    foreach (MemberInfo member in element.GetType().GetMembers())
                    {

                        json.Append(indentLevel3 + "\"" + member.Name + "\"\t" + "-" + "," + "\n");
                    }
                    json.Append(indentLevel2 + "}" + "\n");
                    //写入Method
                    json.Append(indentLevel2 + "\"Member\":\t" + "\n");
                    json.Append(indentLevel2 + "{" + "\n");
                    foreach (MethodInfo method in element.GetType().GetMethods())
                    {
                        json.Append(indentLevel3 + "\"" + method.Name + "\"\t" + "-" + "," + "\n");
                    }
                    json.Append(indentLevel2 + "}" + "\n");

                    json.Append(indentLevel1 + "}" + "\n");
                }
            }            
            json.Append(indentLevel0 + "}");            
            return json.ToString();
        }

        /// <summary>
        /// 获取property的值
        /// </summary>
        /// <param name="property"></param>
        /// <param name="element"></param>
        /// <returns></returns>
        private String GetPropertyValue(PropertyInfo property, Element element, UIDocument uidocument)
        {
            StringBuilder param_str = new StringBuilder();
            string defName = property.Name;
            string defValue = string.Empty;

            try
            {
                if (defName == "Bounding Box")
                {
                    param_str.AppendFormat(property.GetValue(element, new object[1] { uidocument.ActiveView }).ToString());
                }
                else if (defName == "Geometry")
                {
                    param_str.AppendFormat(property.GetValue(element, new object[1] { new Options() }).ToString());
                }
                else if (defName == "Document") { }
                else if (defName == "Parameters") { }
                else if (defName == "Category")
                {
                    foreach (PropertyInfo p in property.GetType().GetProperties())
                    {
                        param_str.AppendFormat(GetPropertyValue(p, element, uidocument));
                    }
                }
                else
                {
                    defValue = property.GetValue(element, null).ToString();
                    param_str.AppendFormat(defValue);
                }
            }
            catch
            {
                return "-";
            }
            return param_str.ToString();
        }

        /// <summary>
        /// 获取一个parameter的值
        /// </summary>
        /// <param name="param"></param>
        /// <param name="document"></param>
        /// <returns></returns>
        private String GetParameterInformation(Parameter param, UIDocument uidocument)
        {
            Document document = uidocument.Document;
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
            return defValue;
        }
    }
}
