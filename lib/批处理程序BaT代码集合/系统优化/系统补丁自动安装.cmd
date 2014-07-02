@echo off
goto begain

把本脚本放在补丁目录下直接运行
注意：补丁目录下的1 2 3 4文件夹将被全新创建，请保证这四个文件夹内没有重要资料
本脚本主体代码来源于网络，jm于2006-8-15进行了部分修改
号称for 98/ME/2000/XP/2003
只测试了XP和2003的系统

:begain
title 系统补丁自动安装程序
color 1f
md 1 2 3 4 >nul 2>nul
for %%i in (*.exe) do (
    (echo %%i|findstr "updfile">nul 2>nul && move %%i 1) || (
    echo %%i|findstr "_sfx_cab_exe_package">nul 2>nul && move %%i 2) || (
    echo %%i|findstr "update.exe">nul 2>nul && move %%i 3) || (
    echo %%i|findstr "_sfx_cab_exe_path">nul 2>nul && move %%i 4)
)
If not exist *.exe (goto auto_install) else (goto list)
:list
echo.
echo              ========================================================
echo.
for %%i in (*.exe) do echo                %%i 需要手动安装
echo.
echo              ========================================================
echo.
echo               当可自动安装的补丁安装完毕之后，请手动安装上述补丁
:auto_install
echo.
echo              ========================================================
echo.
echo               所有可自动安装的补丁已经被分别放在 目录 1 2 3 4 中。
echo.
echo                            按任意键继续...
pause>nul
cd /d 1
for %%i in (*.exe) do start /wait %%i /q
cd /d 2
for %%i in (*.exe) do start /wait %%i /passive /norestart /o /n
cd /d 3
for %%i in (*.exe) do start /wait %%i -n -o -z
cd /d 4
for %%i in (*.exe) do start /wait %%i /passive /norestart /o /n