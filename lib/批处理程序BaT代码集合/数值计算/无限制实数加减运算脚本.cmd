@echo off
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=23611
title 实数加减运算脚本
mode con: cols=80 lines=25
color 27
if not %1*==* set num1=%1 & set num2=%2 & goto jmp
:input
cls
echo                        ╭──────────────╮
echo                        │                            │
echo    ╭─────────┤   实 数 加 减 运 算 脚 本  ├──────────╮
echo    │                  │                            │         [测试版]   │
echo    │                  ╰──────────────╯                    │
echo    │   该脚本理论上可以对N位的实数进行加减运算。                          │
echo    │                                                                      │
echo    │   运算规则:                                                          │
echo    │   输入两个运算数[X]、[Y]，程序将自动计算。运算数[X]与[Y]默认为加法   │
echo    │   运算。[x]、[Y]的默认值为正, 也可在前面加"-"号。例：[-X]、[-Y]      │
echo    │                                                                      │
echo    │   + 加法运算请输入第1个[X]运算数后按回车键。接着输入第2个[Y]运算数   │
echo    │   回车即可.   例: [X+Y]                                              │
echo    │   - 减法运算请输入第1个[X]运算数后按回车键。接着输入第2个[-Y]运算数  │
echo    │   注意: 第2个运算数前必须加"-"号.   例: [X+(-Y)]                     │
echo    │   更多的运算表达式:  [(-X)+Y]、[(-X)+(-Y)]                           │
echo    │                                                                      │
echo    │   注意: 除阿拉伯数字外, 第一位允许输入符号"-", 以及最多一个"."号,    │
echo    │   不允许输入其他字符。否则, 都将视为错误输入...                      │
echo    │                                                                      │
echo    │                                     author:pengfei@www.cn-dos.net    │
echo    ╰───────────────────────────────────╯
setlocal enabledelayedexpansion
set num1=
set num2=
set /p num1=    input primary number    [X]:
set /p num2=    input number two number [Y]:
:jmp
set numx=%num1%
set numy=%num2%
set auto=
set less=+
set less_=+
set adding=+
set norm=1
set sign=
set sign_=
if "%num1:~0,1%"=="-" (
    if "%num2:~0,1%"=="-" (
        set num1=!num1:~1!
        set num2=!num2:~1!
        set adding=
        set sign=-
        goto start
    )
)
if "%num1:~0,1%"=="-" (
    set num1=!num1:~1!
    set auto=::
    set less=-
    set less_=-
    set norm=2
    set sign=-
    set sign_=
    goto start
)
if "%num2:~0,1%"=="-" (
    set num2=!num2:~1!
    set auto=::
    set less=-
    set less_=-
    set adding=
    set norm=2
    set sign_=-
    goto start
)
:start
echo %num1% | find "." >nul || set num1=%num1%.0
echo %num2% | find "." >nul || set num2=%num2%.0
if "%num1:~-1%"=="." set num1=%num1%0
if "%num2:~-1%"=="." set num2=%num2%0
if "%num1:~0,1%"=="." set num1=0%num1%
if "%num2:~0,1%"=="." set num2=0%num2%
call :jerque "%num1%"
call :jerque "%num2%"
set num=0
for %%a in (%num1% %num2%) do (
    set /a num+=1
    for /f "tokens=1,2 delims=." %%i in ("%%a") do (
        if "!num!"=="1" (set one=%%i) else (set one_=%%i)
        if "!num!"=="1" (set two=%%j) else (set two_=%%j)
    )
)
call :omit %one%
set one=%want%
call :omit %one_%
set one_=%want%
call :raze %two%
set two=%want_%
call :raze %two_%
set two_=%want_%
if "%one%"=="" set one=0
if "%one_%"=="" set one_=0
call :go %one%
set countx=%wish%
call :go %one_%
set countx_=%wish%
if "%two%"=="" set two=0
if "%two_%"=="" set two_=0
call :go %two%
set county=%wish%
call :go %two_%
set county_=%wish%
set after=
set front=0
if %countx% lss %countx_% (
    set /a result=%countx_%-%countx%
    call :fine !result! %one%
    set one=!incept!
) else (
    set /a result=%countx%-%countx_%
    call :fine !result! %one_%
    set one_=!incept!
)
set after=0
set front=
if %county% lss %county_% (
    set /a result=%county_%-%county%
    call :fine !result! %two%
    set two=!incept!
) else (
    set /a result=%county%-%county_%
    call :fine !result! %two_%
    set two_=!incept!
)
if "%norm%"=="2" (
    call :how %one%%two% %one_%%two_%
)
:recur
if "%mu%"=="2" call :meet
set outcome_=0
call :scale %two% %two_%
set decimal=%numeral:~0,-1%
call :scale %one% %one_%
if "%note%"=="0" (
    set integer=%numeral:~0,-1%
) else (
    set integer=1%numeral:~0,-1%
)
call :raze %decimal%
set decimal=%want_%
call :omit %integer%
set integer=%want%
if "%integer%"=="" set integer=0
if "%integer%"=="0" if "%decimal%"=="" set sign=
if "%decimal%"=="" (set dot=) else (set dot=.)
if "%numx:~0,1%"=="." set numx=0%numx%
if "%numy:~0,1%"=="." set numy=0%numy%
if "%numx:~-1%"=="." set numx=%numx:~0,-1%
if "%numy:~-1%"=="." set numy=%numy:~0,-1%
if "%numx%"=="" set numx=0
if "%numx%"=="-" set numx=-0
if "%numy%"=="-" set numy=-0
cls
echo =============
echo 运算结果^^!
echo =============
echo.
echo.
echo %numx%%adding%%numy%=%sign%%integer%%dot%%decimal%
pause >nul
goto input

