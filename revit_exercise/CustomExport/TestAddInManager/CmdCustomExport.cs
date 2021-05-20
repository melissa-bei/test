using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using System;
using System.Collections.Generic;

namespace TestAddInManager
{
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    class CmdCustomExport : IExternalCommand
    {
        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            try
            {
                var doc = commandData.Application.ActiveUIDocument.Document;
                if (doc.ActiveView is View3D)
                {
                    var context = new ExportJsonContext(doc);
                    CustomExporter customExporter = new CustomExporter(doc, context);
                    customExporter.Export(doc.ActiveView);
                }
                else
                {
                    message += "请切换到 3D 视图执行";
                    return Result.Failed;
                }
            }
            catch (Exception ex)
            {
                message += ex.ToString();
                return Result.Failed;
            }

            return Result.Succeeded;
        }
    }

    class ExportJsonContext : IExportContext //IModelExportContext
    {
        Document doc;

        Dictionary<String, Category> CategoryDict = new Dictionary<string, Category>();
        Dictionary<String, Family> FamilyDict = new Dictionary<string, Family>();
        Dictionary<String, ElementType> TypeDict = new Dictionary<string, ElementType>();
        Dictionary<String, Element> ElementDict = new Dictionary<string, Element>();

        public ExportJsonContext(Document doc)
        {
            this.doc = doc;
        }

        public void Finish()
        {
            var jsonPath = System.IO.Path.Combine(System.Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "rvt_json.json");

            /// TODO write json
            TaskDialog.Show("Tip", $"Category: {CategoryDict.Count};\nFamily: {FamilyDict.Count};\n" +
                $"Type: {TypeDict.Count};\nElement: {ElementDict.Count};\n\nJson Path: {jsonPath}");

            var jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(this.ElementDict);
            if (System.IO.File.Exists(jsonPath))
            {
                System.IO.File.Delete(jsonPath);
            }
            System.IO.File.WriteAllText(jsonPath, jsonStr);
        }

        public bool IsCanceled()
        {
            return false;
        }

        public RenderNodeAction OnCurve(CurveNode node)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// This method marks the beginning of an element to be exported. 
        /// </summary>
        /// <param name="elementId"></param>
        /// <returns></returns>
        public RenderNodeAction OnElementBegin(ElementId elementId)
        {
            try
            {
                if (null == elementId && elementId == ElementId.InvalidElementId)
                    return RenderNodeAction.Skip;

                Element elem = this.doc.GetElement(elementId);
                if (null == elem)
                    return RenderNodeAction.Skip;

                /// record element (instance)
                this.ElementDict.Add(elem.UniqueId, elem);

                var typeId = elem.GetTypeId();
                ElementType elementType = null;
                if (null != typeId && typeId != ElementId.InvalidElementId)
                {
                    elementType = this.doc.GetElement(typeId) as ElementType;
                    if (null != elementType)
                    {
                        /// record ElementType
                        this.TypeDict.Add(elementType.UniqueId, elementType);
                    }
                }

                if (elem.Category != null)
                {
                    var builtInCate = (BuiltInCategory)elem.Category.Id.IntegerValue;
                    /// record category
                    this.CategoryDict.Add(builtInCate.ToString(), elem.Category);
                }

                if (elem is HostObject)
                { // 系统族

                }
                else if (elem is FamilyInstance)
                { // 载入族
                    if (null != elementType && elementType is FamilySymbol)
                    {
                        var familySymbol = elementType as FamilySymbol;
                        if (null != familySymbol && null != familySymbol.Family)
                        { // record family
                            this.FamilyDict.Add(familySymbol.Family.UniqueId, familySymbol.Family);
                        }
                    }
                }
                else
                { // 内建族 或者 其他类型的族

                }

            }
            catch (Exception)
            {
                return RenderNodeAction.Skip; // 处理异常就跳过
            }

            return RenderNodeAction.Proceed;
        }

        public void OnElementEnd(ElementId elementId)
        {

        }

        public RenderNodeAction OnFaceBegin(FaceNode node)
        {
            return RenderNodeAction.Proceed;
        }

        public void OnFaceEnd(FaceNode node)
        {

        }

        /// <summary>
        /// This method marks the beginning of a family instance to be exported. 
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
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

        public void OnLineSegment(LineSegment segment)
        {
            throw new NotImplementedException();
        }

        public RenderNodeAction OnLinkBegin(LinkNode node)
        {
            return RenderNodeAction.Proceed;
        }

        public void OnLinkEnd(LinkNode node)
        {

        }

        public void OnMaterial(MaterialNode node)
        {

        }

        public RenderNodeAction OnPoint(PointNode node)
        {
            throw new NotImplementedException();
        }

        public RenderNodeAction OnPolyline(PolylineNode node)
        {
            throw new NotImplementedException();
        }

        public void OnPolylineSegments(PolylineSegments segments)
        {
            throw new NotImplementedException();
        }

        public void OnPolymesh(PolymeshTopology node)
        {

        }

        public void OnRPC(RPCNode node)
        {

        }

        public void OnText(TextNode node)
        {
            throw new NotImplementedException();
        }

        public RenderNodeAction OnViewBegin(ViewNode node)
        {
            return RenderNodeAction.Proceed;
        }

        public void OnViewEnd(ElementId elementId)
        {

        }

        public bool Start()
        {
            return true;
        }
    }

}
