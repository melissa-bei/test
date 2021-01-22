using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoDelegatel
{
    class Program
    {
        ///1.声明delegate对象
        public delegate string MyDelegate(string name);

        /// <summary>
        /// 想要使用delegate调用的方法，传入的参数和返回值与delegate对象相同
        /// </summary>
        /// <param name="name"></param>
        public static string MyDelegateFunc(string name)
        {
            return name;
        }

        static void Main(string[] args)
        {
            ///2.实例化delegate对象
            MyDelegate md = new MyDelegate(MyDelegateFunc);

            ///3.调用delegate
            Console.WriteLine($"Hello, {md("melissa")}");
        }
    }
}
