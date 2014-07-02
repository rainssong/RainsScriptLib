@echo off
:: 目的：
::     SearchNet.TXT中每行只有一个数，统计每个数的重复次数，并按照重复次数由高到低排序
:: 思路：
::     先用sort把所有的数排序，然后统计重复次数，以 数+重复次数 的格式写入临时文件tmp2.txt；
::     提取重复次数的数字，以该数字为长度建立以该数字命名的文件，用dir来把文件名(即重复次数)排序，写入tmp3.txt；
::     按行提取tmp3.txt中的内容，然后在tmp2.txt中查找与tmp3.txt中匹配的记录，写入结果；
::     此方案会产生大量的临时文件，但是效率比较高
:: code by jm 2006-11-25 CMD@XP
:: 出处：http://bbs.wuyou.com/viewthread.php?tid=86487
set num=-1
sort<SearchNet.TXT>tmp1.txt
cd.>tmp2.txt
cd.>tmp3.txt
cd.>result.txt

:: 统计重复次数
setlocal enabledelayedexpansion
for /f %%i in (tmp1.txt) do (
    set /a num+=1
    set second=!first!
    set first=%%i
    if not "!second!"=="" if !second! neq !first! (>>tmp2.txt echo !second!  !num!&set num=0)
)
>>tmp2.txt echo %first%  %num%

:: 对重复次数排序
md tmp && pushd tmp
for /f "tokens=2" %%i in (..\tmp2.txt) do (
    cd.>%%i
    for /l %%j in (1,1,%%i) do echo.>>%%i
)
>..\tmp3.txt dir /o-s /b

:: 按重复次数提取记录
for /f %%i in (..\tmp3.txt) do (
    >>..\result.txt findstr " %%i$" ..\tmp2.txt
)
popd && rd /q /s tmp
del tmp1.txt tmp2.txt tmp3.txt
start result.txt
goto :eof

关于统计字符出现个数的其他方案(都不生成临时文件)

@echo off
:: 统计每个字符出现的次数，并求出出现次数最多的字符
:: 思路：
::     通过提取每个位上的字符，赋予统一以 字符： 开头的某些动态变量，
::     如果变量名相同，则自加一次，然后，通过 set 字符：命令一次性提取
::     所有以 字符： 开头的动态变量，交给 for 语句来处理。set 用得很巧妙
::     无须生成临时文件，并按照字母升序排列
::
::     code by 无奈何 remarked by jm 2006-11-29
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25182

setlocal ENABLEDELAYEDEXPANSION
set str=adadfdfseffserfefsefseetsdmg
set /a m=0,n=0,l=0

call :loop

:: 以下是求出现次数最多的字符
for /f "tokens=1,2 delims==" %%i in ('set 字符：') do (
        echo %%i=%%j
        if %%j GTR !l! set l=%%j& set m=%%i
)

echo.出现次数最多的%m%=%l%
pause
goto :EOF

:loop
call set m=%%str:~%n%,1%%
if not defined m goto :EOF
set /a "字符：%m%+=1"
set /a n+=1
goto loop


@echo off
:: 统计字符出现次数
:: 思路：
:: 　　 先把字符串拆解为以空格分隔的单字符组成的字符串，
::      然后用for语句来探测每个字符在串中出现的次数
::      此方法无须生成临时文件，并按照在字符串中出现的
::      先后顺序显示
::
:: code by zxcv remarked by jm 2006-11-29
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25182

setlocal EnableDelayedExpansion
set str=adadfdfseffserfefsefseetsdg

rem 拆解字符串
:analyze
set str_tmp=%str_tmp% %str:~0,1%
set str=%str:~1%
if not "%str%" == "" goto analyze

rem 
for %%i in (%str_tmp%) do call :exclude %%i

pause
exit

:exclude
for %%i in (%counted%) do if "%1"=="%%i" goto :eof
set counted=%counted% %1
call :count %1
goto :eof

:count
for %%i in (%str_tmp%) do if "%1"=="%%i" set /a %1+=1
echo %1 !%1!
goto :eof

@echo off
:: 统计字符出现的次数
:: 思路：
::     拆解字符串，以空格分隔组成新字符串
::     通过 shift 来call 不同的参数，并用
::     set 来命名变量，变量名具有统一的开头
::     最后通过 set 来显示这些变量
::
::     code by redtek ;modified by zxcv ; remarked by jm 2006-11-29
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25182

setlocal EnableDelayedExpansion
set str=adadfdfseffserfefsefseetsdg

:loop
set str_tmp=%str_tmp% %str:~0,1% && set str=%str:~1%
if not "%str%" == "" goto loop

call :start %str_tmp%
set . 
echo 出现次数最多的:%max%=%maxN%
pause
exit

:start
if [%1]==[] ( goto :eof ) else ( set /a  .%1+=1 )
if !.%1! GTR !maxN! set maxN=!.%1!&& set max=.%1
shift
goto :start

@echo off
:: 综合以上方案，最简洁的代码如下
:: code by zxcv 2006-11-29
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25182

setlocal EnableDelayedExpansion
set str=adadfdfseffserfefsefseetsdgadadfdfseffserfefsefseetsdga

:loop
set str$=%str$% %str:~0,1%&set str=%str:~1%
if not "%str%" == "" goto loop

for %%n in (%str$%) do (
  set /a .%%n+=1
if !.%%n! GTR !maxN! set maxN=!.%%n!&&set max=%%n)
set .
echo 出现次数最多的:%max%=%maxN%
pause
exit

@echo off&setlocal
:: sort之后，通过比较这一次取到的内容和上一次的内容是否相等来统计重复次数
:: 如何同时保存本次和上次的内容需要很大的技巧
:: 注意要把次数的初值设置为1，for语句的后括号之后不能紧跟跳出语句
:: code by bagpipe  2006-12-16 remarked by JM
:: 出处：http://bbs.wuyou.com/viewthread.php?tid=86487
set /a n=1
for /f %%a in ('type 1.txt^|sort') do (
call :pp %%a
)
:pp
if not defined bb goto b
if "%bb%"=="%1" (set /a n+=1) else (>>ko.txt echo %bb%  %n%次&set /a n=1)
:b
set bb=%1
goto :eof

@echo off&setlocal enabledelayedexpansion
:: 带排序功能的代码
:: 用 for /l 来控制每次 findstr 的字符长度，
:: 然后把同一长度的用 sort 来排序，从而突破了
:: sort 只能按字符位大小来排序这一限制
:: code by bagpipe 2006-12-16 remarked by JM
:: 出处：http://bbs.wuyou.com/viewthread.php?tid=86487
set a=[0-9]
for /l %%a in (1,1,3) do (
call :pp !a!
set a=!a![0-9]
)
goto c
:pp
for /f %%x in ('findstr "^%1$" aa.txt^|sort') do @echo %%x >>dd.txt
goto :eof

:c
set /a n=1
for /f %%a in ('type dd.txt') do (
call :pp %%a
)
:pp
if not defined bb goto b
if "%bb%"=="%1" (set /a n+=1) else (>>ko.txt echo %bb%  %n%次&set /a n=1)
:b
set bb=%1
goto :eof