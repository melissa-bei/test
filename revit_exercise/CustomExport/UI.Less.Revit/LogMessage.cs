using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UI.Less.Revit
{
    /// <summary>
    /// 消息实体
    /// </summary>
    public class LogMessage
    {
        /// <summary>
        /// 日志级别
        /// </summary>
        public LogLevel Level { get; set; }

        /// <summary>
        /// 消息内容
        /// </summary>
        public String Message { get; set; }

        /// <summary>
        /// 异常对象
        /// </summary>
        public Exception Exception { get; set; }

        /// <summary>
        /// 堆栈信息
        /// </summary>
        public StackFrame StackFrame { get; set; }

        public String DetailInfo
        {
            get { return this.ToString(); }
        }

        public override string ToString()
        {
            var str = "";

            try
            {
                str += $"[LogLevel：{this.Level}]";
                str += $"[DateTime：{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.ffff")}]";
                str += $"[Class：{this.StackFrame?.GetMethod().DeclaringType.FullName}]";
                str += $"[Method：{this.StackFrame?.GetMethod().Name}]";
                str += $"[RowNumber：{this.StackFrame?.GetFileLineNumber()}]";
                str += $"[Message：{this.Message}]";
            }
            catch (Exception)
            {
            }

            return str;
        }
    }

    public enum LogLevel
    {
        //
        // 摘要:
        //     Logs that contain the most detailed messages. These messages may contain sensitive
        //     application data. These messages are disabled by default and should never be
        //     enabled in a production environment.
        Trace = 0,
        //
        // 摘要:
        //     Logs that are used for interactive investigation during development. These logs
        //     should primarily contain information useful for debugging and have no long-term
        //     value.
        Debug = 1,
        //
        // 摘要:
        //     Logs that track the general flow of the application. These logs should have long-term
        //     value.
        Information = 2,
        //
        // 摘要:
        //     Logs that highlight an abnormal or unexpected event in the application flow,
        //     but do not otherwise cause the application execution to stop.
        Warning = 3,
        //
        // 摘要:
        //     Logs that highlight when the current flow of execution is stopped due to a failure.
        //     These should indicate a failure in the current activity, not an application-wide
        //     failure.
        Error = 4,
        //
        // 摘要:
        //     Logs that describe an unrecoverable application or system crash, or a catastrophic
        //     failure that requires immediate attention.
        Critical = 5,
        //
        // 摘要:
        //     Not used for writing log messages. Specifies that a logging category should not
        //     write any messages.
        None = 6
    }

}
