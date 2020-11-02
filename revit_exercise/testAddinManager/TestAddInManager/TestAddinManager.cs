using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using Autodesk.Revit.UI.Selection;

namespace TestAddinManager
{
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    public class CmdMain : IExternalCommand
    {
        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            try
            {
                GetSelectionElement(commandData);
            }
            catch (Exception e)
            {
                message = e.Message;
                return Result.Failed;
            }
            return Result.Succeeded;
        }

        /// <summary>
        /// 显示选中图元的信息
        /// </summary>
        /// <param name="commandData"></param>
        /// <param name="elements"></param>
        private void GetSelectionElement(ExternalCommandData commandData)
        {
            UIApplication app = commandData.Application;
            UIDocument uidoc = app.ActiveUIDocument;
            Selection selection = uidoc.Selection;

            ICollection<ElementId> selectionIds = selection.GetElementIds(); //获取选中图元的ID
            if (selectionIds.Count == 0)
            {
                //没选中图元时，弹窗
                TaskDialog.Show("Revit", "没有选中任何元素！！");
            }
            else
            {
                string info = "选中元素的ID";
                StringBuilder param_str = new StringBuilder();
                foreach (ElementId selId in selectionIds)
                {
                    //通过ActiveUIDocument.Document.GetElement()按Id查询到相应对象
                    Element item = uidoc.Document.GetElement(selId);
                    param_str.AppendFormat("{0}:  {1}\t\r", info, selId.ToString());

                    //遍历Parameters中所有参数
                    //foreach (Parameter param in item.Parameters)
                    //{
                    //    //获取参数的值
                    //    param_str.AppendFormat("{0}\t\r", GetParameterInformation(param, uidoc.Document));
                    //}
                    foreach (PropertyInfo property in item.GetType().GetProperties())
                    {
                        try
                        {
                            //param_str.AppendFormat(GetPropertyValue(property, item));
                            param_str.AppendFormat("Property--{0}: {1}\t\n", property.Name, property.GetValue(item));
                        }
                        catch
                        {
                            continue;
                        }
                    }
                    foreach (MemberInfo member in item.GetType().GetMembers())
                    {
                        param_str.AppendFormat("Member--{0}\t\n", member.Name);
                    }
                    foreach (MethodInfo method in item.GetType().GetMethods())
                    {
                        param_str.AppendFormat("Method--{0}\t\n", method.Name);
                    }
                }
                TaskDialog.Show("all Selection", param_str.ToString());
            }
        }

        private String GetPropertyValue(PropertyInfo property, Element element)
        {
            StringBuilder param_str = new StringBuilder();
            string defName = property.Name;
            string defValue = string.Empty;

            if (defName == "Bounding Box")
            {
                return "";
            }
            else if (defName == "Document")
            {
                return "";
            }
            else if (defName == "Location")
            {
                return "";
            }
            else if (defName == "Parameters")
            {
                return "";
            }
            else if (defName == "Category")
            {
                return "";
            }
            else
            {
                defValue = property.GetValue(element, null).ToString();
                param_str.AppendFormat("{0}: {1}\t\n", defName, defValue);
            }
            return param_str.ToString();
        }

        /// <summary>
        /// 获取一个参数的值
        /// </summary>
        /// <param name="param"></param>
        /// <param name="document"></param>
        /// <returns></returns>
        private String GetParameterInformation(Parameter param, Document document)
        {
            string defName = param.Definition.Name + "\t: ";
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


    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    public class CmdDeleteObject : IExternalCommand
    {
        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            UIApplication app = commandData.Application;
            Document uidoc = app.ActiveUIDocument.Document;
            Selection sel = app.ActiveUIDocument.Selection;

            ElementSet delset = new ElementSet();
            //获取当前选中对象集合
            foreach (ElementId elementId in sel.GetElementIds())
            {
                delset.Insert(uidoc.GetElement(elementId));
            }

            if (delset.Size < 1)
            {
                message = "至少选中一个要被删除的对象";
                return Result.Cancelled;
            }

            bool error = true;
            try
            {
                error = true;
                //逐元素删除
                IEnumerator e = delset.GetEnumerator(); //枚举器
                bool MoveValue = e.MoveNext();
                while (MoveValue)
                {
                    Element component = e.Current as Element; //as是什么作用？可能是将枚举类型转换为原本的类型
                    uidoc.Delete(component.Id);
                    MoveValue = e.MoveNext();
                }
            }
            catch
            {
                //将不可删除的对象添加到elements中，都走到了这儿，有问题！！！！！！！！！！！！！
                foreach (Element c in delset)
                {
                    elements.Insert(c);
                }
                message = "对象不能被删除";
                return Result.Failed;
            }
            finally
            {
                if (error)
                {
                    TaskDialog.Show("Error", "Delete failed.");
                }
            }
            return Result.Succeeded;
        }
    }
}
