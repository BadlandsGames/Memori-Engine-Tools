using System;
using System.Runtime.InteropServices;
using Jint;

class Program
{
    static void Main(string[] args)
    {
        string file_man = (string) args[1];
        var engine = new Engine();
        string text_stuff = File.ReadAllText(file_man);
        engine.SetValue("log", new Action<object>(Console.WriteLine));
        text_stuff = text_stuff.Replace("console.log", "log");
        engine.Execute(text_stuff);
    }
}