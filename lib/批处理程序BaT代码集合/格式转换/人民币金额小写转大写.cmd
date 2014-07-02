:: 人民币金额小写转大写
:: qzwqzw@bbs.cn-dos.net
:: 2007-01-01
::出处：http://www.cn-dos.net/forum/viewthread.php?tid=26230
@echo off
setlocal EnableDelayedExpansion

set tbl1=零壹贰叁肆伍陆柒捌玖
set tbl2=分角元拾佰仟万拾佰仟亿拾佰仟

:test_
setlocal
set /p num=请输入金额（小于一万亿元）:

for /f "tokens=1,2 delims=." %%f in ("%num%") do (
    set num2=%%g00
    set num=%%f!num2:~0,2!
)

:loop
call set rmb=%%tbl1:~%num:~-1,1%,1%%%%tbl2:~%bit%,1%%%rmb%
set /a bit+=1
set num=%num:~0,-1%
if not "%num%"=="" goto loop

set rmb=%rmb:零拾=零%
set rmb=%rmb:零佰=零%
set rmb=%rmb:零仟=零%
set rmb=%rmb:零零=零%
set rmb=%rmb:零零=零%

set rmb=%rmb:零元=元零%
set rmb=%rmb:零万=万零%
set rmb=%rmb:零亿=亿零%
set rmb=%rmb:零零=零%

set rmb=%rmb:零分=零%
set rmb=%rmb:零角=零%
set rmb=%rmb:角零=角%
set rmb=%rmb:零零=整%

echo 人民币%rmb%

endlocal
goto test_



:: 数字金额转大写
::code by youxi01@cn-dos.net
::date 2006-1-1(Happy new year!best wishes to everyone!)
::出处：http://www.cn-dos.net/forum/viewthread.php?tid=26230
@echo off
setlocal enabledelayedexpansion
set /a a=0,b=0,c=0

::================================
::设置单位名称；
SET NAME0=仟
SET NAME1=佰
SET NAME2=拾
SET NAME3=
::================================

::=============================================
::设置数字对应的大写中文汉字
for %%i in (零 壹 贰 叁 肆 伍 陆 柒 捌 玖) do (
     set BIG!a!=%%i
     set /a a+=1)
::=============================================

::=======================================================================
::在以下“函数”的处理过程中，要用到"#"对数字进行对齐(都成四位)，以便截取；
::这里设置凡是出现"#"的地方都设置为空。
set BIG#=
::=======================================================================

set EN=

::====================================================
::这里对输入的数字进行处理，分别取出整数部分和小数部分;

set /p EN=请输入金钱数(1000亿以内)：
for /f "tokens=1,2* delims=." %%i in ("%EN%") do (
      set "round=%%i"
      set "dec=%%j00" 2>nul)
::=====================================================
set /a round=%round:,=%
set dec=%dec:~0,2%

:test
   set /a b+=1
   ::=============================================
   ::每四位数字为一组，对原来的数据进行截取；
   if %round% gtr 9999 (
      set num!b!=!round:~-4!
      set round=!round:~0,-4!
      goto :test) else set num!b!=!round!
   ::==============================================

::=====================================================
::分别对1、2、3段数据进行处理；分别赋予单位：元、万、亿
::同时，分别将返回的数据传给str1,str2,str3(利用%3来控制)。
call :test1 %num1% 元 1
call :test1 %num2% 万 2
call :test1 %num3% 亿 3
::======================================================

::====================================================================
::去掉数字大写里多余的"零"。比如，1002，处理后读出来为："壹千零贰元整"
::符合我们中国人一般的读数方法;同时将结果分别传入str1,str2,str3(%2控制)。
call :test2 %str1% 1
call :test2 %str2% 2
call :test2 %str3% 3
::=====================================================================

::==============================================================
::防止类似2,0000,1002.00形式出现错误(错误读为：2亿万1千零2元整)
if "!str2!"=="零万" set str2=零
::===============================================================

set str=%str3%%str2%%str1%
set str=%str:零元=元%
set str=%str:零万=万%
set str=%str:零亿=亿%

::防止整数部分为0；
if "%str%"=="元" set str=零元

::对小数部分数字进行处理；
if "%dec%"=="00" (set dec=整) else (
    set /a dec1=!dec:~0,1!
    set /a dec2=!dec:~1,1!
    if !dec1! EQU 0 (set dec1=零) else call set dec1=%%BIG!dec1!%%角
    if !dec2! EQU 0 (set dec2=) else call set dec2=%%BIG!dec2!%%分
    set dec=!dec1!!dec2!
)
echo.
echo ========================
echo 你输入的金钱数目大写为：
echo.
echo %str:零零=零%%dec%
echo ========================
pause>nul

:test1
    if not "%1"=="" (
        set temp=####%1
        set temp=!temp:~-4!
        for /l %%i in (0 1 3) do (
               set tmp%%i=!temp:~%%i,1!
               if defined tmp%%i (
                  if !tmp%%i! GTR 0 (call set str%3=!str%3!%%BIG!tmp%%i!%%!NAME%%i!) else (
                         call set str%3=!str%3!%%BIG!tmp%%i!%%)))
       set str%3=!str%3!%2
       ) else set str%3=
     goto :eof

:test2
     set tmp=%1
     set tmp=%tmp:零零=零%
     set str%2=%tmp:零零=零%
     goto :eof