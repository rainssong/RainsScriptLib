@echo off
:: 3742668 cn-dos.com

    echo 输入宽度和高度:
    echo 例如: 3 3
    set /p s=
call :update %s%
pause
goto :eof

:update
setlocal ENABLEDELAYEDEXPANSION

    if %1 geq 40 echo 太宽了! && goto :eof

    rem 以下两句计算每一行前面应该留出的空格数
    set /a began = (40 - %1) / 2
    for /l %%i in (1,1,%began%) do set str=!str!　

    rem 以下两句计算第一行╭与╮之间"─"的数量
    set /a num = %1 - 2
    for /l %%i in (1,1,%num%) do set str1=!str1!─
    
    rem 显示第一行
    echo %str%╭%str1%╮

    rem 保存最后一行
    set str2=%str%╰%str1%╯

    rem 显示除了第一行和最后一行的中间的行
    set str1=%str1:─=　%
    for /l %%i in (1,1,%2) do echo %str%│%str1%│

    echo %str2%    & rem 显示最后一行
endlocal
goto :eof