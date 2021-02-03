using System;


namespace TestEquals
{
    class Person
    {
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public Person(string name)
        {
            this.name = name;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            string a = new string(new char[] { 'h', 'e', 'l', 'l', 'o' });
            string b = new string(new char[] { 'h', 'e', 'l', 'l', 'o' });
            Console.WriteLine(a == b);
            Console.WriteLine(a.Equals(b));
            object g = a;
            object h = b;
            Console.WriteLine(g == h);
            Console.WriteLine(g.Equals(h));
            Person p1 = new Person("jia");
            Person p2 = new Person("jia");
            Console.WriteLine(p1 == p2);
            Console.WriteLine(p1.Equals(p2));
            Person p3 = new Person("jia");
            Person p4 = p3;
            Console.WriteLine(p3 == p4);
            Console.WriteLine(p3.Equals(p4));
            Console.ReadLine();
        }
    }
}
