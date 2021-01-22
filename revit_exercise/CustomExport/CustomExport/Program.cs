using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading;
using Autodesk.Revit;
using Autodesk.Revit.DB;
using Autodesk.RevitAddIns;

namespace CustomExport
{
    class Program
    {
        static readonly string[] Searchs = RevitProductUtility.GetAllInstalledRevitProducts().Select(x => x.InstallLocation).ToArray();
        static Program()
        {
            AddEnvironmentPaths(Searchs);

            //对程序集解析失败的时候发生
            AppDomain.CurrentDomain.AssemblyResolve += OnAssemblyResolve;
        }

        /// <summary>
        /// 当前的主函数
        /// </summary>
        /// <param name="args"></param>
        [STAThread]
        static void Main(string[] args)
        {
            //当前目录
            DirectoryInfo curPath = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);
            //未导出的目录
            string unexportedDir = Path.Combine(curPath.Parent.Parent.Parent.Parent.FullName, "resource\\unexportedfile");            
            //获取所有rvt文件名
            DirectoryInfo root = new DirectoryInfo(unexportedDir);
            FileInfo[] files = root.GetFiles("*.rvt");

            if (files.Length == 0)
            {
                Console.WriteLine("没有需要导出的rvt文件!");
                //延迟5秒关闭cmd窗口
                Thread.Sleep(5000);
            }
            else
            {
                //导出json的路径
                string exportDir = Path.Combine(curPath.Parent.Parent.Parent.Parent.FullName, "resource\\exportedjson");
                //导出后的目录
                string exportedDir = Path.Combine(curPath.Parent.Parent.Parent.Parent.FullName, "resource\\exportedfile");

                //打开revit
                Product _product = Product.GetInstalledProduct();
                bool isSaveModel = false;

                var clientId = new ClientApplicationId(Guid.NewGuid(), "RevitContext", "BIM");

                _product.Init(clientId, "I am authorized by Autodesk to use this UI-less functionality.");


                foreach (FileInfo file in files)
                {
                    try
                    {
                        Document document = _product.Application.OpenDocumentFile(file.FullName);
                        Console.WriteLine(file.FullName + "已经打开");
                        if (document != null)
                        {
                            //导出json
                            Export export = new Export();
                            string json = export.ExportToJson(document);

                            document.Close(isSaveModel);

                            //创建json文件
                            string jsonPath = Path.Combine(exportDir, Path.GetFileNameWithoutExtension(file.Name) + ".json");
                            string filePath = Path.Combine(exportedDir, Path.GetFileName(file.Name));
                            if (File.Exists(filePath))
                            {
                                Console.WriteLine("已导出文件夹（exportedfile）中存在" + file.FullName + "，请删除后再导出！");
                            }
                            else if (File.Exists(jsonPath))
                            {
                                Console.WriteLine("导出json文件夹（exportedjson）中存在" + Path.GetFileNameWithoutExtension(file.FullName) + ".json，请删除后再导出!");
                            }
                            else
                            {
                                file.MoveTo(filePath);

                                FileStream fs = new FileStream(jsonPath, FileMode.Create, FileAccess.ReadWrite);
                                fs.Close();
                                //写入json文件                            
                                File.WriteAllText(jsonPath, json);
                                Console.WriteLine(file.FullName + "导出完成！");
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                        continue;
                    }
                }
                _product.Exit();
            }
            
        }


        /// <summary>
        /// 向系统中添加环境变量
        /// </summary>
        /// <param name="paths"></param>
        static void AddEnvironmentPaths(params string[] paths)
        {
            var path = new[] { Environment.GetEnvironmentVariable("PATH") ?? string.Empty };

            var newPath = string.Join(System.IO.Path.PathSeparator.ToString(), path.Concat(paths));

            Environment.SetEnvironmentVariable("PATH", newPath);
        }

        /// <summary>
        /// 程序加载失败
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        private static Assembly OnAssemblyResolve(object sender, ResolveEventArgs args)
        {
            var assemblyName = new AssemblyName(args.Name);

            foreach (var item in Searchs)
            {
                Console.WriteLine(assemblyName.Name);
                var file = string.Format("{0}.dll", System.IO.Path.Combine(item, assemblyName.Name));

                if (File.Exists(file))
                {
                    return Assembly.LoadFile(file);
                }
            }
            return args.RequestingAssembly;
        }
    }
}
