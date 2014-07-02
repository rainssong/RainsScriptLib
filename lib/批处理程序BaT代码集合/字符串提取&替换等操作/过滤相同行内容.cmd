@echo off
:: mode con lines=25
:: 解决问题的思路：
:: 比较相邻三行的内容
:: 如果前两行内容相等，并且与第三行不相等，则取第二行的内容放入repetition.txt
:: 如此循环
:: 跳出for之后
:: 如果最后一行和倒数第二行内容相等，则把最后一行内容放入repetition.txt
:: 最后，用for从repetition.txt中逐行读出信息，在原文件中把这些信息过滤掉
:: 行首的空格将被忽略，空行将不被删除(且不纳入统计数据)
:: 效率惊人地高

:: 不能处理的符号有：
:: 管道符号:|
:: 连接符号：&、&&、||
:: 重定向符号：<、<<、>、>>
:: 转义符号：^
:: 其他字符："、;、:、\(但是在行首是可以的)

:: 弊端：
:: findstr不能搜索过长的字符串(长度是多少？)

:: Code by JM,Thanks to NaturalJ0
:: build on 2006-9-4～2006-9-
:: 还要完善或者开发的功能：
:: 对无用的临时文件的处理；统计被过滤的行数；操作时的提示；适应各种文件名；
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=18996

cls
title 相同行内容过滤器-处理中...
call :blank
call :blank
echo                          正在处理，请耐心等待...
:: 做程序开始时间标记
set time_begin=%time:~0,-3%
for /f "tokens=1,2,3 delims=:" %%i in ("%time_begin%") do (
    set /a hour_b=%%i
    set /a munite_b=%%
    set /a second_b=%%
)

set lines_total=0
set count_same=0
>sort.txt sort<test.txt
cd.>repetition.txt
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (sort.txt) do (
    set first=!second!
    set second=!third!
    set third=%%i
    set /a lines_total+=1
    call :comp_
)
:: 当%second%未取到值的时候，要避免repetition.txt记录echo的状态
if not "%second%"=="" if "%second%"=="%third%" >>repetition.txt echo %third%&& set /a count_same+=1
:: 没有重复内容则不对原文件作过滤处理
findstr . repetition.txt>nul||(del /q repetition.txt & goto :result)
copy test.txt test.bak>nul
for /f "tokens=*" %%i in (repetition.txt) do (
    findstr /v "\<%%i\>" test.txt>>tmp.txt
    del /q test.txt
    ren tmp.txt test.txt
)
:result
for /f "tokens=*" %%i in (test.txt) do (
    set /a lines_spare+=1
)
if "%lines_spare%"=="" set lines_spare=0
:: 当文本内容超过3行，且存在用相同个数的空格为内容的行时
:: repetition.txt会记录echo的状态，会导致统计不准确
:: 所以还要用通过比较处理前后行数是否相同来校正统计数据
if "%lines_total%"=="%lines_spare%" (del /q repetition.txt&set count_same=0)
set /a lines_del=%lines_total%-%lines_spare%
cls
title 相同行内容过滤器-过滤结果
call :blank
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo                   原文件共有 %lines_total% 行;共有 %count_same% 条重复记录.(未计算空行)
echo                   处理后的文件还剩 %lines_spare% 行.(未计算空行)
echo                   被删除的内容总计 %lines_del% 行

rem ======计算花费的时间========
set time_end=%time:~0,-3%
for /f "tokens=1,2,3 delims=:" %%i in ("%time_end%") do (
    set /a hour_e=%%
    set /a munite_e=%%j
    set /a second_e=%%k
)
call :time_lapse
echo                   耗时： %hour_% 小时 %munite_% 分 %second_% 秒.
echo.
echo                   test.txt为处理后的文件；test.bak为原始文件的备份
echo                   sort.txt为原始文件内容的排序文件，你可以很方便地
echo               查看文本内容重复与否及重复情况；
echo                   repetition为重复行的内容，升序排列；若原始文本没
echo               有重复行，则此文件不存在.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
call :blank
echo                                                                 按任意键退出...
pause>nul
goto :eof

:comp_
:: 当%second%或者三个变量全都取到空值的时候，要避免repetition.txt记录echo的状态
if not "%first%"=="" (
  if not "%second%"=="" (
    if "%second%"=="%first%" (
      if not "%second%"=="%third%" >>repetition.txt echo %second%&& set /a count_same+=1
    )
  )
)
goto :eof

rem =====计算运行程序花费的时间========
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

:blank
echo.
echo.
echo.
echo.
goto :eof