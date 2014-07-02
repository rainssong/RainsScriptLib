@echo off
:: 判断一个脚本执行完毕所需要的时间
:: 先取开始时间，然后在即将结束的时候取结束时间
:: 两个时间都分别提取小时、分和秒数
:: 分别对小时数、分钟数和秒数进行操作
:: 还要对08和09这两个数进行操作
:: 注意：set /a num=的格式只能处理两位数中是否高位为0，如果是多位数
::       要去高位的所有0的话，要用循环测试高位是否为0或者在高位添1然后
::       再减去1000之类的数字的方法
:: code by JM 2006-9-5～10 CMD@XP 感谢pengfei测试
set time_begin=%time:~0,-3%
echo 脚本开始运行时间是 %time_begin%
:: 小于10的小时数前有空格，要做去空格操作
for /f "tokens=1,2,3 delims=:" %%i in ("%time_begin%") do (
    set /a hour_b=%%i
    set /a munite_b=%%j
    set /a second_b=%%k
)
pause
set time_end=%time:~0,-3%
for /f "tokens=1,2,3 delims=:" %%i in ("%time_end%") do (
    set /a hour_e=%%i
    set /a munite_e=%%j
    set /a second_e=%%k
)
call :time_lapse
echo 脚本结束运行的时间是 %time_end%
echo 共花费了 %hour_% 小时 %munite_% 分 %second_% 秒
pause>nul
goto :eof

:time_lapse
:: 一定要按照 秒=>分钟=>小时 的顺序操作
if %second_e% lss %second_b% (
    set /a munite_e=%munite_e%-1
    set /a second_e=%second_e%+60
)
set /a second_=%second_e%-%second_b%

if %munite_e% lss %munite_b% (
    set /a hour_e=%hour_e%-1
    set /a munite_e=%munite_e%+60
)
set /a munite_=%munite_e%-%munite_b%

if %hour_e% lss %hour_b% (
    set /a hour_e=%hour_e%+24
)
set /a hour_=%hour_e%-%hour_b%
goto :eof

另外一种方法(Code by Pengfei)：
@echo off
::11:08:25.45
:: 运行程序的时间统计
set _time_start=%time%
set /a hour_start=%_time_start:~0,2%
set /a minute_start=1%_time_start:~3,2%-100
set /a second_start=1%_time_start:~6,2%-100
echo %time%
echo %hour_start%
echo %minute_start%
echo %second_start%
pause
:: 结束程序的时间统计
set _time_end=%time%
set /a hour_end=%_time_end:~0,2%
set /a minute_end=1%_time_end:~3,2%-100
set /a second_end=1%_time_end:~6,2%-100
echo %time%
echo %hour_end%
echo %minute_end%
echo %second_end%
pause

:: 计算秒数
if %second_end% lss %second_start% (
    set /a second_end=%second_end%+60
    set /a minute_end=%minute_end%-1
)
set /a second=%second_end%-%second_start%

:: 计算分钟数
if %minute_end% lss %minute_start% (
    set /a minute_end=%minute_end%+60
    set /a hour_end=%hour_end%-1
)
set /a minute=%minute_end%-%minute_start%

:: 计算小时数
if %hour_end% lss %hour_start% (
    set /a hour_end=%hour_end%+24
)
set /a hour=%hour_end%-%hour_start%

echo %hour%:%minute%:%second%
pause