using System;
using Jint;

public class RunnerClass
{
    public void Memori_RunJavaScript(string cmd)
    {
        var engine = new Engine().Execute(cmd);
    }
}