using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Program
    {
        static void FirstTry()
        {
            Console.WriteLine("This is first line.");
            Console.WriteLine("Thie is Second Line.");
            Console.ReadKey();
        }
        static void FindDigit()
        {
            Console.WriteLine("输出四位数各个数位上的数字！！！");
            Console.WriteLine("请输入一个四位数字：");
            //从键盘获取用户输入的数字
            int num = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("千位" + num / 1000);
            Console.WriteLine("百位" + num / 100 % 10);
            Console.WriteLine("十位" + num / 10 % 10);
            Console.WriteLine("个位" + num % 10);
            Console.ReadKey();
        }
        static string YesOrNo(Boolean flag)
        {
            if (flag)
            {
                return "是";
            }
            else
            {
                return "不是";
            }
        }
        static void IsLeapYear()
        {
            Console.WriteLine("判断某一年是否为闰年！！！");
            Console.WriteLine("请输入某一年：");
            int num = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(num + "年" + Program.YesOrNo(num % 4 == 0) + "闰年。");
            Console.ReadKey();
        }
        void IsEvenNumber()
        {
            Console.WriteLine("判断一个数字是否为偶数！！！");
            Console.WriteLine("请输入一个数字：");
            int num = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(num + Program.YesOrNo(num % 2 == 0) + "偶数。");
            Console.ReadKey();
        }
        static void Main(string[] args)
        {
            //FirstTry();
            //FindDigit();
            //IsLeapYear();
            //IsEvenNumber();
            var course = System.Diagnostics.Process.Start(@"C:\Program Files\Autodesk\Revit 2020\Revit.exe");
            var windiw = course.MainWindowHandle;
            Console.ReadKey();
        }
    }
}
