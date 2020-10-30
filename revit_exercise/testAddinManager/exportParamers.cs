using Autodesk.Revit.DB;


namespace testAddinManager
{
    class Program
    {
        /// <summary>
        /// This method initiates a custom export process for a given 3D view.
        /// </summary>
        internal void Export(Document document, View a3DView) //主函数
        {
            MyExportContext context = new MyExportContext(document);

            CustomExporter exporter = new CustomExporter(document, context);

            exporter.IncludeGeometricObjects = false;

            exporter.ShouldStopOnError = true;

            exporter.Export(a3DView);
        }


        class MyExportContext : IExportContext
        {
            private Document exportedDocument = null;
            public MyExportContext(Document document)
            {
                this.exportedDocument = document;
            }
            public void Finish()
            {
                throw new System.NotImplementedException();
            }

            public bool IsCanceled()
            {
                throw new System.NotImplementedException();
            }

            public RenderNodeAction OnElementBegin(ElementId elementId)
            {
                throw new System.NotImplementedException();
            }

            public void OnElementEnd(ElementId elementId)
            {
                throw new System.NotImplementedException();
            }

            public RenderNodeAction OnFaceBegin(FaceNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnFaceEnd(FaceNode node)
            {
                throw new System.NotImplementedException();
            }

            public RenderNodeAction OnInstanceBegin(InstanceNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnInstanceEnd(InstanceNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnLight(LightNode node)
            {
                throw new System.NotImplementedException();
            }

            public RenderNodeAction OnLinkBegin(LinkNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnLinkEnd(LinkNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnMaterial(MaterialNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnPolymesh(PolymeshTopology node)
            {
                throw new System.NotImplementedException();
            }

            public void OnRPC(RPCNode node)
            {
                throw new System.NotImplementedException();
            }

            public RenderNodeAction OnViewBegin(ViewNode node)
            {
                throw new System.NotImplementedException();
            }

            public void OnViewEnd(ElementId elementId)
            {
                throw new System.NotImplementedException();
            }

            public bool Start()
            {
                throw new System.NotImplementedException();
            }
        }

    }
}
