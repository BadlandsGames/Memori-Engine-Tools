cd Tools
if($true) {
    # Memori Engine
    if($true) {
        cd ..
        mkdir Engine
        cd Engine
        git init
        git remote add origin git@github.com:BadlandsGames/Memori-Engine.git
        git pull origin engine
        Invoke-WebRequest -Uri "https://www.cryengine.com/download" -OutFile "CRYENGINE_Launcher.exe"
        Start-Process -FilePath "CRYENGINE_Launcher.exe" -ArgumentList "/silent" -Wait
        cd Tools
    }
    # Memori Tool Library
    if($true) {}
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