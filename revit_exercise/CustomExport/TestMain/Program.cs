using Autodesk.Revit;
using Autodesk.RevitAddIns;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Threading;

namespace TestMain
{
    public class Program
    {
        public delegate bool ControlCtrlDelegate(int CtrlType);
        [DllImport("kernel32.dll")]
        private static extern bool SetConsoleCtrlHandler(ControlCtrlDelegate HandlerRoutine, bool Add);
        private static ControlCtrlDelegate cancelHandler = new ControlCtrlDelegate(HandlerRoutine);

        static readonly string[] SEARCHS = RevitProductUtility.GetAllInstalledRevitProducts().Select(x => x.InstallLocation).ToArray();
        static Product revitProduct;

        static List<FileInfo> success = new List<FileInfo>();
        static List<FileInfo> failure = new List<FileInfo>();

        static Program()
        {
            Console.WriteLine($"{Tools.GetTimeStamp()}static CustomExport Program ...");
            AddEnvironmentPaths(SEARCHS);

            //对程序集解析失败的时候发生
            AppDomain.CurrentDomain.AssemblyResolve += OnAssemblyResolve;
        }
        

        [STAThread]
        static void Main(string[] args)
        {
            ///监控文件夹并自动导出
            Console.WriteLine($"{Tools.GetTimeStamp()}Main ...");
            try
            {
                ///Init Revit
                revitProduct = Export.InitRevit();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{Tools.GetTimeStamp()}{ex}");
                Console.ReadKey();
            }            
            ///Monitor
            while (true)
            {
                ConsoleKey InputKey;
                if (Console.KeyAvailable)
                {
                    InputKey = Console.ReadKey(true).Key;
                    if (InputKey == ConsoleKey.Escape | InputKey == ConsoleKey.Q)
                    {
                        Console.WriteLine($"{Tools.GetTimeStamp()}Closing Revit...");
                        Export.CloseRevit(revitProduct);
                        Console.WriteLine($"{Tools.GetTimeStamp()}Successfully close Revit.");
                        break;
                    }
                }
                SetConsoleCtrlHandler(cancelHandler, true);

                ///Gets the path to all rvt files
                FileInfo[] rvtList = new DirectoryInfo(Paths.UNEXPORTED_DIR).GetFiles("*.rvt", SearchOption.AllDirectories);
                ///Export
                foreach (FileInfo file in rvtList)
                {
                    try
                    {
                        Export.ExportOneRvt(revitProduct, file);
                        success.Add(file);

                        ///Move exported rvt files
                        FileInfo filePath = new FileInfo(Path.Combine(Paths.EXPORTED_DIR, file.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)));
                        Directory.CreateDirectory(filePath.Directory.FullName);
                        file.MoveTo(filePath.FullName);
                        Tools.DeleteEmptyFolders(Paths.UNEXPORTED_DIR);
                    }
                    catch
                    {
                        failure.Add(file);

                        ///Unsuccessful rvt file path
                        FileInfo unsuccessfulPath = new FileInfo(Path.Combine(Paths.UNSUCCESSFUL_DIR, file.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)));
                        Directory.CreateDirectory(unsuccessfulPath.Directory.FullName);
                        file.MoveTo(unsuccessfulPath.FullName);
                        Tools.DeleteEmptyFolders(Paths.UNEXPORTED_DIR);

                        continue;
                    }
                }
                ///Send email
                if (success.Count() > 0 | failure.Count() > 0)
                {
                    Console.WriteLine($"{Tools.GetTimeStamp()}Exported successful files：\n{string.Join("\n", success.Select(f => f.Name))}");
                    Console.WriteLine($"{Tools.GetTimeStamp()}Export failed files：\n{string.Join("\n", failure.Select(f => f.Name))}");
                    Tools.SendEMail($"Exported successful files：\n{string.Join("\n", success.Select(f => f.Name))}\n\nExport failed files：\n{string.Join("\n", failure.Select(f => f.Name))}");
                    Tools.OnFinishExport();
                    success.Clear();
                    failure.Clear();
                }
                Thread.Sleep(3000);
            }
            
            ///第二版使用customexport自定义导出接口
            //Export.AutoExport();

            ///第一版手动自定义导出过程
            //ManuallyExport manuallyexport = new ManuallyExport();
            //manuallyexport.AutoExport(unexportedDir, exportJsonDir, exportedDir);
            ///延迟3秒关闭cmd窗口
            //Thread.Sleep(3000);
        }

        /// <summary>
        /// 向系统中添加环境变量
        /// </summary>
        /// <param name="paths"></param>
        static void AddEnvironmentPaths(params string[] paths)
        {
            var path = new[] { Environment.GetEnvironmentVariable("PATH") ?? string.Empty };

            var newPath = string.Join(Path.PathSeparator.ToString(), path.Concat(paths));

            Environment.SetEnvironmentVariable("PATH", newPath);
        }

        /// <summary>
        /// 程序加载失败
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        static Assembly OnAssemblyResolve(object sender, ResolveEventArgs args)
        {
            var assemblyName = new AssemblyName(args.Name);

            foreach (var item in SEARCHS)
            {
                var file = string.Format("{0}.dll", Path.Combine(item, assemblyName.Name));

                if (File.Exists(file))
                {
                    Console.WriteLine($"{Tools.GetTimeStamp()}Load Revit Dll Path:{file}");
                    return Assembly.LoadFile(file);
                }
            }
            return args.RequestingAssembly;
        }

        public static bool HandlerRoutine(int CtrlType)
        {
            ///Close Revit
            Console.WriteLine($"{Tools.GetTimeStamp()}Closing Revit...");
            Export.CloseRevit(revitProduct);
            Console.WriteLine($"{Tools.GetTimeStamp()}Successfully close Revit.");
            return false;
        }
       
    }
}
