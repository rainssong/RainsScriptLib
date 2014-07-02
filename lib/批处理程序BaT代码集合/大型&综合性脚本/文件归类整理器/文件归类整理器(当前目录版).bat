@echo off
title 文件归类整理器

:: 目的：
::
:: 　　对当前目录下的不同文件进行归类操作(不处理子目录)
::
:: 2006-12-16 修改了一处错误

for /f "delims=" %%i in ('dir /a-d /b /oe') do (
    set "nx_name=%%~nxi"
    call :build_dir %%~xi
    set file_type=%%~xi

)
goto :eof

rem ======= 按文件类型创建文件夹 =======
:build_dir
set types=%1
set types=%types:~1%

:: 判断要处理的文件是不是批处理自身
if "%nx_name%"=="%~nx0" (set file_self=yes&set file_type=) else set file_self=

:: 判断文件类型是否发生了变化
if "%file_type%"=="%1" (set same_type=yes) else set same_type=

if not defined file_self if not defined same_type md %types%文件 2>nul
if not defined file_self move /-y "%nx_name%" %types%文件
goto :eof
