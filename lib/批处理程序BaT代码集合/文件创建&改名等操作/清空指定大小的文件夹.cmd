@echo off
:: 如果某个文件夹大于500M就清空
:: code by jm 2006-9-9 CMD@XP zxcv精简
set size=0
setlocal enabledelayedexpansion
for /f "tokens=3" %%i in ('dir /a /s /-c "文件夹"^|findstr "个文件"') do set size_=%%i
set /a size=%size:~0,-3%/1049
if %size% gtr 500 rd "文件夹" && md "文件夹"