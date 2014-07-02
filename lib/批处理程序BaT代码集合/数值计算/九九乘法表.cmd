@echo off
:: 九九乘法表
:: code by jm 2006-12-25 CMD@XP
:: 出处：1、http://www.cn-dos.net/forum/viewthread.php?tid=26038
::       2、http://bbs.wuyou.com/viewthread.php?tid=88564
set num=0
for /l %%i in (1,1,9) do (
    for /l %%j in (1,1,%%i) do call :multiply %%i %%j
)
pause>nul
goto :eof

:multiply
set /a num+=1
set /a var=%1*%2
set var=%2×%1=%var%
set var=%var%      
if %2 equ 1 (set var=%var:~0,5%) else set var=%var:~0,6%
set str=%str% %var%
if %num% equ %1 echo %str%&set str=&set num=0
goto :eof

:: 另外一种，用Tab键替代空格键来排版
:: Code by  qjbm 2007-1-24 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26038
@ECHO %DBG% OFF
SETLOCAL ENABLEDELAYEDEXPANSION
for /l %%i in (1,1,9) do (
                          for /l %%j in (1,1,%%i) do (
                                                      set /a h=%%i*%%j
                                                      set /p=%%i×%%j^=!h!	<nul
                                                      if %%i==%%j echo.
                                                      )
                            )
pause

@echo off
:: 99 乘法表
:: Code by spiegboy 2007-2-17 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26038
setlocal enabledelayedexpansion
for /l %%a in (1,1,9) do (
        for /l %%b in (1,1,%%a) do (
        set /a i+=1
        set /a ans=%%a*%%b
        set ans=%%b×%%a=!ans!  
        set res=!res! !ans:~0,6!
        if !i! equ %%a echo!res!&set res=& set i=0
) 
)
pause