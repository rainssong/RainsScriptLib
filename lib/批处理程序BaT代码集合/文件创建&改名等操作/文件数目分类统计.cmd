@echo off
:: 可以扩展到某个分区、全盘的情况
:: Code by JM 2007-2-11 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27628
for /f "delims=" %%i in ('dir /a-d /b e:\ 2^>nul') do (
    set /a num%%~xi+=1
)
echo.&echo.
echo             E盘根目录下文件分类统计情况：
echo.&echo.
for /f "tokens=2,3 delims==." %%i in ('set num. 2^>nul') do echo 		%%i 文件有 %%j 个
pause