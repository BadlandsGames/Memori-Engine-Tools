Write-Host "Enter your operating system:"
Write-Host "win: Windows"
Write-Host "linux: Linux"
$choice_os = Read-Host -Prompt "choice"

# Memori Shader Tool
cd MemoriShaderTool
Clear-Host
if($choice_os -eq "win") {
    Clear-Host
    cl /EHsc compiler.cpp
    ren compiler.exe MemoriShaderTool.exe
    mkdir MemoriShaderTool
    move MemoriShaderTool.exe MemoriShaderTool\MemoriShaderTool.exe
    move ShaderConductor.exe MemoriShaderTool\ShaderConductor.exe
    del compile.cpp
    del api.hpp
} elseif($choice_os -eq "linux") {
    Clear-Host
    g++ -o MemoriShaderTool.elf compiler.cpp
    git clone https://github.com/microsoft/ShaderConductor.git
    cd ShaderConductor
    mkdir Build
    cd Build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
    objcopy --input-format=pei-x86-64 --output-format=elf64-x86-64 ShaderConductor.dll ../../ShaderConductor.elf
    cd ..
    cd ..
    mkdir MemoriShaderTool
    mv MemoriShaderTool.elf MemoriShaderTool\MemoriShaderTool.elf
    mv ShaderConductor.elf MemoriShaderTool\ShaderConductor.elf
    rm -rf ShaderConductor
    rm compile.cpp
    rm api.hpp
} else {
    Clear-Host
    Write-Host "Error: Operating System doesn't exist."
}
cd ..