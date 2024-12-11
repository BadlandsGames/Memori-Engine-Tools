using System;
using System.Runtime.InteropServices;

class Program
{
    [DllImport("JSRunner.dll", CharSet = CharSet.Unicode)]
    public static extern Memori_RunJavaScript(string cmd);
    static void Main(string[] args)
    {
        string file_man = (string) args[1];
        Memori_RunJavaScript(file_man);
    }
}