@echo off
:: 对数字由大到小排序
:: test.txt中的内容为一个数组：123,456,2,1,6……
:: 若文本内一行一个数字，则用:_sort一段代码就可以了，但是，
:: 需要注意的是， findstr /v ^!max!$ test.txt 并不能过滤掉最后一行内容
:: 除非最后一行是个空行。也就是说，findstr过滤行的时候，只能识别行分隔符号，
:: 没有行分隔符号，则不认为是一行。
:: code by jm 2006-10,4 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23577
copy test.txt test.bak>nul
cd.>test.txt
for /f %%i in (test.bak) do call :split "%%i,:"

setlocal enabledelayedexpansion
:_sort
for /f %%i in (test.txt) do (
    set /a max=%%i
    for /f %%j in (test.txt) do (
        set /a num=%%j
        if !num! gtr !max! (set max=!num!) else (set max=!max!)
    )
    echo !max!
    >test1.txt findstr /v ^!max!$ test.txt
    move test1.txt test.txt
    goto _sort
)
move test.bak test.txt
pause
goto :eof

:split
for /f "tokens=1* delims=," %%i in (%1) do (
    >>test.txt echo %%i
    if not "%%j"==":" call :split "%%j"
)
goto :eof

::通过对创建的文件大小来对数字进行排序
::code by 3742668 2006-10-4
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23577
fsutil file createnew %%i %%i语句执行速度太慢，换成for /l %%j in (1,1,%%i) do echo.>>%%i语句将使效率大为提升(-jm注)
@echo off
    set numbers=%random% %random% %random% %random% %random% %random% %random% %random%
    echo 排序前数字为: %numbers%
    md sort_tmp && pushd sort_tmp
    for %%i in (%numbers%) do fsutil file createnew %%i %%i >nul
    echo 从小到大排列:
    dir /os /b
    popd && rd /s /q sort_tmp
pause
goto :eof

通过数字大小的比较来排序
但是原代码 call :sort_ !str:%num%=! 一句会导致出错
因为这句是把所有的%num%都置换为空
如果某个数值在其他数值中出现，执行结果就会有问题
修改后已经避免了这个问题(在其中几处加上了空格)
当有重复数值的时候，将只显示一次
@echo off
::code by 3742668 2006-10-4 modified by jm 2007-1-7
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23577
setlocal enabledelayedexpansion
    set numbers=%random% %random% %random% %random% %random% %random% %random% %random%
    echo 排序前数组为: %numbers%
    call :sort_ %numbers%
    echo 排序后数组为: %ret%
pause
goto :eof

:sort_
    set num=%1
    set str= %* 
    for %%i in (%*) do if !num! gtr %%i set num=%%i
    set ret=%ret% %num%
    if not "!str: %num% =!"=="" call :sort_ !str: %num% =  !
goto :eof

@echo off
:: 数值范围在1～2147483647之间(含)
:: 当数值有重复的时候，将只显示一次
:: Code by JM 2007-1-7 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23577
echo 排序前情况：
findstr /n . test.txt
echo.
echo.
echo                           按任意键继续...
pause>nul
echo.
echo 排序后情况：
setlocal enabledelayedexpansion
set num=0
set max=1
for /f "delims=" %%i in (test.txt) do (
    set /a num+=1
    call :sort_ %%i
    echo !num!:!str!
    set str=
)
echo.
pause
goto :eof

:sort_
set var= %* 
:loop
for %%i in (%var%) do if %%i gtr !max! set max=%%i
set var=!var: %max% =  !
set str=!str! %max%
set max=1
set tmp=%var: =%
if not "%tmp%"=="" call :loop %var%
goto :eof