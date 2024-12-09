#include <iostream>
using namespace std;

void compile_file(string inputfile, string outputfile, bool windows) {
    string cmd1 = "";
    string cmd2 = "";
    cmd1.append("slangc");
    cmd1.append(" ");
    cmd1.append(inputfile);
    cmd1.append(" ");
    cmd1.append("-target");
    cmd1.append(" ");
    cmd1.append("hlsl");
    cmd1.append(" ");
    cmd1.append("-o");
    cmd1.append(" ");
    cmd1.append(outputfile);
    if(windows) {
        cmd2.append("ShaderConductor.exe");
    } else {
        cmd2.append("./ShaderConductor.elf");
    }
    cmd2.append(" ");
    cmd2.append("-i");
    cmd2.append(" ");
    cmd2.append(outputfile);
    cmd2.append(" ");
    cmd2.append("-o");
    cmd2.append(" ");
    cmd2.append("output");
    cmd2.append(" ");
    cmd2.append("-t");
    cmd2.append(" ");
    cmd2.append("hlsl");
    cmd2.append(" ");
    cmd2.append("-s");
    cmd2.append(" ");
    cmd2.append("cryengine");
    system(cmd1);
    system(cmd2);
}
