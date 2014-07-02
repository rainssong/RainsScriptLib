@echo off
:: 对当前目录下所有以ca开头的含有数字的文件进行改名
:: code by NaturalJ0 2006-9-27
setlocal ENABLEDELAYEDEXPANSION
for /f %%i in ('dir/b cb*.rmvb') do (
        call :GETNUM %%i
        if not !number!==# (
                ren %%i cb_!number!.rmvb 2>nul || echo cb_!number!.rmvb 已存在，%%i 不能再改名为 cb_!number!.rmvb ，请自己手动处理。
        )
)
echo.
echo 处理完毕，按任意键结束。
pause>nul
GOTO END

:GETNUM
set varstr=%1#
set number=#
:LOOP
if !varstr!==# GOTO ENDLOOP
set firstchar=!varstr:~0,1!
if !firstchar! GEQ 0 (
        if !firstchar! LEQ 9 (
                set number=!number!!firstchar!
        )
)
set varstr=!varstr:~1!
GOTO LOOP
:ENDLOOP
if not !number!==# set number=!number:~1!
:END