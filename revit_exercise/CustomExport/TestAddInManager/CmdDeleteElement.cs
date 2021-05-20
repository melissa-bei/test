using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using System;
using System.Collections.Generic;
using TestAddInManager;


namespace TestAddinManager
{
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    public class CmdDeleteElement : IExternalCommand
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
                if (DeleteElement(selectElements, commandData, out ElementSet delfaliedeset))
                {
                    if (delfaliedeset.Size > 0)
                    {
                        message = "有对象不能被删除";
                        elements = delfaliedeset;
                    }
                    return Result.Succeeded;
                }
                else
                {
                    return Result.Failed;
                }
            }
            catch
            {
                return Result.Failed;
            }
        }

        private Boolean DeleteElement(List<Element> selectElements, ExternalCommandData commandData, out ElementSet delfaliedeset)
        {
            Document doc = commandData.Application.ActiveUIDocument.Document;

            ElementSet delset = new ElementSet();
            Transaction transactoin = new Transaction(doc, "DeleteObject");

            delfaliedeset = new ElementSet();
            try
            {
                transactoin.Start();
                //逐元素删除
                foreach (Element e in selectElements)
                {
                    try
                    {
                        doc.Delete(e.Id);
                    }
                    catch //遇到不能删除的对象，记录后继续删除后面对象
                    {
                        delfaliedeset.Insert(e);
                        continue;
                    }
                }
                transactoin.Commit();
            }
            catch
            {
                return false;
            }
            finally
            {
                transactoin.Dispose();
            }
            return true;
        }
    }
}
