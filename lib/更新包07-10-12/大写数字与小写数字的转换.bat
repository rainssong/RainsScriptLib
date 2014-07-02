@echo off
:: 转载请注明出处
:: 非常批处理论坛 bbs.verybat.cn   会员 9306516整理(非本人原创)
:: 此代码出自bbs.cn-dos.net
:: Code by JM 2007-1-2～1-3 bbs.cn-dos.net CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26288
:: 中文形式数字转换为阿拉伯数字
:: 思路：
:: 　　先把所有的中文数字转化为前后带空格的阿拉伯数字(零要特殊处理)，
:: 然后，把阿拉伯数字从高位到低位逐一提取出来；提取的同时，对"零"做
:: 补位及替换处理，补位的具体规则为：比较"零"前后的进位，补足相应的0，
:: 比如：某个"零"的前后进位分别为"万"和"拾"，则这个"零"则替换为两个
:: 连续的0。最后，把所有的空格去掉。

setlocal enabledelayedexpansion

set str=捌仟零叁拾万零柒佰零贰点零伍肆

echo.
echo           要处理的中文数值：%str%
echo --------------------------------------------------
:: 把中文数字转化为阿拉伯数字
for /f "tokens=1* delims=点" %%i in ("%str%") do set var1=%%i&set var2=%%j
call :replace_1 %var1%
set int=%var%
if not "%var2%"=="" (
    call :replace_1 %var2%
    set dec=!var:零=!
)
echo.
echo 中文数字阿拉伯化的结果1：%int%.%dec%
:: 提取阿拉伯数字
call :pickup %int%
:: 检查原始数值整数部分的最后一位是不是数字，从而决定是否继续转换
if not "%int:~-1%"==" " (
    set tmp=!last!
    call :replace_2
)
echo.
echo 中文数字阿拉伯化的结果2：%str_%%tmp%.%dec%
if not "%dec%"=="" (
    set result=%str_: =%%tmp%.%dec: =%
) else set result=%str_: =%%tmp%
echo.
echo --------------------------------------------------
echo            最终结果是：%result%
endlocal
pause>nul
goto :eof

:pickup
:: 提取阿拉伯数字，并对"零"做处理
set last=%2
if not %1 equ 0 (
    set str_=!str_! %1
) else (
    set str_=!str_! %zero%
    set tmp=
    set length=0
)
:: 对"×佰零×"之类的数要单独处理
if "%4"=="零" (
    if not "%2"=="佰" (
        call :replace %2 %6
    ) else set zero=0
)
shift
shift
if not "%1"=="" goto pickup
goto :eof

:replace
:: 对"零"做补位处理
if "%2"=="" (
    set tmp=
) else (
    set tmp=%2
    set tmp=!tmp:~0,1!
)
set tmp=%1 %tmp%
call :replace_2
for /f "tokens=1,2" %%i in ("%tmp%") do set former=%%i&set later=%%j
:: 比较字符串 %former% 和 %later% 的长短，不能用 if %former% lss %later% 语句
set flag=!former:%later%=!
if "%flag%"=="%former%" (
    set zero=%former:~1%
    set flag=
    goto :eof
)
:get_length
set /a length+=1
if not "%later%"=="" set later=%later:~0,-1%&goto get_length
set zero=!former:~%length%!
goto :eof

:replace_1
set var=%1
set num=1
for %%i in (壹 贰 叁 肆 伍 陆 柒 捌 玖) do (
    call set var=%%var:%%i= !num! %%
    set /a num+=1
)
set var=%var:零= 0 零 %
goto :eof

:replace_2
set tmp=%tmp:拾=0%
set tmp=%tmp:佰=00%
set tmp=%tmp:仟=000%
set tmp=%tmp:万=0000%
set tmp=%tmp:亿=00000000%
goto :eof

@echo off
:: code by youxi01 2007-1-3 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26288
:: 说明：只能处理1亿以内的数据
setlocal enabledelayedexpansion
set str=捌仟贰佰叁拾万零柒佰零贰点零伍肆
set /a 仟=1000,佰=100,拾=10,个=1

for %%i in (壹 贰 叁 肆 伍 陆 柒 捌 玖) do (
   set/a a+=1
   call set str=%%str:%%i=!a!%%)
for /f "tokens=1* delims=点" %%i in ("%str%") do set rnd=%%i&set dec=%%j
for /f "tokens=1* delims=万" %%i in ("%rnd:零=%") do (
    if "%%j"=="" (
        set/a num1_=0
        call :test %%i 2
        ) else (call :test %%i 1 &call :test %%j 2))
for /f "tokens=2 delims==" %%i in ('set num1_') do set /a Res1+=%%i
for /f "tokens=2 delims==" %%i in ('set num2_') do set /a Res2+=%%i
set /a Res=%Res1%*10000+%Res2%

if "%dec%"=="" (echo !Res!) else echo !Res!.!dec:零=0!

pause>nul
:test
   set tmp=%1
   for /l %%i in (0 2 8) do (
       set tmp_=!tmp:~%%i,2!
       if not "!tmp_!"=="" (
           set tmp1=!tmp_:~0,1!
           set tmp2=!tmp_:~1,1!
           if "!tmp2!"=="" set tmp2=个
           call set /a num%2_%%i=!tmp1!*%%!tmp2!%%) else goto :eof)


@echo off
:: Code by tigerpower 2007-1-3  bbs.cn-dos.net CMD@XP
set USAGE=USAGE: %0 hanzi
setlocal enabledelayedexpansion
set daxie=零壹贰叁肆伍陆柒捌玖
for /l %%a in (0,1,9) do (set Arabic_poi!daxie:~%%a,1!=%%a)
for /l %%a in (0,1,9) do (set Arabic_int!daxie:~%%a,1!=+%%a)
set Arabic_poi点=.
set Arabic_int拾=*10
set Arabic_int佰=*100
set Arabic_int仟=*1000
set Arabic_int万=)*10000
set Arabic_int亿=)*100000000+(0

if "%1"=="" echo %USAGE%&&goto :eof
set input=%1。
set input=%input:零点=点%

set point=0
:loop
if not "!input!"=="" (
set chr=!input:~,1!
if "!chr!"=="点" set point=1
if "!chr!"=="万" set wan=1
if "!chr!"=="亿" set yi=1
if %point%==0 (set chr_int=!Arabic_int%chr%!&&set int=!int!!chr_int!) else (set chr_poi=!Arabic_poi%chr%!&&set poi=!poi!!chr_poi!)
set input=!input:~1!
goto loop)

if not defined int set int=0
if defined wan set int=(!int!
if defined yi (if not defined wan set int=(!int!^))

if defined yi (
for /l %%i in (0,1,22) do (
set ch=!int:~%%i,1!
if "!ch!"==")" set /a index=%%i+1&&goto next)
) else set /a int=!int!&&goto end
:next
set int_yi=!int:~0,%index%!
set /a index=%index%+11
set int_re=!int:~%index%!
set /a int_yi=%int_yi%
set /a int_re=%int_re%
for /l %%j in (0,1,8) do (
set ch=!int_re:~%%j,1!
if "!ch!"=="" set /a zero=8-%%j&&goto next2)
:next2
if defined yi (
for /l %%k in (1,1,%zero%) do set int_re=0!int_re!
set int=!int_yi!!int_re!)

:end
echo %int%%poi%
