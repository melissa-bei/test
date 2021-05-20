using System;
using System.IO;

namespace TestMain
{
    public class Paths
    {
        //当前目录
        public static DirectoryInfo CURRENT_PATH = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);
        //未导出的目录
        public static string UNEXPORTED_DIR = Path.Combine(CURRENT_PATH.Parent.Parent.Parent.Parent.FullName, "resource\\unexportedfile");
        //导出json的路径
        public static string EXPORT_JSON_DIR = Path.Combine(CURRENT_PATH.Parent.Parent.Parent.Parent.FullName, "resource\\exportedjson");
        //导出后的目录
        public static string EXPORTED_DIR = Path.Combine(CURRENT_PATH.Parent.Parent.Parent.Parent.FullName, "resource\\exportedfile");
        //失败的文件夹
        public static string UNSUCCESSFUL_DIR = Path.Combine(CURRENT_PATH.Parent.Parent.Parent.Parent.FullName, "resource\\unsuccessful");
    }
}
