import os
import sys

folder_man = sys.argv[1]
out_folder = sys.argv[2]

for filename in os.listdir(folder_man):
    file_path = os.path.join(folder_man, filename)
    if os.path.isfile(file_path):
        if file_path.split(".")[1] == "coffee":
            os.system(
                "../MemoriCoffeeScriptCompilerTool/MemoriCoffeeScriptCompilerTool.exe"
                + " "
                + file_path
                + " "
                + (out_folder + file_path.split(".")[0] + ".js")
            )
        elif file_path.split(".")[1] == "slang":
            os.system(
                "../MemoriShaderTool/MemoriShaderTool.exe"
                + " "
                + file_path
                + " "
                + (out_folder + file_path.split(".")[0] + ".hlsl")
            )

# MemoriToolLibrary.exe E:/MyGames/ProjectFiles/