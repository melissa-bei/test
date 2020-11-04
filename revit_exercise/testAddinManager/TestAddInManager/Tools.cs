using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using Autodesk.Revit.UI.Selection;


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
        /// 过滤激活视图中的所有墙
        /// </summary>
        /// <param name="commandData"></param>
        /// <returns></returns>
        public static List<Element> FilterAllWalls(ExternalCommandData commandData)
        {
            UIDocument uIDocument = commandData.Application.ActiveUIDocument;

            ElementClassFilter wallsFilter = new ElementClassFilter(typeof(WallType));
            FilteredElementCollector collector = new FilteredElementCollector(uIDocument.Document);
            collector.WherePasses(wallsFilter);

            //var query = from element in collector
            //            where element.Name == "60\" x 30\" Student"
            //            select element;

            List<Element> selectElements = collector.Cast<Element>().ToList(); //query.Cast<Wall>().ToList()
            return selectElements;
        }

        public static List<Element> FilterAllFloor(ExternalCommandData commandData)
        {
            UIDocument uIDocument = commandData.Application.ActiveUIDocument;

            ElementClassFilter wallsFilter = new ElementClassFilter(typeof(Floor));
            FilteredElementCollector collector = new FilteredElementCollector(uIDocument.Document);
            collector.WherePasses(wallsFilter);

            List<Element> selectElements = collector.Cast<Element>().ToList();
            return selectElements;
        }
    }
}
