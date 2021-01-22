using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using Autodesk.Revit;
using Autodesk.Revit.DB;
using Autodesk.RevitAddIns;

namespace CustomExport
{
    class Export
    {
        public string ExportToJson(Document document)
        {
            Dictionary<string, object> keyValuePairs = ExtractToDict(document);
            string json = DictToJson(keyValuePairs);
            return json;
        }

        Dictionary<string, Object> ExtractToDict(Document document)
        {
            Dictionary<string, Object> keyValuePairs = new Dictionary<string, Object> { };

            //获取file_info
            Dictionary<string, Object> file_info = new Dictionary<string, Object> { };
            file_info.Add("file name", Path.GetFileName(document.PathName));
            file_info.Add("file path", System.Text.RegularExpressions.Regex.Escape(Path.GetDirectoryName(document.PathName)));

            keyValuePairs.Add("file_info", file_info);
            //file_info.Clear();


            //获取所有的project_info
            Dictionary<string, Object> project_info = new Dictionary<string, Object> { };

            ParameterSet projectInfos = document.ProjectInformation.Parameters;
            foreach (Parameter param in projectInfos)
            {
                try
                {
                    Console.WriteLine(param.Definition.Name);
                    project_info.Add(param.Definition.Name, Tools.GetParameterInformation(param, document));
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);  //项目类别有一个重复
                    continue;
                }
            }
            keyValuePairs.Add("project_info", project_info);
            //project_info.Clear();



            //获取所有的category_info
            Dictionary<string, object> category_info = new Dictionary<string, object> { };

            Categories categories = document.Settings.Categories;
            if (categories.Size > 0)
            {
                foreach (Category category in document.Settings.Categories)
                {
                    try
                    {
                        Console.WriteLine(category.Name);
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
                //category_info.Clear();
            }
            else
            {
                Console.WriteLine("没有检测到任何类别！");
            }



            //if (categories.Size > 0)
            //{
            //    foreach (Category category in document.Settings.Categories)
            //    {
            //        //获取所有的family_info
            //        FilteredElementCollector collector = new FilteredElementCollector(document);
            //        collector.OfClass(typeof(Family));//过滤获取到当前文件中所有的族实例
            //        IList<Element> collectorList = collector.ToElements();
            //        if (collectorList.Count > 0)
            //        {

            //        }
            //        else
            //        {
            //            Console.WriteLine("没有检测到任何族！");
            //        }

            //        //获取所有type_info

            //        //获取所有instances_params
            //    }
            //}

            return keyValuePairs;
        }


        string DictToJson(Dictionary<string, object> keyValuePairs)
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
    }
}
