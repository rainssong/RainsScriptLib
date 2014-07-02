@echo off
title 公交线路查询器-test
setlocal enabledelayedexpansion
goto begin

功能：
　　① 输入线路名称，显示该线路的所有站点及发车收车时间；
　　② 输入上车站点和下车站点，显示可直达的车次，并显示每条线路中这两个站点及其之间的所有站点及发车收车时间；
　　③ 可查询换乘线路

流程：
　　1、输入查询对象；
    2、判断输入类型：若为数字、数字+字母，则查询车次；若带汉字，则查询站点信息；
　　3、若查询车次，有则显示，无则提示重新查询；
　　4、若查询站点，首先检测是否存在此站点；若不存在，则提示换用近似的站点查询；若存在该站点，有直达则只显示直达，无直达则查询换乘；若无换乘，则提示重新查询，此时罗列近似的起止站点供选择；

code by JM 2006-10-17～11-17   CMD@XP
出处：http://www.cn-dos.net/forum/viewthread.php?tid=24668

:begin
cls
set input=
set /p input=请输入车次或上、下车站点：
:: 车次只允许输入数字或数字+字母，否则会认为是站点
echo %input%|findstr /r "^[0-9][0-9]*[a-zA-Z]*$">nul &&(
    call :get_line %input%
    echo !num!
    echo !_time!
    echo !line_info:~1,-1!
    goto end
)
call :find_station %input%

rem ========== 查询车次编号匹配的线路信息 ==========

:get_line
:: 获取要查询的车次编号所在的行
cls
set line=
for /f "tokens=1* delims=:" %%i in ('findstr /nr "^%1路：$" 公交线路.txt') do (
    set line=%%i
    if not "!line!"=="" goto get_block
)
goto no-item

rem ========== 查询直达方案 ==========

:find_station
:: 只允许同时输入两个站点
if "%2"=="" goto begin
if not "%3"=="" goto begin
find "-%1-" 公交线路.txt>nul||goto no-start
find "-%2-" 公交线路.txt>nul||goto no-end
cls
set line=
set str=
set var=
for /f "tokens=1* delims=:" %%i in ('findstr /n "\-%1\-" 公交线路.txt') do (
    set line=%%i
    set str=%%j
    set str=!str:-%2-=!
    if not "!str!"=="%%j" (
        set var=%%j
        set var=!var:-%1-=-☆%1☆-!
        set var=!var:-%2-=-☆%2☆-!
        call :pick-up %input% !var!
        call :type_nostop
    )
)
:: 如果没找到直达线路，则查询换乘方案
if "%var%"=="" call :transfer %input%

:end
pause
goto begin

rem ========== 查询换乘方案 ==========

:: 换乘线路只能查到匹配的第一条，可能不是最短线路
:transfer
set first_line=
set first_id=
set first_time=
set second_line=
set second_id=
set second_time=
set link=
for /f "tokens=1* delims=:" %%i in ('findstr /n "\-%1\-" 公交线路.txt') do (
    set first_line=%%i&set str_start=%%j
    set stations_start=!str_start:-= !
    for /f "tokens=1* delims=:" %%k in ('findstr /n "\-%2\-" 公交线路.txt') do (
        set second_line=%%k&set str_end=%%l
        set stations_end=!str_end:-= !
        for %%m in (!stations_start!) do (
            for %%n in (!stations_end!) do (
                if "%%m"=="%%n" (
                    set link=%%m
                    set /a line=!first_line!-2&&call :get_block
                    set first_id=!num!
                    set first_time=!_time!
                    set /a line=!second_line!-2&&call :get_block
                    set second_id=!num!
                    set second_time=!_time!
                    goto type_change
                )
            )
        )
    )
)
if "%link%"=="" goto no-change


rem ━━━━━━━━━━━ 子过程 ━━━━━━━━━━━

rem ========== 获取某条线路的完整信息 ==========
:get_block
set /a line-=1
set count=
for /f "skip=%line%" %%i in (公交线路.txt) do (
    set /a count+=1
    if !count! equ 1 set num=%%i
    if !count! equ 2 set _time=%%i
    if !count! equ 3 set line_info=%%i
    if !count! gtr 3 goto :eof
)

rem ========== 提取上车站点到下车站点之间的所有站点 ==========
:pick-up
for /f "tokens=2-4 delims=☆" %%i in ("%3") do set var=%%i%%j%%k
:: 判断输入的起止点在 公交线路.txt 中的先后顺序
:: 以决定是否逆向显示相关信息
for /f "tokens=1 delims=-" %%i in ("!var!") do if "%%i"=="%2" call :reverse
goto :eof

rem ========== 显示直达方案信息 ==========

:type_nostop
set /a line-=2
call :get_block
echo 乘坐 %num:~0,-2% 路车(%_time%)：%var%
echo.
goto :eof

rem ========== 显示换乘方案信息 ==========
:type_change
echo 交汇点是 %link%
echo.
set str_start=!str_start:-%1-=-☆%1☆-!
set str_start=!str_start:-%link%-=-☆%link%☆-!
echo 先搭乘 %first_id:~0,-2% 路在 %link% 站下车，然后换乘 %second_id:~0,-2% 路即可，换乘方案为：
echo.
call :pick-up %1 %link% %str_start%
echo %first_id:~0,-2%路(%first_time%)： %var%
set str_end=!str_end:-%2-=-☆%2☆-!
set str_end=!str_end:-%link%-=-☆%link%☆-!
echo.
call :pick-up %1 %2 %str_end%
echo %second_id:~0,-2%路(%second_time%)： %var%
echo _____________________________________________________________
goto :eof

rem ========== 逆向显示站点信息 ==========
:reverse
set var=%var:-= %
set str=
for %%i in (%var%) do set str=%%i-!str!
set var=%str:~0,-1%
goto :eof



rem ━━━━━━━━━━━ 出错信息 ━━━━━━━━━━━

:no-start
cls
echo 没有找到名为 "%1" 的上车站点
pause
goto begin

:no-end
cls
echo 没有找到名为 "%2" 的下车站点
pause
goto begin

:no-change
echo 没有找到直达线路，也找不到只转一次车的换乘方案
pause
goto begin

:no-item
echo 没有找到车次编号为 "%input%" 的相关信息，请重新查阅.
pause
goto begin