:scale
set value=@%1
set value_=@%2
set numeral=
:repeat
set outcome=%outcome_%
if "%outcome_:~0,-1%"=="-" (
    set /a outcome=10%outcome_%
    set note=1
) else (
    set note=0
)
set numeral=%outcome:~-1%%numeral%
%auto%set note=0%outcome:~0,-1%
if not "%value:~-1%"=="@" (
    set xx=!value:~-1!
    set value=!value:~0,-1!
)
if not "%value_:~-1%"=="@" (
    set yy=!value_:~-1!
    set value_=!value_:~0,-1!
    call :operation !xx! !yy!
)
goto :eof
:operation
set refer=%1
set refer_=%2
set /a outcome_=%refer%%less%%refer_%%less_%%note%
goto repeat
:go
set remove=%1@
set wish=0
:go_
if not "!remove:~0,1!"=="@" (
    set /a wish+=1
    set remove=!remove:~1!
    goto go_
)
goto :eof
:fine
set take=%1
set incept=%2
:fine_
if not "%take%"=="0" (
    set /a take-=1
    set incept=%front%!incept!%after%
    goto fine_
)
goto :eof
:omit
set want=%1
:omit_
if "%want:~0,1%"=="0" (
    set want=%want:~1%
    goto omit_
)
goto :eof
:raze
set want_=%1
:raze_
if "!want_:~-1!"=="0" (
    set want_=!want_:~0,-1!
    goto raze_
)
goto :eof
:how
set first=%1@
set second=%2@
:how_
if not "%first:~0,1%"=="@" (
    set first_=!first:~0,1!
    set first=!first:~1!
)
if not "%second:~0,1%"=="@" (
    set second_=!second:~0,1!
    set second=!second:~1!
    call :judg
)
goto :eof
:judg
if !first_! gtr !second_! (
    set mu=1
    goto recur
) else (
    if !first_! lss !second_! (
        set mu=2
        goto recur
    )
)
goto how_
:meet
set middle=%one%
set one=%one_%
set one_=!middle!
set middle_=%two%
set two=%two_%
set two_=!middle_!
set sign=%sign_%
goto :eof
:jerque
for /f "tokens=1* delims=." %%i in (%1) do (
    echo %%i%%j|findstr "^[0-9]*$">nul || goto error
)
goto :eof
:error
cls
echo ======================
echo 运算数不符合要求^^!
echo ======================
echo.
echo.
echo 请按任意键重新输入...
pause >nul
goto input
