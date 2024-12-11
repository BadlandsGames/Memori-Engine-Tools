#include <iostream>
#include <windows.h>
#include <fstream>
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

void mergefile(string firstfile, string secondfile, string outputfile) {
    string full_first = "";
    string full_second = "";
    string out_maybe = "";
    string temp = "";
    string temp2 = "";
    ifstream First(firstfile);
    ifstream Second(secondfile);
    while(getline(First, temp)) {
        full_first.append(temp);
        full_first.append("\n");
        temp = "";
    }
    while(getline(Second, temp2)) {
        full_second.append(temp2);
        full_second.append("\n");
        temp2 = "";
    }
    First.close();
    Second.close();
    out_maybe.append(full_first);
    out_maybe.append("\n");
    out_maybe.append(full_second);
    ofstream OutFile(outputfile);
    OutFile << out_maybe;
    OutFile.close();
}