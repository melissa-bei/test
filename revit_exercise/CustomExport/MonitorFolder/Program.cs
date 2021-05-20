using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;


namespace MonitorFolder
{

    class Program
    {
        public static DirectoryInfo CURRENT_PATH = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);
        //未导出的目录
        public static string UNEXPORTED_DIR = Path.Combine(CURRENT_PATH.Parent.Parent.Parent.Parent.FullName, "resource\\unexportedfile");

        static void Main(string[] args)
        {
            Program program = new Program();
            program.WatcherStrat(UNEXPORTED_DIR, "*.rvt"); //由于是控制台程序，加个输入避免主线程执行完毕，看不到监控效果   
        }

        private void WatcherStrat(string path, string filter)
        {
            FileSystemWatcher watcher = new FileSystemWatcher();

            watcher.Path = path;
            watcher.Filter = filter;
            watcher.IncludeSubdirectories = true;
            //设置相应操作
            watcher.Changed += new FileSystemEventHandler(OnProcess);
            watcher.Created += new FileSystemEventHandler(OnProcess);
            watcher.Deleted += new FileSystemEventHandler(OnProcess);
            watcher.Renamed += new RenamedEventHandler(OnRenamed);
            // 启用监听
            watcher.EnableRaisingEvents = true;
            // 等待用户退出
            Console.WriteLine($"{GetTimeStamp()}Press \'q\' to quit the sample.");
            while (Console.Read() != 'q') ;
        }
        private void OnProcess(object source, FileSystemEventArgs e)
        {
            if (e.ChangeType == WatcherChangeTypes.Created)
            {
                OnCreated(source, e);
            }
            else if (e.ChangeType == WatcherChangeTypes.Changed)
            {
                OnChanged(source, e);
            }
            else if (e.ChangeType == WatcherChangeTypes.Deleted)
            {
                OnDeleted(source, e);
            }
        }
        private void OnCreated(object source, FileSystemEventArgs e)
        {
            ///获取所有rvt文件的路径
            FileInfo[] rvtList = new DirectoryInfo(UNEXPORTED_DIR).GetFiles("*.rvt", SearchOption.AllDirectories);
            Console.Write($"{GetTimeStamp()}新添加{rvtList.Count()}个rvt文件: ");
            foreach (FileInfo file in rvtList)
            {
                Console.Write($"{file.FullName} ");
            }
            Console.WriteLine();
            ///导出
            Console.WriteLine($"{GetTimeStamp()}开始导出……");
            ExportProcess();
            ///发送邮件
            SendEMail(string.Join("\r\n", rvtList.ToList()));
        }
        private void OnChanged(object source, FileSystemEventArgs e)
        {
        }
        private void OnDeleted(object source, FileSystemEventArgs e)
        {
            Console.WriteLine($"{GetTimeStamp()}\"{e.Name}\" 被移出！");
        }
        private void OnRenamed(object source, RenamedEventArgs e)
        {
            Console.WriteLine($"{GetTimeStamp()}\"{e.OldName}\" 被重命名为 \"{e.Name}\" !");
        }

        /// <summary>
        /// 判断文件夹是否为空
        /// </summary>
        /// <returns></returns>
        bool IsFolderEmpty()
        {
            if (Directory.GetDirectories(UNEXPORTED_DIR).Length > 0 || Directory.GetFiles(UNEXPORTED_DIR).Length > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// 导出的进程
        /// </summary>
        void ExportProcess()
        {
            Process process = new Process();
            process.StartInfo.FileName = Path.Combine(CURRENT_PATH.Parent.Parent.Parent.Parent.FullName, @"CustomExport\UI.Less.Revit\bin\Debug\UI.Less.Revit.exe");//执行的exe路径
            process.StartInfo.UseShellExecute = false;//不显示shell
            process.StartInfo.CreateNoWindow = false;//不创建窗口
            process.StartInfo.RedirectStandardInput = true;//打开流输入
            process.StartInfo.RedirectStandardOutput = true;//打开流输出
            process.StartInfo.RedirectStandardError = true;//打开错误流
            process.Start();//执行
            string msg = process.StandardOutput.ReadToEnd();//读取输出
            process.WaitForExit();//等待执行完成
            process.Close();//结束
            Console.WriteLine($"{GetTimeStamp()}导出完成！");
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        void SendEMail(string body)
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
            FileInfo[] rvtList = new DirectoryInfo(UNEXPORTED_DIR).GetFiles("*.rvt", SearchOption.AllDirectories);
            if (rvtList.Count() == 0)
            {
                Message.Body = $"全部导出成功！\n{body}";
            }
            else
            {
                List<string> fails = rvtList.Select(t => t.FullName).ToList();
                Message.Body = $"{fails.Count}个文件导出失败！\n{string.Join("\r\n", fails)}";
            }

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
                Console.WriteLine($"{GetTimeStamp()}邮件发送成功");
            }
            catch (SmtpException ex)
            {
                Console.WriteLine($"{GetTimeStamp()}邮件发送失败");
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
            return "[" + tradeTime + "] ";
        }
    }
}
