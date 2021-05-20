using System;
using System.IO;
using System.Linq;

namespace CustomExport
{
    public class Paths
    {
        const string ResourceConfigName = "resource_folders.txt";
        public static string ResourceConfigPath = File.ReadAllLines(ResourceConfigName).First();
        
        public static string UNEXPORTED_DIR = Path.Combine(ResourceConfigPath, "unexportedfile");  //未导出的目录
        public static string EXPORT_JSON_DIR = Path.Combine(ResourceConfigPath, "exportedjson");   //导出json的路径
        public static string EXPORTED_DIR = Path.Combine(ResourceConfigPath, "exportedfile");      //导出后的目录
        public static string UNSUCCESSFUL_DIR = Path.Combine(ResourceConfigPath, "unsuccessful");  //失败的文件夹
    }
}
