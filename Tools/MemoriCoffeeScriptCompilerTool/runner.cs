using System;
using System.IO;
using Jint;

public class RunnerClass
{
    public void Memori_RunJavaScript(string cmd)
    {
        var engine = new Engine();
        string text_stuff = File.ReadAllText(cmd);
        /*
        engine.SetValue("log", new Action<object>(Console.WriteLine));
        text_stuff = text_stuff.Replace("console.log", "log");
        */
        engine.Execute(text_stuff);
    }
}