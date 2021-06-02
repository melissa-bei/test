using Autodesk.Revit;
using Autodesk.Revit.DB;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CustomExport
{
    class ManuallyExport
    {
        //当前目录
        static readonly DirectoryInfo curPath = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);
        //未导出的目录
        static readonly string unexportedDir = Path.Combine(curPath.Parent.Parent.Parent.Parent.FullName, "resource\\unexportedfile");
        //存储需要导出的所有rvt模型的绝对路径
        static List<FileInfo> rvtList = new List<FileInfo>();

        /// <summary>
        /// //只获取根目录下所有rvt文件名
        /// </summary>
        public ManuallyExport()
        {
            DirectoryInfo root = new DirectoryInfo(unexportedDir);
            rvtList = root.GetFiles("*.rvt").ToList<FileInfo>();
        }

        /// <summary>
        /// //获取包含子目录下所有rvt文件名
        /// </summary>
        /// <param name="IncludeSubdirectories"></param>
        public ManuallyExport(bool IncludeSubdirectories)
        {
            if (IncludeSubdirectories)
            {
                CollectRvtFiles(unexportedDir, new TreeNode(unexportedDir).Nodes, rvtList);
            }
        }

        /// <summary>
        /// 递归加载文件夹目录下的rvt文件
        /// </summary>
        /// <param name="path"></param>
        /// <param name="nodes"></param>
        /// <param name="rvtList"></param>
        public void CollectRvtFiles(string path, TreeNodeCollection nodes, List<FileInfo> rvtList)
        {
            foreach (string item in Directory.GetDirectories(path))
            {
                TreeNode node = nodes.Add(Path.GetFileName(item));
                CollectRvtFiles(item, node.Nodes, rvtList);
            }
            DirectoryInfo directory = new DirectoryInfo(path);
            FileInfo[] files = directory.GetFiles("*.rvt");
            foreach (FileInfo file in files)
            {
                rvtList.Add(file);
            }
        }

        /// <summary>
        /// 导出指定文件夹中rvt模型
        /// </summary>
        public void AutoExport(string exportJsonDir, string exportedDir)
        {
            if (rvtList.Count == 0)
            {
                Console.WriteLine("没有需要导出的rvt文件!");
            }
            else
            {
                //打开revit
                Product _product = Product.GetInstalledProduct();
                bool isSaveModel = false;

                var clientId = new ClientApplicationId(Guid.NewGuid(), "RevitContext", "BIM");

                _product.Init(clientId, "I am authorized by Autodesk to use this UI-less functionality.");


                foreach (FileInfo file in rvtList)
                {
                    string subDir = "";
                    if (file.DirectoryName == unexportedDir)
                    {
                        subDir = "";
                    }
                    else
                    {
                        subDir = file.DirectoryName.Substring(unexportedDir.Length + 1, file.DirectoryName.Length - unexportedDir.Length - 1);
                    }

                    //json的路径
                    string jsonPath = Path.Combine(exportJsonDir, subDir);
                    if (!Directory.Exists(jsonPath))
                    {
                        Directory.CreateDirectory(jsonPath);
                        jsonPath = Path.Combine(jsonPath, Path.GetFileNameWithoutExtension(file.Name) + ".json");
                    }
                    else
                    {
                        jsonPath = Path.Combine(jsonPath, Path.GetFileNameWithoutExtension(file.Name) + ".json");
                    }
                    //rvt文件移动后的路径
                    string rvtPath = Path.Combine(exportedDir, subDir);
                    if (!Directory.Exists(rvtPath))
                    {
                        Directory.CreateDirectory(rvtPath);
                        rvtPath = Path.Combine(rvtPath, file.Name);
                    }
                    else
                    {
                        rvtPath = Path.Combine(rvtPath, file.Name);
                    }

                    //检查文件是否已经存在
                    if (File.Exists(rvtPath))
                    {
                        Console.WriteLine("WARNING: 已导出文件夹（exportedfile）中存在" + file.Name + "，请删除后再导出！");
                    }
                    else if (File.Exists(jsonPath))
                    {
                        Console.WriteLine("WARNING: 导出json文件夹（exportedjson）中存在" + Path.GetFileNameWithoutExtension(file.Name) + ".json，请删除后再导出!");
                    }
                    else
                    {
                        //不存在已导出文件夹和导出json的文件夹都不包含同名文件时，打开document
                        //认定打开document不会出错
                        string json = "";

                        Document document = _product.Application.OpenDocumentFile(file.FullName);
                        Console.WriteLine(file.Name + "已经打开……");
                        if (document != null)
                        {
                            ////导出json
                            json = ExportToJson(document);
                            ////获取所有element
                            //FilteredElementCollector allElements = Tools.GetAllElement(document);
                            //Dictionary<string, object> allElement = new Dictionary<string, object>();
                            //foreach (Element element in allElements)
                            //{
                            //    if (element.Category is null)
                            //    {

                            //    }
                            //    else
                            //    {
                            //        allElement.Add(element.Id.ToString(), element.Category.Name + element.Category.Id.ToString());                                    
                            //    }
                            //}
                            //json = export.DictToJson(allElement);
                        }
                        //关闭document
                        document.Close(isSaveModel);
                        //移动已导出的文件
                        file.MoveTo(rvtPath);
                        //创建json文件
                        FileStream fs = new FileStream(jsonPath, FileMode.Create, FileAccess.ReadWrite);
                        fs.Close();
                        //写入json文件                            
                        File.WriteAllText(jsonPath, json);
                        Console.WriteLine(file.Name + "导出完成……");
                    }
                }
                _product.Exit();
            }
        }

        /// <summary>
        /// 导出Document为json
        /// </summary>
        /// <param name="document"></param>
        /// <returns></returns>
        public string ExportToJson(Document document)
        {
            Dictionary<string, object> keyValuePairs = ExtractToDict(document);
            JObject jObject = JObject.FromObject(keyValuePairs);
            string json = jObject.ToString();
            //string json = DictToJson(keyValuePairs);
            return json;
        }

        /// <summary>
        /// 抽取document中的信息到字典
        /// </summary>
        /// <param name="document"></param>
        /// <returns></returns>
        public Dictionary<string, Object> ExtractToDict(Document document)
        {
            Dictionary<string, Object> keyValuePairs = new Dictionary<string, Object> { };

            //获取file_info
            Dictionary<string, Object> file_info = new Dictionary<string, Object> { };
            file_info.Add("file name", Path.GetFileName(document.PathName));
            file_info.Add("file path", System.Text.RegularExpressions.Regex.Escape(Path.GetDirectoryName(document.PathName)));

            keyValuePairs.Add("file_info", file_info);


            //获取所有的project_info
            Dictionary<string, Object> project_info = new Dictionary<string, Object> { };

            ParameterSet projectInfos = document.ProjectInformation.Parameters;
            foreach (Parameter param in projectInfos)
            {
                try
                {
                    project_info.Add(param.Definition.Name, GetParameterInformation(param, document));
                }
                catch
                {
                    Console.WriteLine("WARNING: \"" + param.Definition.Name + "\"" + "已经存在!"); //项目类别有一个重复
                    continue;
                }
            }
            keyValuePairs.Add("project_info", project_info);


            //获取所有的category_info
            Dictionary<string, object> category_info = new Dictionary<string, object> { };

            Categories categories = document.Settings.Categories;
            if (categories.Size > 0)
            {
                foreach (Category category in document.Settings.Categories)
                {
                    try
                    {
                        Dictionary<string, object> infos = new Dictionary<string, object> { };
                        infos.Add("name", category.Name);
                        infos.Add("category Id", category.Id.ToString());
                        infos.Add("family", category.Name + "_family_info");

                        category_info.Add(category.Id.ToString(), infos);
                        //infos.Clear();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                        continue;
                    }
                }
                keyValuePairs.Add("category_info", category_info);
            }
            else
            {
                Console.WriteLine("WARNING: 没有检测到任何类别！");
            }


            if (categories.Size > 0)
            {
                foreach (Category category in document.Settings.Categories)
                {
                    //获取所有元素
                    FilteredElementCollector elementOfCategory = utils.GetAllElement(document);
                    //根据Category获取元素
                    ElementCategoryFilter elementCategoryFilter = new ElementCategoryFilter(category.Id);
                    elementOfCategory.WherePasses(elementCategoryFilter);
                    if (elementOfCategory.Count() == 0)
                    {
                        keyValuePairs.Add(category.Name + "_family_info", "");
                    }
                    else
                    {
                        Dictionary<string, object> family_info = new Dictionary<string, object> { };
                        foreach (Element element in elementOfCategory)
                        {
                            Dictionary<string, object> infos = new Dictionary<string, object> { };
                            infos.Add("name", element.Name);
                            infos.Add("id", element.Id.ToString());
                            family_info.Add(element.Id.ToString(), infos);
                        }
                        keyValuePairs.Add(category.Name + "_family_info", family_info);
                    }

                    //获取所有type_info

                    //获取所有instances_params
                }

            }
            return keyValuePairs;
        }

        /// <summary>
        /// 由两层嵌套字典导出为json
        /// </summary>
        /// <param name="keyValuePairs"></param>
        /// <returns></returns>
        public static string DictToJson(Dictionary<string, object> keyValuePairs)
        {
            StringBuilder json = new StringBuilder();
            json.Append("{" + "\n");

            foreach (KeyValuePair<string, object> kvp in keyValuePairs)
            {
                try
                {
                    if (kvp.Value == null)
                    {
                        json.Append("\"" + kvp.Key + "\": " + "\"" + kvp.Value + "\"" + ",\n");
                    }
                    else if (kvp.Value.GetType().Name == "String")
                    {
                        json.Append("\"" + kvp.Key + "\": " + "\"" + kvp.Value.ToString() + "\"" + ",\n");
                    }
                    else
                    {
                        Dictionary<string, object> subkvp = (Dictionary<string, object>)kvp.Value; //强制将Object父类转化为Dictionary子类
                        json.Append("\"" + kvp.Key + "\": " + DictToJson(subkvp) + ",\n");
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    continue;
                }
            }
            json.Remove(json.Length - 2, 2);
            json.Append("\n");

            json.Append("}");
            return json.ToString();
        }

        /// <summary>
        /// 获取一个parameter的值
        /// </summary>
        /// <param name="param"></param>
        /// <param name="document"></param>
        /// <returns></returns>
        public String GetParameterInformation(Parameter param, Document document)
        {
            string defValue = string.Empty;
            //根据存储类型使用不同方法获取参数
            switch (param.StorageType)
            {
                case StorageType.Double:
                    //把浮点数转化为字符
                    defValue = param.AsValueString();
                    break;
                case StorageType.ElementId:
                    //根据Id获取图元名称
                    ElementId Id = param.AsElementId();
                    if (Id.IntegerValue >= 0)
                    {
                        defValue = document.GetElement(Id).Name;
                    }
                    else
                    {
                        defValue = Id.IntegerValue.ToString();
                    }
                    break;
                case StorageType.Integer:
                    //把整型转化为True和false
                    if (param.Definition.ParameterType == ParameterType.YesNo)
                    {
                        if (param.AsInteger() == 0)
                        {
                            defValue = "False";
                        }
                        else
                        {
                            defValue = "True";
                        }
                    }
                    break;
                case StorageType.String:
                    defValue = param.AsString();
                    break;
                case StorageType.None:
                    defValue = param.AsValueString();
                    break;
                default:
                    defValue = "未知类型参数";
                    break;
            }
            if (defValue != null)
            {
                defValue = defValue.Replace("\n", " ").Replace("\r", " ");
            }
            //返回参数名+参数值
            return defValue;
        }

    }
}
