using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Exercise
    {
        public static void FirstTry()
        {
            Console.WriteLine("This is first line.");
            Console.WriteLine("Thie is Second Line.");
            Console.ReadKey();
        }
        public static void FindDigit()
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
        public static string YesOrNo(Boolean flag)
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
        public static void IsLeapYear()
        {
            Console.WriteLine("判断某一年是否为闰年！！！");
            Console.WriteLine("请输入某一年：");
            int num = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(num + "年" + Exercise.YesOrNo(num % 4 == 0) + "闰年。");
            Console.ReadKey();
        }
        public static void IsEvenNumber()
        {
            Console.WriteLine("判断一个数字是否为偶数！！！");
            Console.WriteLine("请输入一个数字：");
            int num = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(num + Exercise.YesOrNo(num % 2 == 0) + "偶数。");
            Console.ReadKey();
        }
        public static void LogIn()
        {
            int count = 1;
        login:
            Console.WriteLine("请输入用户名");
            string username = Console.ReadLine();
            Console.WriteLine("请输入密码");
            string userpwd = Console.ReadLine();
            if (username == "aaa" && userpwd == "123")
            {
                Console.WriteLine("登录成功");
            }
            else
            {
                count++;
                if (count > 3)
                {
                    Console.WriteLine("用户名或密码错误次数过多！退出！");
                }
                else
                {
                    Console.WriteLine("用户名或密码错误");
                    goto login;//返回login标签处重新输入用户名密码
                }
            }
        }
    }
}
