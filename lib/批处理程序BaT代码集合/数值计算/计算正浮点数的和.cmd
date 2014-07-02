@echo off
:: 分别把两个数的整数和小数部分提取出来
:: 整数部分在高位用0补齐，小数部分在低位用0填充，使得两个数的数位各自对齐
:: 把补齐后数去掉小数点后，从最后一位开始，按位计算两个单位数的和，超过9就向次高位进1
:: 计算到第一位之后，还原小数点的位置，就得到了两个数相加的结果
:: 例如：要计算 4567.5+5.6789，则处理后的数字为45675000+00056789，然后按位做加法操作
:: 理论上可以计算N位数，突破了17位的限制，但是并不能计算位数超过2^32-1的数字，并且还受
:: CMD下变量值长度的限制
:: code by JM 2006-10～ CMD@XP

:: 还要考虑纯负数、正负数混合的情况；

:main
cls
echo.
echo               要计算某几个数字的和，请直接敲回车
echo.
echo                     退出请输入 e
echo.
set num1=0.0
set times=0
set expression=

:input_loop
set num2=
set sum_=
set /a times+=1
set /p num2=        请输入第 %times% 个数：
if /i "%num2%"=="e" exit
if "%num2%"=="" goto result
if "%num2:~0,1%"=="." set num2=0%num2%
call :input_check "%num2%" num2
set expression=%expression%+%num2%

setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=." %%i in ("%num1%.%num2%") do (
    set int1=%%i
    set int2=%%k
    set dec1=%%j
    set dec2=%%l
    call :get_length int1 %%i
    call :get_length int2 %%k
    call :get_length dec1 %%j
    call :get_length dec2 %%l
    call :add_zero
    call :sum
    goto input_loop
)

:input_check
rem =========== 检测输入是否正确 =========== 
echo %1|findstr "\.">nul||set %~2=%~1.0
for /f "tokens=1* delims=." %%i in (%1) do (
    echo %%i%%j|findstr "^[0-9]*$">nul || (set /a times-=1&goto input_loop)
)
goto :eof    

:get_length
rem =========== 计算各部分数字的长度 ===========
set count=0
:intercept
set /a count+=1
for /f %%i in ("%2") do (
    set var=%%i
    if not "!var:~%count%,1!"=="" goto intercept
    set %1_length=!count!
)
goto :eof

:add_zero
rem =========== 分别在整数部分和小数部分添加0字符串 ===========
:: 在数位不够的整数部分添0补齐
set /a int_length_diff=%int1_length%-%int2_length%
set int_length_diff=%int_length_diff:-=%
call :creat_zero int_zero %int_length_diff%
if %int1_length% gtr %int2_length% (
    set int2=%int_zero%%int2%
    set int_length_max=%int1_length%
    ) else (
    set int1=%int_zero%%int1%
    set int_length_max=%int2_length%
)
:: 在数位不够的小数部分添0补齐
set /a dec_length_diff=%dec1_length%-%dec2_length%
set dec_length_diff=%dec_length_diff:-=%
call :creat_zero dec_zero %dec_length_diff%
if %dec1_length% gtr %dec2_length% (
    set dec2=%dec2%%dec_zero%
    set dec_length_max=%dec1_length%
    ) else (
    set dec1=%dec1%%dec_zero%
    set dec_length_max=%dec2_length%
)
goto :eof

:creat_zero
rem =========== 根据数字字符串长度的差异，生成相应长度的0字符串 ===========
set zero=
for /l %%i in (1,1,%2) do set zero=!zero!0
set %1=%zero%
goto :eof

:sum
rem =========== 按位计算新数的和 ===========
:: 提取整数部分和小数部分来组成新数
set num1_new=%int1%%dec1%
set num2_new=%int2%%dec2%
set /a length_total=%int_length_max%+%dec_length_max%
set switch=0
set sum_tmp=
for /l %%i in (1,1,%length_total%) do (
    set /a sum_tmp=!num1_new:~-%%i,1!+!num2_new:~-%%i,1!+!switch!
    if !sum_tmp! gtr 9 (
        set /a sum_tmp=!sum_tmp!-10
        set switch=1
        ) else (
        set switch=0
    )
    set sum_=!sum_tmp!!sum_!
)
:: 插入小数点
set sum_=!sum_:~0,-%dec_length_max%!.!sum_:~-%dec_length_max%!
:: 判断在最高位时是否进位
if %switch% equ 1 (
    set num1=1%sum_%
    ) else (
    set num1=%sum_%
)
goto :eof

:result
if "%expression%"=="" set /a times-=1&goto input_loop
echo.
echo   %expression:~1%=%num1%
echo.
pause
goto main