::code by lxmxn @ cn-dos.net .
::目的：帮助新手们更好的理解变量字符截取功能.
::Date 2006-12-16 .
::说明：有的变量截取之后值为空，这是正常的.
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25746
@echo off&setlocal EnableDelayedexpansion
::设置变量var的值：
set var=0123456789ABCDEF
call :begin
for /l %%a in (1,3,15) do (
    for /l %%b in (1,4,15) do (
        call :printf %%a %%b
    )
)
call :begin
for /l %%a in (1,4,15) do (
    for /l %%b in (-1,-3,-15) do (
        call :printf  %%a %%b
    )
)
call :begin
for /l %%a in (-2,-3,-15) do (
    for /l %%b in (1,4,15) do (
        call :printf  %%a %%b
    )
)
call :begin
for /l %%a in (-1,-4,-15) do (
    for /l %%b in (-2,-3,-15) do (
        call :printf  %%a %%b
    )
)
pause
endlocal&cls&echo.
echo 演示结束了，任意键退出……
pause>nul
goto :eof

::输出结果：
:printf
    echo %%var:~%1,%2%%        截取之后的字符为:        !var:~%1,%2!
    goto :eof

::清理屏幕：
:begin
    echo\&pause&cls&echo.
    echo                         变量var的值为:        %var%
    echo.
    goto :eof
