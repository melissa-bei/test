using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoEvent02
{
    /// <summary>
    /// 自定义数字被修改参数类
    /// </summary>
    public class NumManipulationEventArgs : EventArgs
    {
        public int num { get; set; }
        public NumManipulationEventArgs(int n)
        {
            num = n;
        }
    }

    /// <summary>
    /// 事件触发者
    /// </summary>
    public class Trigger
    {
        private int num;

        public delegate void NumManipulationHandler(object sender, NumManipulationEventArgs e);  ///数字被修改捕获器
        public event NumManipulationHandler ChangeNum;  ///实例化一个delegate对象

        public Trigger(int n)
        {
            ///初始化num
            SetValue(n);
        }

        public void SetValue(int n)
        {
            if (num != n)
            {
                OnNumChanging(n);
                num = n;
                OnNumChanged(n);
            }
        }

        protected virtual void OnNumChanging(int n)
        {
        }

        protected virtual void OnNumChanged(int n)
        {
            if (ChangeNum != null)
            {
                ChangeNum(this, new NumManipulationEventArgs(n));
            }
            else
            {
                Console.WriteLine("The event was not registered.");
            }
        }
    }
    public class Trigger1 : Trigger
    {
        public Trigger1(int n) : base(n)  ///基类的初始化
        {  }

        protected override void OnNumChanging(int n)
        {
            
        }
    }

    /// <summary>
    /// 订阅类
    /// </summary>
    public class subscribEvent
    {
        public void printf(object sender, NumManipulationEventArgs e)
        {
            
            Console.WriteLine($"the num is set {e.num}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Trigger e = new Trigger(5);  ///实例化对象,第一次没有触发事件
            subscribEvent v = new subscribEvent();  ///实例化对象
            e.ChangeNum += new Trigger.NumManipulationHandler(v.printf);  ///注册
            e.SetValue(11);
            e.SetValue(20);
            e.ChangeNum -= new Trigger.NumManipulationHandler(v.printf);  ///取消注册
            e.SetValue(7);
        }
    }
}
