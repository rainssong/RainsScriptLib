@echo off
:: 一组数，去掉最大值和最小值之后，求其余数的平均值
:: Code by 3742668 2006-5-25 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=20794
set Count=10                       rem 参加计算的数的个数
call :GetNum %Count%          rem 产生随机数
echo 要处理的数据为:%Num%
call :EditNum %Num%
pause
exit

:EditNum
    set /a intMax=1,intMin=2147483647      rem 批处理最大只能处理32位数据
    setlocal enabledelayedexpansion
    for %%i in (%*) do (if %%i GEQ !intMax! set /a intMax=%%i) & (if %%i LEQ !intMin! set /a intMin=%%i)
    for %%j in (%*) do set /a intCount=!intCount! + 1
    echo 有%intCount%个数，其中最大和最小分别为%intMax%,%intMin%
    set total=%Num: =+%
    set /a total=%total%
    set /a total=(%total% - %intMax% - %intMin%) / (%intCount% - 2)
    echo 总数为:%total%
goto end

:GetNum
    if "%Flag%" == "%1" goto end
    set Num=%Num% %Random%
    set /a Flag = %Flag% + 1
goto GetNum

:end 
    endlocal
    set Flag=
    set intMax=
    set intMin=
    set intCount=
    set total=
goto :eof

:: Average.cmd - Eval average of a batch of numbers
:: Will Sort - 2006-06-03 - CMD@WinXP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=20794
@echo off
call :GetNum
echo 要处理的数据为:%return%
call :Average %return%
echo 去除最大值和最小值的平均数为 %return%
goto :eof

:GetNum
if "%_n%"=="" setlocal
set _n=-
set /p _n=请输入一个整数（直接回车结束输入）：
if "%_n%"=="-" endlocal&set return=%return%&goto :eof
set /a _i=_n
if "%_i%" NEQ "%_n%" (echo 无效的输入数据：%_n%
) else set return=%return% %_i%
goto GetNum

:Average
setlocal EnableDelayedExpansion
if "%3"=="" set return=N/A&goto :eof
set /a iMax=%1,iMin=%1
for %%i in (%*) do (    
    if %%i GTR !iMax! set /a iMax=%%i
    if %%i LSS !iMin! set /a iMin=%%i
    set /a iTotal+=%%i
    set /a iCount+=1
)
set /a return=(iTotal-iMax-iMin) / (iCount-2)
endlocal&set return=%return%&goto :eof



:: Average.cmd - Eval average of a batch of numbers
:: Will Sort - 2006-06-03 - CMD@WinXP
:: modified by zh159 2006-7-24 对返回值清空，以便循环调用
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=20794
@echo off
set return=
call :GetNum
echo 要处理的数据为:%return%
call :Average %return%
echo 去除最大值和最小值的平均数为 %return%
goto :eof

:GetNum
if "%_n%"=="" setlocal
set _n=-
set /p _n=请输入一个整数（直接回车结束输入）：
if "%_n%"=="-" endlocal&set return=%return%&goto :eof
set /a _i=_n
if "%_i%" NEQ "%_n%" (echo 无效的输入数据：%_n%
) else set return=%return% %_i%
goto GetNum

:Average
setlocal EnableDelayedExpansion
if "%3"=="" set return=N/A&goto :eof
set /a iMax=%1,iMin=%1
for %%i in (%*) do (    
    if %%i GTR !iMax! set /a iMax=%%i
    if %%i LSS !iMin! set /a iMin=%%i
    set /a iTotal+=%%i
    set /a iCount+=1
)
set /a return=(iTotal-iMax-iMin) / (iCount-2)
endlocal&set return=%return%&goto :eof
set return=