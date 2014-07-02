@echo off
goto run

问题是这样的，有一个文本文件，里而的内容如下
accident
n.意外遭遇,事故；意外(因素)
across
prep.横过，越过；在的对面 ad.横过，穿过
active
adj.活跃的，敏捷的，积极的；在活动中的
advertise
vt.公告，公布；为...做广告 vi.登广告
after
prep.在...以后；在...后面 adv.以后，后来
我怎么才能把它放到另外一个文件中，其内容为：
accident     n.意外遭遇,事故；意外(因素)
across     prep.横过，越过；在的对面 ad.横过，穿过
active     adj.活跃的，敏捷的，积极的；在活动中的
advertise     vt.公告，公布；为...做广告 vi.登广告
after     prep.在...以后；在...后面 adv.以后，后来

常规解法：
@echo off
:: code by jm 2006-9-21 CMD@XP
set /a num=1
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (1.txt) do (
    set /a num+=1
    set /a mod=!num!%%2
    if !mod! equ 1 (set var=%%i) else (set str=%%i)
    if !mod! equ 1 echo !str!    !var!
)
pause
goto :eof

最简洁最高效的解法：
:run
@echo off
:: code by 3742668 2006-9-21 CMD@XP
setlocal ENABLEDELAYEDEXPANSION
for /f "delims=" %%i in (1.txt) do (
    if "!str!" == "" ( set str=%%i
                     ) else (
                             echo !str!    %%i
                             set str=
                            )
    )
pause