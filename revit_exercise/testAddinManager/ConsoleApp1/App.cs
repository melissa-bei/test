using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class App
    {
        static void Main(string[] args)
        {
            //Program.FirstTry();
            //Program.FindDigit();
            //Program.IsLeapYear();
            //Program.IsEvenNumber();
            //Program.LogIn();

            //Book book = new Book();
            ////book.Id = 1;
            ////book.Name = "c#基础";
            ////book.Price = 30.0;
            //book.SetBook(1, "c#基础", 30.0);
            //book.PrintMsg();

            User user = new User("root", "0000", "13311111111");
            user.PrintMsg();
            Console.WriteLine("请按任意键继续……");
            Console.ReadLine();
        }
    }
}
