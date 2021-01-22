using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoEvent01
{
    /// <summary>
    /// 事件的触发者
    /// </summary>
    public class Control
    {
        public delegate void SomeHandler(object sender, EventArgs e);

        //public event EventHandler SomeEvent;
        public event SomeHandler SomeEvent;  ///声明使用自定义事件

                                             ///构造函数
        public Control()
        {
            this.SomeEvent += new SomeHandler(this.ProcessSomeEvent);///这里使用的delgate必须与事件中声明的一致
        }

        public void RaiseSomeEvent()
        {
            Console.WriteLine("Please input 'a':");
            string input = Console.ReadLine();

            ///用户输入'a'则触发
            if (input == "a")
            {
                EventArgs e = new EventArgs();
                SomeEvent(this, e);
            }
        }

        /// <summary>
        /// 事件触发者对于事件进行处理，这个方法的参数必须和代理中声明的一致
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ProcessSomeEvent(object sender, EventArgs e)
        {
            Console.WriteLine("I got an 'a'.");
        }
    }

    /// <summary>
    /// 事件的接收者
    /// </summary>
    public class Container
    {
        private Control control = new Control();

        /// <summary>
        /// 构造函数
        /// </summary>
        public Container()
        {
            control.SomeEvent += new Control.SomeHandler(this.ResponseSomeEvent);

            control.RaiseSomeEvent();
        }

        private void ResponseSomeEvent(object sender, EventArgs e)
        {
            Console.WriteLine("Some event occur.");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Container container = new Container();

            Console.ReadLine();
        }
    }
}
