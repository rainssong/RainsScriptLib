@echo off
:: 去掉左空格
:: Code by JM 2006-11-28 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25172
set "str=   ab c&>!   " 
for /f "tokens=*" %%i in ("%str%") do echo "☆%%i☆"
pause
goto :eof

@echo off
:: 去掉左空格
:: Code by JM 2006-11-28 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25172
set "str=   ab c&>!   " 
:intercept
if "%str:~0,1%"==" " set "str=%str:~1%"&goto intercept
echo "☆%str%☆"
pause
goto :eof

@echo off
:: 去掉右空格
:: Code by JM 2006-11-28 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25172
set "str=   ab c&>!   " 
:intercept
if "%str:~-1%"==" " set "str=%str:~0,-1%"&goto intercept
echo "☆%str%☆"
pause
goto :eof

@echo off
:: 去掉首尾空格空格
:: Code by JM 2006-11-28 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25172
set "str=   ab c&>!   " 

:intercept_left
if "%str:~0,1%"==" " set "str=%str:~1%"&goto intercept_left

:intercept_right
if "%str:~-1%"==" " set "str=%str:~0,-1%"&goto intercept_right
echo "☆%str%☆"
pause
goto :eof

@echo off
:: 去掉所有空格空格
:: Code by JM 2006-11-28 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25172
set "str=   ab c&>!   " 
set "str=%str: =%"
echo "☆%str%☆"
pause
goto :eof

@echo %dbg% off
cls && echo. && echo.
:Redtek 2006 去左、右含有空格的变量试验与另类方法实现演示
::  为演示与另做它用方便，所以“标签代码段”内的代码都可以独立使用
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25172

set "var=               My name is Redtek            "
rem  注：下面 Call 中的参数是无引号的，利用参数以逗号空格等做为分隔的特性
call :去左侧空格  %var%
echo. && echo.
call :去右侧空格  "%var%"
rem  去字符串中的左、右空格
rem  为演示与另做它用的方便，下面步骤将重新编写去左右空格的代码段，可以独立使用。
echo. && echo.
call :去两边空格  "%var%"  %var%
goto :eof


:去左侧空格

        rem  利用替换原理，将变量 var 中 以 ^%1变量内容开头字串的左边一切替换为^1本身
        rem  因为被 Call 过来以后，参数中的空格就全“丢了”（利用参数分隔的特性），
        rem  所以，自然那个要被定位的 ^%1 左边的空格也就全没了。

        call set "去左空格后的变量=%%var:*%1=%1%%

        echo  原字符串：                [%var%]
        echo  去左侧空格后的字符串：        [%去左空格后的变量%]
        goto  :eof


:去右侧空格

        rem 将结果赋值给变量，这个变量可以随便调用。
        rem ~nx 是利用了“将变量扩展到一个文件名”的特性，
        rem 既然是合法的文件名，当然文件名后面的空格是无效且无用的～：）

        set 去右空格后的变量=%~nx1

        echo  原字符串：                [%var%]
        echo  去右侧空格后的字符串：        [%去右空格后的变量%]
        goto  :eof        
        

:去两边空格

        rem 原理：先去左边空格，再去右边空格，相当于上面演示代码的合用：）
        rem 　　　在假如没有上面两段去左和去右空格的代码情况下，下面独立演示：

        set 去左右空格后的变量=%~nx1
        call set "去左右空格后的变量=%%去左右空格后的变量:*%2=%2%%"

        echo  原字符串：                [%var%]
        echo  去左右空格后的字符串：        [%去左右空格后的变量%]
        goto :eof