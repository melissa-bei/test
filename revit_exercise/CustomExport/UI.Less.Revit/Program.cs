using Autodesk.Revit;
using Autodesk.Revit.DB;
using CustomExport;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace UI.Less.Revit
{
    class Program
    {
        static Program()
        {
            Console.WriteLine($"{utils.GetTimeStamp()}static UI.Less.Revit Program ...");
        }

        [STAThread]
        static void Main(string[] args)
        {
            Console.WriteLine($"{utils.GetTimeStamp()}Main ...");
            //var login = LoginUserInfo.GetCurrentLoginUserInfo();
            //Console.WriteLine(login.ToString());

            try
            {
                new Runner().Run();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{utils.GetTimeStamp()}{ex}");
                Console.ReadKey();
            }
        }
    }

    class Runner
    {
        private RevitContext rvtCtx;
        private string path = @"C:\Program Files\Autodesk\Revit 2020";
        public Runner()
        {
            this.rvtCtx = new RevitContext(path);
        }

        public void Run()
        {
            rvtCtx.InitRevitFinished += RevitContext_InitRevitFinished;
            rvtCtx.InitRevit();
        }

        public Runner SetPath(string path)
        {
            this.path = path;
            return this;
        }

        /// <summary>
        /// revit初始化结束后执行的操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void RevitContext_InitRevitFinished(object sender, Product e)
        {
            string url = "http://10.80.253.135:9200";
            string indexPattern = "lib_revit_model_index_";

            List<FileInfo> success = new List<FileInfo>();
            List<FileInfo> failure = new List<FileInfo>();

            ///Monitor
            while (true)
            {
                ConsoleKey InputKey;
                if (Console.KeyAvailable)
                {
                    InputKey = Console.ReadKey(true).Key;
                    if (InputKey == ConsoleKey.Escape | InputKey == ConsoleKey.Q)
                    {
                        Console.WriteLine($"{utils.GetTimeStamp()}Closing Revit...");
                        rvtCtx.CloseRevit();
                        Console.WriteLine($"{utils.GetTimeStamp()}Successfully close Revit.");
                        break;
                    }
                }

                ///Gets the path to all rvt files
                FileInfo[] rvtList = new DirectoryInfo(Paths.UNEXPORTED_DIR).GetFiles("*.rvt", SearchOption.AllDirectories);
                foreach (FileInfo rvt in rvtList)
                {
                    Stopwatch watch = new Stopwatch();
                    ///Export
                    watch.Start();
                    FileInfo jsonFileInfo = new FileInfo(Path.ChangeExtension(Path.Combine(Paths.EXPORT_JSON_DIR, rvt.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)), ".json"));
                    Exception executeEx = null;
                    bool isSucceed = ExportProcess(rvt, new DirectoryInfo(Paths.EXPORT_JSON_DIR), ref executeEx);

                    if (isSucceed)
                    {
                        Console.WriteLine($"{utils.GetTimeStamp()}Custom export costs：" + (watch.Elapsed.TotalMilliseconds / 1000).ToString() + "s;");
                        ///Index
                        watch.Restart();
                        ES.ESBase es = new ES.ESBase(url);///Connecting
                        Console.WriteLine($"{utils.GetTimeStamp()}Update file path: {rvt.Name.Substring(0, rvt.Name.LastIndexOf("."))}");
                        ES.Program.UpdateOneJsonPath(jsonFileInfo);///Update file path
                        //Console.WriteLine($"{utils.GetTimeStamp()}Start index file: {rvt.Name.Substring(0, rvt.Name.LastIndexOf("."))}");
                        //ES.Program.LoadOneToES(es, jsonFileInfo, url, indexPattern);///Load to ES
                        //Console.WriteLine($"{utils.GetTimeStamp()}Load into ES costs：" + (watch.Elapsed.TotalMilliseconds / 1000).ToString() + "s;");

                        success.Add(rvt);

                        ///Move exported rvt files
                        FileInfo exportedPath = new FileInfo(Path.Combine(Paths.EXPORTED_DIR, rvt.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)));
                        Directory.CreateDirectory(exportedPath.Directory.FullName);
                        rvt.MoveTo(exportedPath.FullName);
                    }
                    else
                    {
                        ///Write log
                        LogMessage logMessage = LogUtils.LogError(executeEx, $"{executeEx}");

                        failure.Add(rvt);

                        ///Unsuccessful rvt file path
                        FileInfo unsuccessfulPath = new FileInfo(Path.Combine(Paths.UNSUCCESSFUL_DIR, rvt.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)));
                        Directory.CreateDirectory(unsuccessfulPath.Directory.FullName);
                        rvt.MoveTo(unsuccessfulPath.FullName);
                    }
                    utils.DeleteEmptyFolders(Paths.UNEXPORTED_DIR);
                }

                if (rvtList.Length > 0)
                {
                    ///Add information from excel
                    string excelPath = Path.Combine(Paths.ResourceConfigPath, "revit模型项目级信息.xlsx");
                    //ES.Program.AddInformation(excelPath, url, indexPattern);
                    ///Send email
                    Console.WriteLine($"{utils.GetTimeStamp()}Successfully exported file:\n{string.Join("\n", success.Select(f => f.Name))}");
                    Console.WriteLine($"{utils.GetTimeStamp()}Failed Exported file:\n{string.Join("\n", failure.Select(f => f.Name))}");
                    utils.SendEMail($"Successfully exported file:\n{string.Join("\n", success.Select(f => f.Name))}\n\nFailed Exported file:\n{string.Join("\n", failure.Select(f => f.Name))}");
                    utils.OnFinishExport();
                    success.Clear();
                    failure.Clear();
                }
                System.Threading.Thread.Sleep(3000);
            }
        }

        /// <summary>
        /// 在revit中执行导出操作
        /// </summary>
        /// <param name="fileInfo"></param>
        public bool ExportProcess(FileInfo rvtFi, DirectoryInfo jsonDi, ref Exception executeEx)
        {
            if (!utils.CanBeExport(rvtFi, jsonDi))  ///导出json路径和rvt路径被占用则取消导出
                return false;
            
            Document doc = null;
            try
            {
                Console.WriteLine($"{utils.GetTimeStamp()}Start open rvt file: {rvtFi.FullName}");
                doc = rvtCtx.OpenFile(rvtFi.FullName);
                ///Export document
                var context = new MyExportJsonContext(doc, rvtFi, jsonDi);
                CustomExporter customExporter = new CustomExporter(doc, context);
                var view3d = utils.GetA3DView(doc) as View;
                Console.WriteLine($"{utils.GetTimeStamp()}Export 3d view {view3d.Name} for document {doc.PathName}");
                customExporter.Export(view3d);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{utils.GetTimeStamp()}{ex}");
                executeEx = ex;
                return false;  ///导出过程失败 取消导出
            }
            finally
            {
                if (doc != null)
                {
                    doc.Close(false);///Close document
                }
            }
        }

        public List<string> GetLinkFilePaths(Document doc)
        {
            List<string> listPath = new List<string>();
            foreach (ElementId elId in ExternalFileUtils.GetAllExternalFileReferences(doc))
            {
                if (doc.GetElement(elId).IsExternalFileReference())
                {
                    ExternalFileReference fileRef = doc.GetElement(elId).GetExternalFileReference();
                    if (ExternalFileReferenceType.RevitLink == fileRef.ExternalFileReferenceType)
                        listPath.Add(ModelPathUtils.ConvertModelPathToUserVisiblePath(fileRef.GetAbsolutePath()));
                }
            }
            return listPath;
        }
    }
}
