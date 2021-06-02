using Autodesk.Revit;
using Autodesk.Revit.DB;
using Autodesk.Revit.DB.Events;
using System;
using System.IO;

namespace TestMain
{
    public class Export
    {
        /// <summary>
        /// 自动导出流程
        /// </summary>
        public static void AutoExport()
        {
            FileInfo[] rvtFiles = new DirectoryInfo(Paths.UNEXPORTED_DIR).GetFiles("*.rvt", SearchOption.AllDirectories);

            if (rvtFiles.Length == 0)
            {
                Console.WriteLine($"{Tools.GetTimeStamp()}There isn`t any rvt file in {Paths.UNEXPORTED_DIR}!");
            }
            else
            {
                Product _product = InitRevit();
                foreach (FileInfo file in rvtFiles)
                {
                    ExportOneRvt(_product, file);
                }
                CloseRevit(_product);
            }
        }

        /// <summary>
        /// 初始化一个Revit
        /// </summary>
        /// <returns></returns>
        public static Product InitRevit()
        {
            Product _product = Product.GetInstalledProduct();
            var clientId = new ClientApplicationId(Guid.NewGuid(), "RevitContext", "BIM");
            _product.Init(clientId, "I am authorized by Autodesk to use this UI-less functionality.");
            Console.WriteLine($"{Tools.GetTimeStamp()}Init Revit complete！");
            return _product;
        }

        /// <summary>
        /// 关闭Revit
        /// </summary>
        /// <param name="_product"></param>
        public static void CloseRevit(Product _product)
        {
            _product.Exit();
        }

        /// <summary>
        /// 导出一个rvt文件
        /// </summary>
        /// <param name="e"></param>
        /// <param name="file"></param>
        public static void ExportOneRvt(Product revitProduct, FileInfo file)
        {
            Tools.CanBeExport(file); ///can`t be exported will throw an IOException

            Document doc = null;
            try
            {
                ModelPath model = new FilePath(file.FullName);
                BasicFileInfo basicFileInfo = BasicFileInfo.Extract(file.FullName);

                OpenOptions openOptions = new OpenOptions()
                {
                    Audit = true,
                    AllowOpeningLocalByWrongUser = false,
                    OpenForeignOption = OpenForeignOption.Open
                };
                if (basicFileInfo.IsCentral | basicFileInfo.IsWorkshared)
                {///central model
                    openOptions.DetachFromCentralOption = DetachFromCentralOption.DetachAndDiscardWorksets;///Detached from the central model
                }
                IOpenFromCloudCallback openFromCloudCallback = new DefaultOpenFromCloudCallback();
                revitProduct.Application.FailuresProcessing += new EventHandler<FailuresProcessingEventArgs>(Tools.FailuresProcessing);
                ///Open document
                doc = revitProduct.Application.OpenDocumentFile(model, openOptions, openFromCloudCallback);
                revitProduct.Application.FailuresProcessing -= new EventHandler<FailuresProcessingEventArgs>(Tools.FailuresProcessing);

                Console.WriteLine($"{Tools.GetTimeStamp()}start open rvt file: {file.Name}");
                ///Export document
                FileInfo jsonPath = new FileInfo(Path.ChangeExtension(Path.Combine(Paths.EXPORT_JSON_DIR, file.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)), ".json"));
                var context = new MyExportJsonContext(doc, jsonPath);
                CustomExporter customExporter = new CustomExporter(doc, context);
                customExporter.Export((View)Tools.SwitchTo3DView(doc));

                doc.Close(false);
                Console.WriteLine($"{Tools.GetTimeStamp()}finish export rvt file: {file.Name}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{Tools.GetTimeStamp()}{ex}");
                if (doc != null)
                {///Close document
                    doc.Close(false);
                }
                throw ex;
            }
        }

    }
}
