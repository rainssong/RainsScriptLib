:: 生成0-99之间的随机数列 R1
:: qzwqzw@bbs.cn-dos.net
:: 2007-01-04 23:03
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26330
@echo off
setlocal EnableDelayedExpansion

:: 初始化顺序数列
for /l %%i in (0,1,99) do (
    set rnum%%i=%%i
)

:: 对数列进行随机交换
for /l %%i in (0,1,99) do (
    set /a rnd=!random! %% 100
    call set tmp=%%rnum!rnd!%%
    set rnum!rnd!=!rnum%%i!
    set rnum%%i=!tmp!
)

set rnum
pause