@echo off
:: 保留空行替换字符串
:: 当行首有冒号时会抛掉最开始的几个连续冒号(这个问题可以解决)
:: 会忽略以分号开头的行
:: 不能正确处理感叹号(因为启用了变量延迟)
:: code by jm modify on 2006-11-1
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22033

set file=
set /p file=  请把要处理的文件拉到本窗口：
set "file=%file:"=%"
for %%i in ("%file%") do set "file=%%~fi"
echo.
set replaced=
set /p replaced= 请输入即将被替换的内容：
echo.
set all=
set /p all=  请输入替换字符串：
cd.>"%file%_tmp.txt"
setlocal enabledelayedexpansion
for /f "tokens=1* delims=:" %%i in ('findstr /n .* "%file%"') do (
    set str=%%j
    if not "!str!"=="" set "str=!str:%replaced%=%all%!"
    >>"%file%_tmp.txt" echo.!str!
)
copy "%file%" "%file%_bak.txt" >nul 2>nul
move "%file%_tmp.txt" "%file%"
start "" "%file%"