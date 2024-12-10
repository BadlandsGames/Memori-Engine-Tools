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
        nuget install jint
    }
}
cd ..