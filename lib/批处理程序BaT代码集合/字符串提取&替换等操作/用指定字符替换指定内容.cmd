@echo off
setlocal enabledelayedexpansion
set file=
set /p file=  请输入要操作的文件名称(包括扩展名)：
set "file=%file:"=%"
for %%i in ("%file%") do set file=%%~fi
echo.
set replaced=
set /p replaced= 请输入即将被替换的内容：
echo.
set all=
set /p all=  请输入替换字符串：
for /f "delims=" %%i in ('type "%file%"') do (
    set str=%%i
    set "str=!str:%replaced%=%all%!"
    echo !str!>>"%file%"_tmp.txt
)
copy "%file%" "%file%"_bak.txt >nul 2>nul
move "%file%"_tmp.txt "%file%"
start "" "%file%"