using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class DiferentType
    {
        private int id = 0000;
        public readonly string name = "root";
        internal static int age = 18;
        private const string major = "计算机";

        private void PrintMsg()
        {
            Console.WriteLine("编号：" + id);
            Console.WriteLine("姓名：" + name);
            Console.WriteLine("年龄：" + age);
            Console.WriteLine("专业：" + major);
        }
        
        public int Id { get; set; }
        public int Name { get; set; }
        public int Age { get; set; }
        public int Major { get; set; }

    }
}
