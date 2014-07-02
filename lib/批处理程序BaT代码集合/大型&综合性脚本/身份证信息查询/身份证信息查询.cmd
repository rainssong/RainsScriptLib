@echo off
:: 功能：
::     1、根据号码查询性别、出生日期和户籍所在地
::     2、15位号码升18位
::     3、根据户籍所在地和出生日期批量生成身份证号码
::
::  已知bug：
::      1、输入检测不严格
::      2、生成ID的速度较慢
::
:: Code by JM 2007-3-4 CMD@XP
:: 出处：1、http://www.cn-dos.net/forum/viewthread.php?tid=28127
:: 　　　2、http://bbs.wuyou.com/viewthread.php?tid=98403
::
:: 更新历史：
::
:: 07.3.6
:: 　　更正了15位号码升18位时始终显示非法号码的错误；

mode con lines=20 cols=50
title 身份证号码信息查询器
setlocal enabledelayedexpansion

set check_num=10X98765432

:Main
cls
set flag=
set IDflag=
echo.&echo.&echo.&echo.
echo             1、通过18位号码查询基本信息
echo.
echo             2、15位号码升18位
echo.
echo             3、生成指定地区的身份证号码
echo.&echo.&echo.
echo　__________________________________________________
echo.
set choice=
set /p choice=       请输入功能代码(退出请直接回车)：

if "%choice%"=="1" goto Get_Info
if "%choice%"=="2" goto UpDate
if "%choice%"=="3" goto Creat_ID
if defined choice goto Main
exit

:Get_Info
cls
echo.&echo.&echo.&echo.&echo.
set ID=
set /p ID=      请输入18位身份证号码：
call :Check_ID %ID%
if defined flag (
    call :PickUp_Info
) else call :ERR
echo                 按任意键返回主界面...
pause>nul
goto Main

:UpDate
cls
echo.&echo.&echo.&echo.&echo.
set IDflag=15
set ID=
set /p ID=      请输入15位身份证号码：
set ID_15=%ID%
set ID=%ID:~0,6%19%ID:~6%
call :Check_ID %ID%
if defined flag (
    call :PickUp_Info
) else call :ERR
echo                 按任意键返回主界面...
pause>nul
goto Main

:Creat_ID
cls
echo.&echo.
echo   　　地名只能检索到县级及其之上的行政区划；必须
echo.
echo   按照行政级别的顺序输入，可以跳级输入，多个关键
echo.
echo   字用空格分隔。比如：四川  成都 青羊区 或者
echo.
echo   四川 青羊区 或者 成都 。
echo.
echo 　　　生日必须是6位数字的格式，比如：20070130 。
echo.
echo　__________________________________________________
echo.
set place=
set birthday=
set exp=
set /p place=　请输入地区关键字：
echo.
set /p birthday=  请输入8位格式的出生日期：
if "%birthday:~7,1%"=="" (call :ERR & pause & goto Main)
if not "%birthday:~0,8%"=="%birthday%" (call :ERR & pause & goto Main)
set /a day=1%birthday% 2>nul||(call :ERR & pause & goto Main)
if not "%day:~1%"=="%birthday%" (call :ERR & pause & goto Main)

cls
echo.&echo.
echo     符合条件的号码有^(中途可按 Ctrl^+C 暂停执行^)：
echo.
for %%i in (%place%) do set exp=!exp!.*%%i
for /f "tokens=1*" %%i in ('findstr "%exp:~2%" date.txt') do (
    set ID_place=%%i
    set ID_tmp=!ID_place:~0,1!
    for /l %%j in (1,1,9) do (
        if !ID_tmp! equ %%j call :IDs
    )
)
if not defined flag (
    echo.&echo.&echo.
    echo          数据库中检索不到关键字为 %place% 的地名！
    echo.&echo.&echo.
)
echo                 按任意键返回主界面...
pause>nul
goto Main

rem ==== 检测号码是否合法 ====
:Check_ID
set ID=%1
set ID_tmp=%1
if defined IDflag (
    if "%ID:~16,1%"=="" set flag=&goto :eof
    if not "%ID:~0,17%"=="%1" set flag=&goto :eof
) else (
    if "%ID:~17,1%"=="" set flag=&goto :eof
    if not "%ID:~0,18%"=="%1" set flag=&goto :eof
    if /i "%ID:~-1%"=="x" set ID_tmp=%ID:~0,-1%
)
set /a ID_tmp_1=1!ID_tmp:~0,6! 2>nul||(set flag=&goto :eof)
set /a ID_tmp_2=1!ID_tmp:~6,8! 2>nul||(set flag=&goto :eof)
set /a ID_tmp_3=1!ID_tmp:~14! 2>nul||(set flag=&goto :eof)
if not "!ID_tmp_1:~1!!ID_tmp_2:~1!!ID_tmp_3:~1!"=="!ID_tmp!" set flag=&goto :eof
set sum=0
set str_wi=7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2 1
for /l %%i in (0,1,16) do (
    set ai=!ID:~%%i,1!
    call :Get_Num %%i !str_wi!
    set /a product=!ai!*!wi! 2>nul
    set /a sum+=!product!
)
set /a mod=%sum%%%11
set last_num=!check_num:~%mod%,1!
if defined IDflag (
    set ID=%ID%%last_num%
    set flag=1
    goto :eof
)
if /i "%ID:~-1%"=="%last_num%" (
    set flag=1
) else set flag=
goto :eof

:Get_Num
:: 提取 %str_wi% 中对应位置上的数值
for /l %%i in (1,1,%1) do shift
set wi=%2
goto :eof

:PickUp_Info
set char=%ID:~-2,1%
set /a mod=%char%%%2
if %mod% equ 0 (
    set SEX=女
) else set SEX=男
for /f "tokens=1*" %%i in ('findstr "%ID:~0,6%" date.txt') do (
    set flag=exist
    cls
    echo.&echo.&echo.&echo.
    if defined IDflag (
        echo     身份证号码：%ID_15%
        echo.
        echo     升位后号码：%ID%
    ) else echo     身份证号码：%ID%
    echo.
    echo     性      别：      %SEX%
    echo.
    echo     出生日期：%ID:~6,4% 年 %ID:~10,2% 月 %ID:~12,2% 日
    echo.
    echo     户籍所在地：%%j
    echo.&echo.&echo.&echo.
)
if not "%flag%"=="exist" call :ERR
goto :eof

rem ==== 生成合法的号码 ====
:IDs
for /l %%i in (0,1,999) do (
    for %%j in (0 1 2 3 4 5 6 7 8 9 X) do (
        set ID=00%%i%%j
        call :Check_ID %ID_place%%birthday%!ID:~-4!
        if defined flag echo                 %ID_place%%birthday%!ID:~-4!
    )
)
goto :eof

rem ==== 出错提示 ====
:ERR
echo.&echo.
echo                 非法号码
echo.&echo.&echo.
goto :eof
