using System;
using System.IO;
using Jint;

public class RunnerClass
{
    public void Memori_RunJavaScript(string cmd)
    {
        var engine = new Engine().Execute(File.ReadAllText(cmd));
    }
}