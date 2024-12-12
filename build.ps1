cd Tools
if($true) {
    # Memori Tool Library
    if($true) {
        cd MemoriToolLibrary
        pyinstaller --onefile index.py
        ren index.exe MemoriToolLibrary.exe
        cd ..
    }
    # Memori Shader Tool
    if($true) {
        cd MemoriShaderTool
        Clear-Host
        cl /EHsc compiler.cpp
        ren compiler.exe MemoriShaderTool.exe
        mkdir MemoriShaderTool
        move MemoriShaderTool.exe MemoriShaderTool.exe
        move ShaderConductor.exe ShaderConductor.exe
        del compile.cpp
        del api.hpp
        cd ..
    }
    # Memori CoffeeScript Compiler Tool
    if($true) {
        cd MemoriCoffeeScriptCompilerTool
        nuget install jint
        cl /EHsc compile.cpp
        ren compile.exe MemoriCoffeeScriptCompilerTool.exe
        del compile.cpp
        del runner.cs
        del api.hpp
        cd ..
    }
    # Memori JavaScript Runner Tool
    if($true) {
        cd MemoriJavaScriptRunnerTool
        mcs -out:MemoriJavaScriptRunnerTool.exe index.cs
        del index.cs
        cd ..
    }
}
cd ..