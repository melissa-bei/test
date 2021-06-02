using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using Autodesk.Revit.UI.Selection;
using System;
using System.Collections.Generic;
using System.Text;


namespace TestAddInManager
{
    class Tools
    {
        /// <summary>
        /// 获取选中图元
        /// </summary>
        /// <param name="commandData"></param>
        /// <returns></returns>
        public static List<Element> GetSelectElement(ExternalCommandData commandData)
        {
            UIDocument uidoc = commandData.Application.ActiveUIDocument;
            Selection selection = uidoc.Selection;

            ICollection<ElementId> selectIds = selection.GetElementIds(); //获取选中图元的ID
            List<Element> selectElements = new List<Element>(); //创建了一个空列表
            if (selectIds.Count == 0)
            {
                //没选中图元时，弹窗
                TaskDialog.Show("Revit", "没有选中任何元素！！");
            }
            else
            {
                StringBuilder param_str = new StringBuilder();
                foreach (ElementId selId in selectIds)
                {
                    //通过ActiveUIDocument.Document.GetElement()按Id查询到相应对象
                    Element item = uidoc.Document.GetElement(selId);
                    selectElements.Add(item);
                }
            }
            return selectElements;
        }

        /// <summary>
        /// 将当前视图切换到三维视图
        /// </summary>
        /// <param name="doc"></param>
        public static View3D SwitchTo3DView(Document doc)
        {
            View3D view3D = null;
            try
            {
                //查看当前文件有没有3D视图
                FilteredElementCollector fristCollector = new FilteredElementCollector(doc).OfClass(typeof(View3D));
                foreach (View3D view in fristCollector)
                {
                    if (view.CanBePrinted && (view.Name.Contains("三维视图") | view.Name.Contains("3D View")))
                    {
                        view3D = view;
                        break;
                    }
                }

                //如果没有找到3D视图，创建一个
                if (view3D == null)
                {
                    //过滤出三维视图
                    ElementId viewFamilyTypeId = new ElementId(0);
                    FilteredElementCollector secondCollector = new FilteredElementCollector(doc).OfClass(typeof(ViewFamilyType));
                    foreach (ViewFamilyType viewFamilyType in secondCollector)
                    {
                        if (viewFamilyType.Name.Contains("三维视图") | viewFamilyType.Name.Contains("3D View"))
                        {
                            Transaction transation = new Transaction(doc);
                            transation.Start("新建三维视图");
                            view3D = View3D.CreateIsometric(doc, viewFamilyType.Id);
                            transation.Commit();
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            return view3D;
        }

        /// <summary>
        /// 获取时间戳
        /// </summary>
        /// <returns></returns>
        public static string GetTimeStamp()
        {
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string tradeTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss", System.Globalization.DateTimeFormatInfo.InvariantInfo);
            return $"[{tradeTime}] ";
        }
    }
}
