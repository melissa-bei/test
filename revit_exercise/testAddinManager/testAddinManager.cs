using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using Autodesk.Revit.UI.Selection;
using System;
using System.Collections;
using System.Collections.Generic;

namespace testAddinManager
{
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    public class CmdMain : IExternalCommand
    {
        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            try
            {
                GetSelectionElement(commandData, elements);
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
        public void GetSelectionElement(ExternalCommandData commandData, ElementSet elements)
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
                string info = "选中元素的ID：";
                string param_str = "";
                foreach (ElementId selId in selectionIds)
                {
                    //通过ActiveUIDocument.Document.GetElement()按Id查询到相应对象
                    Element item = uidoc.Document.GetElement(selId);
                    param_str += info + selId.ToString();

                    //遍历所有参数
                    foreach (Parameter param in item.Parameters)
                    {
                        //获取参数的值
                        param_str += "\t\n" + GetParameterInformation(param, uidoc.Document);
                    }
                    param_str += "\r\t\n";
                }
                TaskDialog.Show("all Selection", param_str);
            }
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


    //[Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    //public class AutoExport
    //{
    //    static readonly string[] Searchs = RevitProductUtility.GetAllInstalledRevitProducts().Select(x => x.InstallLocation).ToString();
    //    static AutoExport()
    //    {
    //        AddEnvironmentPaths(Searchs);
    //        //解析失败时调用
    //        AppDomain.CurrentDomain.AssemblyResolve += OnAssemblyResolve;
    //    }

    //    /// <summary>
    //    /// 主函数
    //    /// </summary>
    //    /// <param name="args"></param>
    //    static void Main(string[] args)
    //    {

    //    }


    //    /// <summary>
    //    /// 向系统中添加环境变量
    //    /// </summary>
    //    /// <param name="paths"></param>
    //    static void AddEnvironmentPaths(params string[] paths)
    //    {
    //        var path = new[] { Environment.GetEnvironmentVariable("PATH") ?? string.Empty };
    //        var newPath = string.Join(System.IO.Path.PathSeparator.ToString(), path.Concat(paths));
    //        Environment.SetEnvironmentVariable("PATH", newPath);
    //    }

    //    /// <summary>
    //    /// 程序加载失败
    //    /// </summary>
    //    /// <param name="sender"></param>
    //    /// <param name="args"></param>
    //    /// <returns></returns>
    //    private static Assembly OnAssemblyResolve(object sender, ResolveEventArgs args)
    //    {
    //        return args.RequestingAssembly;
    //    }
    //}


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


