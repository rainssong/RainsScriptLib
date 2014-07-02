@echo off
:: 删除E盘根目录下指定文件夹之外的其他文件夹和文件
:: test.txt里保存有不带路径的指定文件夹名，一行一条记录
:: 代码和test.txt必须放在E盘之外的分区
:: code by jm 2006-12-25 CMD@XP
for /f "delims=" %%i in ('dir /a /b e:\') do (
    set flag=
    for /f "delims=" %%j in (test.txt) do if  /i "%%i"=="%%j" set flag=1
    if not defined flag del /a /f "e:\%%i" 2>nul||rd /s "e:\%%i" 2>nul
)
pause