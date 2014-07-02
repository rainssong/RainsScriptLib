@echo off
:: 获取当前目录及其子目录下所有文件的相对路径
:: code by jm 2006-12-17

set layers=0
set "cur_dir=%cd%\"
:get_cd_layers
set "cur_dir=%cur_dir:*\=%"
if not "%cur_dir%"=="" set /a layers+=1&goto get_cd_layers

for /f "delims=" %%i in ('dir /a-d /s /b /on') do call :intercept "%%~dpnxi"
pause
goto :eof

:intercept
set num=0
set sub_path=%1
set "sub_path=%sub_path:~1,-1%"
:loop
set "sub_path=%sub_path:*\=%"
if not %num% equ %layers% set /a num+=1&goto loop
echo "%sub_path%"
goto :eof