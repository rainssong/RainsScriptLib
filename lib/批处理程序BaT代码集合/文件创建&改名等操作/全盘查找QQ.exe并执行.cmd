@echo off
:: 全盘查找qq.exe，找到之后就执行并退出CMD窗口
:: code by jm 2006-9-14 CMD@XP
:: fsutil fsinfo drives 得出来的结果虽然中间有空格，但是他代表是回车符或者换行符的作用，所以还要用find /v来过滤，否则，只得到第一个分区
setlocal enabledelayedexpansion
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
    set var=%%i
    set drive=!var:~-2!
    fsutil fsinfo drivetype !drive!|find "固定">nul && (
        for /f "tokens=*" %%j in ('dir /a-d /b /s !drive!\qq.exe 2^>nul') do if not "%%j"=="" start "" "%%j" && exit
    )    
)