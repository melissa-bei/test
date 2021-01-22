using System;
using System.Collections.Generic;
using Autodesk.RevitAddIns;

namespace RunRevit
{
    class Program
    {
        static void Main(string[] args)
        {
            //向系统中添加环境变量
            var newPath = GetInstallLocation();
            Environment.SetEnvironmentVariable("PATH", newPath);

            //声明一个程序信息类 
            System.Diagnostics.ProcessStartInfo Info = new System.Diagnostics.ProcessStartInfo();
            //设置外部程序名
            Info.FileName = "Revit.exe";
            //设置隐藏窗口 
            Info.UseShellExecute = false;
            Info.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
            //设置外部程序的启动参数（命令行参数）为
            Info.Arguments = "test.txt";
            //设置外部程序工作目录为
            Info.WorkingDirectory = ""; ;
            //声明一个程序类
            System.Diagnostics.Process Proc;
            try
            { // //启动外部程序 // 
                Proc = System.Diagnostics.Process.Start(Info);
                Console.WriteLine(Proc.Id);
                Console.ReadKey();
            }
            catch (System.ComponentModel.Win32Exception exc)
            {
                Console.WriteLine("系统找不到指定的程序文件。/r{0}", exc);
                Console.ReadKey();
                return;
            }

        }

        static string GetInstallLocation()
        {
            List<RevitProduct> aa = RevitProductUtility.GetAllInstalledRevitProducts();
            string installlocation = "";
            foreach (RevitProduct s in aa)
            {
                if (s.Version == RevitVersion.Revit2020)
                {
                    installlocation = s.InstallLocation;
                    break;
                }
            }
            return installlocation;
            //if (aa != null)
            //{
            //    foreach (RevitProduct s in aa)
            //    {
            //        if (s.Version == RevitVersion.Revit2020)
            //        {
            //            string installLocation = s.InstallLocation;
            //            return installLocation;
            //        }
            //        else
            //        {
            //            throw new Exception("未安装revit 2020");
            //        }
            //    }
            //}
            //else
            //{
            //    throw new Exception("未安装revit");
            //}
        }
    }
}
