:: 版本一：

@echo off
:: code by jm modified by youxi01 2006-12-3 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25369
title 读心术P处理版
mode con cols=80 lines=25

:begin
cls
setlocal enabledelayedexpansion
set str=☆★○●◎◇◆□■△▲※→←↑↓〓＠〖〗【】『』≈≡∑∈⊙∵∴¤
for /l %%i in (0,1,99) do (
    set /a random_=!random!%%32
    call set var%%i=%%str:~!random_!,1%%
)
echo.
echo      99 %var99%  79 %var79%  59 %var59%  39 %var39%  19 %var19%    ^|    ① 从10～99之间任意选择一个数
echo      98 %var98%  78 %var78%  58 %var58%  38 %var38%  18 %var81%    ^|
echo      97 %var97%  77 %var77%  57 %var57%  37 %var37%  17 %var17%    ^|    ② 把这个数的十位与个位相加
echo      96 %var96%  76 %var76%  56 %var56%  36 %var81%  16 %var16%    ^|
echo      95 %var95%  75 %var75%  55 %var55%  35 %var35%  15 %var15%    ^|    ③ 再把任意选择的数减去这个和
echo      94 %var94%  74 %var74%  54 %var81%  34 %var34%  14 %var14%    ^|
echo      93 %var93%  73 %var73%  53 %var53%  33 %var33%  13 %var13%    ^|    　　例如：你选的数是23
echo      92 %var92%  72 %var81%  52 %var52%  32 %var32%  12 %var12%    ^|
echo      91 %var91%  71 %var71%  51 %var51%  31 %var31%  11 %var11%    ^|    　　然后2+3=5，然后23-5=18
echo      90 %var90%  70 %var70%  50 %var50%  30 %var30%  10 %var10%    ^|
echo      89 %var89%  69 %var69%  49 %var49%  29 %var29%   9 %var81%    ^|    ④ 在图表中找出与差值对应的图形
echo      88 %var88%  68 %var68%  48 %var48%  28 %var28%   8 %var8%    ^|
echo      87 %var87%  67 %var67%  47 %var47%  27 %var81%   7 %var7%    ^|   　　并把这个图形牢记心中
echo      86 %var86%  66 %var66%  46 %var46%  26 %var26%   6 %var6%    ^|
echo      85 %var85%  65 %var65%  45 %var81%  25 %var25%   5 %var5%    ^|   ⑤ 然后进入下一步
echo      84 %var84%  64 %var64%  44 %var44%  24 %var24%   4 %var4%    ^|
echo      83 %var83%  63 %var81%  43 %var43%  23 %var23%   3 %var3%    ^|   ⑥ 你会发现：显示出来的图形
echo      82 %var82%  62 %var62%  42 %var42%  22 %var22%   2 %var2%    ^|
echo      81 %var81%  61 %var61%  41 %var41%  21 %var21%   1 %var1%    ^|   　　就是你刚刚心里记下的那个图形
echo      80 %var80%  60 %var60%  40 %var40%  20 %var20%   0 %var0%    ^|
echo                                           ^|
echo _______________________________________________________________________________
echo                               按任意键进入下一步...
pause>nul
cls
for /l %%i in (1,1,9) do echo.
echo                 通过心灵感应，发现这个图形正是你所想的：%var81%
for /l %%i in (1,1,9) do echo.
echo.
echo.
echo                                               按任意键再来一次...
pause>nul
goto begin


pause>nul
goto begin


:: 版本二：

@echo off
:: code by jm 2006-12-21 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25369
title 读心术P处理版

:begin
mode con cols=90 lines=30
cls
echo.
echo 　　从10～99之间任意选择一个数，把这个数的十位与个位相加，再把任意选择的数减去这个和，
echo 例如：你选的数是23，然后2+3=5，然后23-5=18，在图表中找出与差值对应的符号，并把这个符号
echo 牢记心中，然后进入下一步，你会发现：显示出来的符号就是你刚刚心里记下的那个符号。
echo.
echo _________________________________________________________________________________________
echo.

set str=☆★○●◎◇◆□■△▲※→←↑↓〓＠〖〗【】『』≈≡∑∈⊙∵∴¤
set begin_num=9
set end_num=1
set num=0
setlocal enabledelayedexpansion

:loop
for /l %%i in (9,-1,0) do (
    for /l %%j in (%begin_num%,-2,%end_num%) do (
        set /a num+=1
        set /a random_=!random!%%32
        set /a ordinal=1%%j%%i-100
        if !ordinal! lss 10 set ordinal= !ordinal!
        call set var!ordinal!=%%str:~!random_!,1%%
        set /a ordinal_mod=!ordinal!%%9
        if !num! gtr 1 if !num! lss 100 if !ordinal_mod! equ 0 set var!ordinal!=!var18!
        set /a line_mod=!num!%%5
        call set var=!var! !ordinal! %%var!ordinal!%%
        if !line_mod! equ 0 echo                        !var!&set var=
    )
)
if %num% equ 100 goto end
if %num% equ 50 (
    set begin_num=8
    set end_num=0
    goto loop
)

:end
echo _________________________________________________________________________________________
echo                                                                    按任意键进入下一步...
pause>nul
cls
mode con cols=25 lines=10
echo.
echo      你想要的符号是：
echo        ╭────╮
echo        │        │   
echo        │   %var18%   │
echo        │        │
echo        ╰────╯
echo.
echo   按任意键再来一次...
pause>nul
goto begin