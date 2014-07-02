@echo off
title 文件归类整理器-test

::===================================================================================
:: 目的：
::
::     对当前目录及其所有子目录下的文件进行归类。
::
:: 整理结果：
::
:: 　　在当前目录及其子目录下，以该文件夹里的文件类型名为文件夹名，在该文件
:: 所在目录下建立形如 exe文件、rar文件 之类的文件夹，不同类型的文件移动到
:: 对应的文件夹下。
:: 　　如果以后增添了新文件，再次运行本脚本时，若该位置已经存在对应的文件夹，
:: 将把新添的文件保存在该文件夹下；若不存在对应的文件夹，将新建文件夹以保存
:: 该文件。
::
:: 下一版将要实现的功能：
::
:: 　　① 对以当前目录为起点，指定层深的子目录进行整理；
:: 　　② 整理指定类型以外的文件。
::
:: 更新历史：
::
:: 2006-12-16
::
:: 　　增添了对已经归类的文件不再整理的功能，此为V1.1；
::
:: 2006-12-15
::
:: 　　在只能整理当前目录下不同类型文件的基础上，写出了能对当前目录及其所有子目录下的
:: 不同类型文件进行操作的代码，此为V1.0；
::===================================================================================


set "file_route=%cd%"
for /f "delims=" %%i in ('dir /a-d /b /s /oe') do (
    set "nx_name=%%~nxi"
    call :build_dir %%~xi "%%~dpi"
    set file_type=%%~xi
    set "file_route=%%~dpi"
)
goto :eof

rem ======= 按文件类型创建文件夹 =======
:build_dir
set types=%1
set route=%2
set types=%types:~1%
set "route=%route:~1,-1%"
set "cd_name=%route:~0,-1%"

rem ======= 获取文件所在的目录名 =======
:get_cd_name
set "cd_name_tmp=%cd_name:\=%"
set "cd_name=%cd_name:*\=%"
if not "%cd_name%"=="%cd_name_tmp%" goto get_cd_name

:: 通过对比文件类型名和目录名来判断哪些文件已经整理过
if "%cd_name%"=="%types%文件" goto :eof

:: 判断文件所在位置是否发生了变化
if %2=="%file_route%" (set chang_dir=) else set chang_dir=yes&set file_type=

:: 判断要处理的文件是不是批处理文件自身
if "%route%%nx_name%"=="%~f0" (set file_self=yes) else set file_self=

:: 判断文件类型是否发生了变化
if "%1"=="%file_type%" (set same_type=yes) else set same_type=

if not defined chang_dir (
    if not defined file_self if not defined same_type md "%route%%types%文件" 2>nul
    ) else (
    if not defined file_self if not defined same_type md "%route%%types%文件" 2>nul
)
if not defined file_self move /-y "%route%\%nx_name%" "%route%%types%文件"
goto :eof