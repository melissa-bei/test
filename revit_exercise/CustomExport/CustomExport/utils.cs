using Autodesk.Revit.DB;
using Autodesk.Revit.DB.Events;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace CustomExport
{
    public class utils
    {
        /// <summary>
        /// 判断file的导出路径有没有同名rvt或json文件存在
        /// </summary>
        /// <param name="file"></param>
        public static bool CanBeExport(FileInfo file, DirectoryInfo jsonDi)
        {
            ///Check EXPORTED_DIR for rvt file with same name
            FileInfo filePath = new FileInfo(Path.Combine(Paths.EXPORTED_DIR, file.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)));
            if (filePath.Exists)
            {
                Console.WriteLine($"{GetTimeStamp()}WARNING:{filePath.FullName} already exists this file, please delete it！");
                return false;
            }
            ///Check EXPORT_JSON_DIR for exported json with same name
            FileInfo jsonPath = new FileInfo(Path.ChangeExtension(Path.Combine(jsonDi.FullName, file.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)), ".json"));
            if (jsonPath.Exists)
            {
                Console.WriteLine($"{GetTimeStamp()}WARNING:{jsonPath.FullName} already exists this file, please delete it!");
                return false;
            }
            return true;
        }

        /// <summary>
        /// document打开打开异常处理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void FailuresProcessing(object sender, FailuresProcessingEventArgs e)
        {
            FailuresAccessor failuresAccessor = e.GetFailuresAccessor();
            /// Deal with Warning
            failuresAccessor.DeleteAllWarnings();
            /// Deal with Error
            IList<FailureMessageAccessor> fmas = failuresAccessor.GetFailureMessages(FailureSeverity.Error);
            if (fmas.Count == 0)
            {
                e.SetProcessingResult(FailureProcessingResult.Continue);
                return;
            }
            else
            {
                foreach (FailureMessageAccessor fma in fmas)
                {
                    try
                    {
                        fma.SetCurrentResolutionType(FailureResolutionType.DeleteElements);
                        failuresAccessor.ResolveFailure(fma);
                    }
                    catch { }
                }
                try
                {
                    e.SetProcessingResult(FailureProcessingResult.ProceedWithCommit);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
                //failuresAccessor.SetFailureHandlingOptions(failuresAccessor.GetFailureHandlingOptions().SetClearAfterRollback(true));
                //e.SetProcessingResult(FailureProcessingResult.ProceedWithRollBack);
                return;
            }
        }

        /// <summary>
        /// Get a 3D view
        /// </summary>
        /// <param name="doc"></param>
        public static View3D GetA3DView(Document doc)
        {
            View3D view3D = null;
            ///Check if the current model has a 3D view
            FilteredElementCollector view3DCollector = new FilteredElementCollector(doc).OfClass(typeof(View3D));
            foreach (View3D view in view3DCollector)
            {
                if (view != null && !view.IsTemplate && view.CanBePrinted &&
                    view.ViewType.ToString() == "ThreeD" && (view.Name.Contains("三维") | view.Name.Contains("3D")))
                {
                    view3D = view;
                    break;
                }
            }
            ///If don't find a 3D view, create one
            if (view3D == null)
            {
                FilteredElementCollector vftCollector = new FilteredElementCollector(doc).OfClass(typeof(ViewFamilyType));
                foreach (ViewFamilyType vft in vftCollector)
                {
                    if (vft.IsValidDefaultTemplate(vft.DefaultTemplateId) && (vft.Name.Contains("三维视图") | vft.Name.Contains("3D View")))
                    {
                        using (Transaction tran = new Transaction(doc, "Creating a 3D View"))
                        {
                            try
                            {
                                tran.Start();
                                view3D = View3D.CreateIsometric(doc, vft.Id);
                                tran.Commit();
                                break;
                            }
                            catch { }
                        }
                    }
                }
            }
            ///Adjust ViewDetailLevel to Fine
            if (view3D.HasDetailLevel() && view3D.DetailLevel != ViewDetailLevel.Fine && view3D.CanModifyDetailLevel())
            {
                using (Transaction tran = new Transaction(doc, "update detail level"))
                {
                    try
                    {
                        tran.Start();
                        view3D.DetailLevel = ViewDetailLevel.Fine;
                        tran.Commit();
                    }
                    catch { }
                }
            }
            var a = new FilteredElementCollector(doc, view3D.Id).ToElements().ToArray();
            ///Set visibility in the current 3DView
            using (Transaction tran = new Transaction(doc, "set visibility"))
            {
                try
                {
                    tran.Start();
                    ///设置导出的类别
                    view3D.AreModelCategoriesHidden = false;
                    view3D.AreCoordinationModelHandlesHidden = true;
                    view3D.AreImportCategoriesHidden = false;
                    view3D.AreAnalyticalModelCategoriesHidden = true;
                    view3D.AreAnnotationCategoriesHidden = true;
                    view3D.ArePointCloudsHidden = true;
                    /////设置零件可视性
                    //view3D.PartsVisibility = PartsVisibility.ShowPartsAndOriginal;
                    ///设置剖面框不激活
                    view3D.IsSectionBoxActive = false;
                    ///设置裁剪区域不激活
                    view3D.CropBoxActive = false;
                    tran.Commit();
                }
                catch { }
            }
            return view3D;
        }


        /// <summary>
        /// 导出结束后文件夹的清理
        /// </summary>
        public static void OnFinishExport()
        {
            ///Delete the remaining empty folder after exported operation
            utils.DeleteEmptyFolders(Paths.UNEXPORTED_DIR);
            ///Gets non-RVT files
            FileInfo[] otherFiles = new DirectoryInfo(Paths.UNEXPORTED_DIR).GetFiles("*.*", SearchOption.AllDirectories)
                .Where(f => f.Extension != ".rvt")
                .ToArray();
            ///Move non-RVT files to the EXPORTED_DIR
            foreach (FileInfo file in otherFiles)
            {
                FileInfo filePath = new FileInfo(Path.Combine(Paths.EXPORTED_DIR, file.FullName.Substring(Paths.UNEXPORTED_DIR.Length + 1)));
                if (!filePath.Directory.Exists)
                {
                    Directory.CreateDirectory(filePath.Directory.FullName);
                }
                file.MoveTo(filePath.FullName);
            }
            ///Delete the remaining empty folder after Move operation
            utils.DeleteEmptyFolders(Paths.UNEXPORTED_DIR);
        }

        /// <summary>
        /// 删除空文件夹
        /// </summary>
        /// <param name="parentFolder"></param>
        public static void DeleteEmptyFolders(string parentFolder)
        {
            var subdirs = new DirectoryInfo(parentFolder).GetDirectories("*.*", SearchOption.AllDirectories);

            foreach (var subdir in subdirs)
            {
                if (!Directory.Exists(subdir.FullName)) continue;

                var subFiles = subdir.GetFileSystemInfos("*.*", SearchOption.AllDirectories);

                var findFile = false;
                foreach (var sub in subFiles)
                {
                    findFile = (sub.Attributes & FileAttributes.Directory) == 0;

                    if (findFile) break;
                }
                try
                {
                    if (!findFile) subdir.Delete(true);
                }
                catch { }
            }
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        public static void SendEMail(string body)
        {
            Encoding encoding = Encoding.UTF8;

            MailMessage Message = new MailMessage();
            //发信人姓名地址
            Message.From = new MailAddress("beilixaut@163.com", "libei", encoding);
            //收信人地址和姓名
            Message.To.Add("libei@cadg.cn");
            //抄送人
            Message.CC.Add("beilixaut@163.com");
            //标题
            Message.Subject = "自动导出反馈";
            Message.SubjectEncoding = encoding;
            //消息正文
            Message.Body = body;
            Message.BodyEncoding = encoding;
            //是否是HTML邮件
            Message.IsBodyHtml = false;
            //邮件优先级   
            Message.Priority = MailPriority.High;
            //信箱服务器
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Credentials = new NetworkCredential("beilixaut@163.com", "TTPAVGUIVOQHAXNM");
            smtpClient.Host = "smtp.163.com";
            try
            {
                smtpClient.Send(Message);
                Console.WriteLine($"{GetTimeStamp()}Successfully send email.");
            }
            catch (SmtpException ex)
            {
                Console.WriteLine($"{GetTimeStamp()}Failed to send email.");
                Console.WriteLine($"{GetTimeStamp()}{ex}");
            }
        }




        /// <summary>
        /// 获取时间戳
        /// </summary>
        /// <returns></returns>
        public static string GetTimeStamp()
        {
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string tradeTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss", System.Globalization.DateTimeFormatInfo.InvariantInfo);
            return $"[{tradeTime}] ";
        }

               

        public static FilteredElementCollector GetAllElement(Document document)
        {
            FilteredElementCollector collectorAll = new FilteredElementCollector(document);
            collectorAll.WherePasses(new LogicalOrFilter(new ElementIsElementTypeFilter(false), new ElementIsElementTypeFilter(true)));
            return collectorAll;
        }

        public static IEnumerable<Autodesk.Revit.DB.View> FindAllViewsThatCanDisplayElements(Document doc)
        {
            ElementMulticlassFilter filter = new ElementMulticlassFilter(new List<Type> { typeof(ViewPlan) });

            return new FilteredElementCollector(doc)
                .WherePasses(filter)
                .Cast<Autodesk.Revit.DB.View>()
                .Where(v => !v.IsTemplate && v.CanBePrinted);
        }
    }
}
