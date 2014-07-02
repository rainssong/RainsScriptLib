:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25570

@echo off
:: 普通的 for+findstr 语句会忽略分号开头的行
:: findstr /n .* 用delims=:后，会忽略行首所有的冒号
:: 还有!、&、.等特殊符号需要处理
:: 以下代码可以准确提取这些敏感字符
:: 解决了 setlocal 最大递归层的问题(setlocal 两两嵌套处理超过15行内容时会带来此问题)
:: 能计算空行
:: code by jm 2006-12-12 thanks 3742668 CMD@XP
set num=0
for /f "delims=" %%i in ('findstr /n .* test.txt') do (
    set /a num+=1
    set "str=%%i"
    setlocal enabledelayedexpansion
    echo 第 !num! 行： !str:*:=!
    endlocal
)
pause
goto :eof


@echo off
:: 超过15行内容时，会带来 setlocal 最大递归层的问题
:: code by 3742668 2006-12-11 CMD@XP
@echo off
    setlocal enabledelayedexpansion
    set num=
    for /f "eol= delims=" %%i in ('findstr .* a.txt') do (
        setlocal DISABLEDELAYEDEXPANSION
        set "tmpstr=%%i"
        setlocal enabledelayedexpansion
        set /a num += 1
        set "!num!=!tmpstr!"
    )
    for /l %%i in (1,1,%num%) do echo 第%%i行: !%%i!
    pause
exit /b 0

@echo off
:: 不能正确提取带感叹号的内容
:: code by jm 2006-12-11 CMD@XP 
set num=0
setlocal enabledelayedexpansion
for /f "delims=" %%i in ('findstr /n .* test.txt') do (
    set /a num+=1
    set "str=%%i"
    echo 第 !num! 行： !str:*:=!
)
pause
goto :eof

@echo off
:: 结果要用引号括起来
:: code by jm 2006-12-11 CMD@XP 
set num=0
::setlocal enabledelayedexpansion
for /f "delims=" %%i in ('findstr /n .* test.txt') do (
    set /a num+=1
    set "str=%%i"
    call :display
)
pause
goto :eof

:display
echo 第 %num% 行： "%str:*:=%"
goto :eof



test.txt的内容

:abc
::xy
;
;;;ef &
;:;
::;;
||
&

^
!<
!
%

"
""
'
test
abc
