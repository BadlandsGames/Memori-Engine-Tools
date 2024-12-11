#include <iostream>
#include <windows.h>
#include <string>
using namespace std;

void copy_file(string inputfile, string outputfile) {
    string newcmd = "";
    newcmd.append("copy");
    newcmd.append(" ");
    newcmd.append(inputfile);
    newcmd.append(" ");
    newcmd.append(outputfile);
}

void js2coffee(string inputjs, string outputcoffee) {
    string newcmd = "";
    newcmd.append("js2coffee");
    newcmd.append(" ");
    newcmd.append(inputjs);
    newcmd.append(" ");
    newcmd.append("-o");
    newcmd.append(" ");
    newcmd.append(outputcoffee);
    system(newcmd);
}

void coffee2js(string inputcoffee, string outputjs) {
    string newcmd = "";
    copy_file(inputfile, "index.coffee");
    newcmd.append("coffee -c index.coffee");
    newcmd.append(" ");
    newcmd.append("&&");
    newcmd.append(" ");
    newcmd.append("ren index.js");
    newcmd.append(" ");
    newcmd.append(outputjs);
    system(newcmd);
}