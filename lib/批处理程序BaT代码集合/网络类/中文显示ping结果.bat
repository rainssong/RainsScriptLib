@echo off
color f2
echo.
set for=于
set of=的
set with=用
set in=(以
set data:=数据
set milli-seconds:=毫秒为单位)
set Approximate=大约
set times=时间:
set round=来回
set trip=行程
set Reply=应答
set from=来自
set bytes=字节
set time=时间:
set timed=时间
set out=超过
set statistics=统计
set Packets:=包:
set Sent=已发送=
set Received=已收到=
set Lost=已丢失=
set loss)=丢失)
set Minimum=最小值=
set Maximum=最大值=
set Average=平均值=
set TTL=TTL=
setlocal enabledelayedexpansion
set a=
set/p a=请输入要ping的网址或IP   
for /f "delims=" %%i in ('ping %a%') do (
    set ret=
    for %%a in (%%i) do if defined %%a (set ret=!ret!!%%a!) else set ret=!ret! %%a 
    if not "!ret!"=="" (set ret=!ret:time=时间! && echo !ret!) else echo.
)
pause>nul