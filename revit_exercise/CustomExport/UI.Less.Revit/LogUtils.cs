using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;

namespace UI.Less.Revit
{
    /// <summary>
    /// 日志工具类
    /// 按天记录日志
    /// </summary>
    public class LogUtils
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        static LogUtils()
        {
            m_queue = new ConcurrentQueue<LogMessage>();
            m_mre = new ManualResetEvent(false);
            m_lock = new ReaderWriterLockSlim();
            Task.Run(() => Initialize());
        }


        /// <summary>
        /// 堆栈跟踪日志
        /// </summary>
        /// <param name="message"></param>
        /// <param name="args"></param>
        public static LogMessage LogTrace(String message, params object[] args)
        {
            return Log(LogLevel.Trace, null, message, args);
        }

        /// <summary>
        /// Debug 日志
        /// </summary>
        /// <param name="message"></param>
        /// <param name="args"></param>
        public static LogMessage LogDebug(String message, params object[] args)
        {
            return Log(LogLevel.Debug, null, message, args);
        }

        /// <summary>
        /// 信息日志
        /// </summary>
        /// <param name="message">日志内容</param>
        /// <param name="args">字符串格式化参数</param>
        public static LogMessage LogInformation(String message, params object[] args)
        {
            return Log(LogLevel.Information, null, message, args);
        }

        /// <summary>
        /// Warning 日志
        /// </summary>
        /// <param name="message"></param>
        /// <param name="args"></param>
        public static LogMessage LogWarning(String message, params object[] args)
        {
            return Log(LogLevel.Warning, null, message, args);
        }

        /// <summary>
        /// 错误日志
        /// </summary>
        /// <param name="message">自定义信息</param>
        /// <param name="args">字符串格式化参数</param>
        public static LogMessage LogError(String message, params object[] args)
        {
            return Log(LogLevel.Error, null, message, args);
        }

        /// <summary>
        /// 错误日志
        /// </summary>
        /// <param name="ex">错误Exception</param>
        /// <param name="message">自定义信息</param>
        /// <param name="args">字符串格式化参数</param>
        public static LogMessage LogError(Exception ex, String message = "", params object[] args)
        {
            return Log(LogLevel.Error, ex, message, args);
        }

        /// <summary>
        /// Critical 日志
        /// </summary>
        /// <param name="message"></param>
        /// <param name="args"></param>
        public static LogMessage LogCritical(String message, params object[] args)
        {
            return Log(LogLevel.Critical, null, message, args);
        }


        #region 私有方法

        public static LogMessage Log(LogLevel logLevel, Exception ex, String message, params object[] args)
        {
            StackFrame stackFrame = null;
            if (ex != null)
            {
                var frames = new StackTrace(ex, true).GetFrames();
                stackFrame = frames.FirstOrDefault();
            }

            if (stackFrame == null)
            {
                stackFrame = new StackTrace(true).GetFrame(2);
            }

            var logMessage = new LogMessage
            {
                Level = logLevel,
                Exception = ex,
                Message = String.Format(Regex.Replace(message?.Replace("{", "{{").Replace("}", "}}") ?? "", @"{{(\d+)}}", "{$1}"), args),
                StackFrame = stackFrame
            };
            m_queue.Enqueue(logMessage);
            m_mre.Set();

            return logMessage;
        }

        /// <summary>
        /// 日志初始化
        /// </summary>
        private static void Initialize()
        {
            while (true)
            {
                m_mre.WaitOne(); // 等待信号通知
                Write(); // 写入日志
                m_mre.Reset(); // 重新设置信号
                Thread.Sleep(m_logInterval);
            }
        }

        /// <summary>
        /// 写入日志
        /// </summary>
        private static void Write()
        {
            // var onfigDir = ConfigurationManager.AppSettings["LogDir"] ?? @"CBIMLogs";
            // var logDir = GetPhysicalPath(m_configDir);

            //根据当天日期创建日志文件
            var assemblyPath = typeof(LogUtils).Assembly.Location;
            var baseDir = Path.GetDirectoryName(assemblyPath);
            var fileName = $"{DateTime.Now.ToString("yyyy-MM-dd")}.log";
            var logDir = Path.Combine(baseDir, m_configDir);
            var logFilePath = Path.Combine(baseDir, m_configDir, fileName);

            try
            {
                m_lock.EnterWriteLock(); //进入写锁
                if (!Directory.Exists(logDir))
                    Directory.CreateDirectory(logDir);

                StreamWriter swInfo = null;
                if ((bool)(m_queue?.Any()))
                {
                    swInfo = new StreamWriter(logFilePath, true, Encoding.UTF8);
                }

                //判断日志队列中是否有内容，从列队中获取内容，并删除列队中的内容
                while (m_queue?.Count > 0 && m_queue.TryDequeue(out LogMessage logMessage))
                {
                    var sf = logMessage.StackFrame;
                    //Info
                    if (swInfo != null)
                    {
                        swInfo.WriteLine($"[LogLevel：{logMessage.Level}]");
                        swInfo.WriteLine($"[DateTime：{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.ffff")}]");
                        swInfo.WriteLine($"[Class：{sf?.GetMethod().DeclaringType.FullName}]");
                        swInfo.WriteLine($"[Method：{sf?.GetMethod().Name}]");
                        swInfo.WriteLine($"[RowNumber：{sf?.GetFileLineNumber()}]");
                        swInfo.WriteLine($"[Message：{logMessage.Message}]");
                        swInfo.WriteLine(new String('-', 100));
                        swInfo.WriteLine(String.Empty);
                    }
                }
                //释放并关闭资源
                if (swInfo != null)
                {
                    swInfo.Close();
                    swInfo.Dispose();
                }
                if (swInfo != null)
                {
                    swInfo.Close();
                    swInfo.Dispose();
                }
            }
            finally
            {
                //退出写锁
                m_lock.ExitWriteLock();
            }
        }

        /// <summary>
        /// 获取物理路径
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        private static String GetPhysicalPath(String path)
        {
            var physicalPath = AppDomain.CurrentDomain.BaseDirectory;
            if (!String.IsNullOrEmpty(path))
            {
                path = path.Replace("~", "").Replace("/", @"\").TrimStart('\\').TrimEnd('\\');
                var start = path.LastIndexOf('\\') + 1;
                var length = path.Length - start;
                physicalPath = Path.Combine(physicalPath, path.Substring(start, length).Contains(".") ? path : path + @"\");
            }
            return physicalPath;
        }

        #endregion


        /// <summary>
        /// 线程安全队列
        /// </summary>
        private static readonly ConcurrentQueue<LogMessage> m_queue;

        /// <summary>
        /// 
        /// </summary>
        private static readonly ManualResetEvent m_mre;

        /// <summary>
        /// 日志写锁
        /// </summary>
        private static readonly ReaderWriterLockSlim m_lock;

        private static int m_logInterval = 3000;

        private static String m_configDir = "Logger";

    }

}
