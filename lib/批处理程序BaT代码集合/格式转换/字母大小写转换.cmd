@echo off
:: 字母大小写转换
:: 只演示了小写转大写
:: 稍微修改一下代码就可以实现大写转小写
:: 更简洁的请看另外一个版本
:: Code by JM 2007-1-16 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26786

set str1=abcdefghijklmnopqrstuvwxyz
set str2=ABCDEFGHIJKLMNOPQRSTUVWXYZ

:main
cls
set str=
set /p str=    请输入字符串(退出请直接按回车)：
if not defined str exit
cls
echo.
echo            转换前："%str%"
echo.
for /l %%i in (0,1,25) do (
    call set char1=%%str1:~%%i,1%%
    call set char2=%%str2:~%%i,1%%
    call :change
)
echo ____________________________________________
echo.
echo            转换后："%str%"
echo.
echo                     按任意键进行下一次演示...
pause>nul
goto main

:change
call set "str=%%str:%char1%=%char2%%%"
goto :eof

@echo off
:: Code by zh159 2007-1-16 CMD@XP
:: 利用替换语句不区分大小写的特点
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26786
:main
cls
set str=
set /p str=    请输入字符串(退出请直接按回车)：
if not defined str exit
cls
echo.
echo            转换前："%str%"
for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do call set str=%%str:%%i=%%i%%
echo ____________________________________________
echo.
echo            转换后："%str%"
echo.
echo                     按任意键进行下一次演示...
pause>nul
goto main