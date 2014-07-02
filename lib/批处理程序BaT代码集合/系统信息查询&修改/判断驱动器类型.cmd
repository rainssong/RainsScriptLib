@echo off
:: 检测本地存在的驱动器并判断类型
:: fsutil必须具备管理员权限才能够运行
:: code by pip modified by jm 2006-9-1、9-17
setlocal enabledelayedexpansion
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
    set var=%%i
    set drive=!var:~-2!
    fsutil fsinfo drivetype !drive!|find /i "CD-ROM">nul && echo !drive!
)
pause
goto :eof

@echo off
:: code by 3742668 2006-12-6 CMD@XP
    set /p x=输入盘符:
    for /f "skip=1" %%i in ('wmic logicaldisk where "deviceid='%x%:'" get Description 2^>nul') do set type=%%i
    if not defined type set type=此驱动器不存在!    
    echo %x%:盘的类型为: %type%
    pause>nul
goto :eof


对以下语句产生的 info.txt 进行提取就可以判断类型了，无需管理员权限
:: code by 3742668 2006-12-6 CMD@XP
start msinfo32 /categories +componentsstoragedrives /report info.txt

