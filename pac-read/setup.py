import sys
from cx_Freeze import setup, Executable

build_exe_options = {"packages": ["sys", "os", "subprocess", "shutil",
                                  "winreg", "configparser", "datetime",
                                  "traceback", "re"]}

# This is the location at build time, not in the repo. See the
# file '../win32_dist.sh'.
with open("../../../VERSION") as file:
    myversion = file.read()

setup (name = "pac-read",
       version = myversion,
       description = "pack-it-forms form display wrapper for PacFORMS pac-read.exe",
       authors = "pack-it-forms development team",
       options = {"build_exe": build_exe_options},
       executables = [Executable("pac-read.py")])
