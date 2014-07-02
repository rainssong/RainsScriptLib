@echo off
:: code by  tao0610 2006-12-5
set a=▉&set b=69&set c=%% 
set space=                                                                      
:start
set a=%a%▉
set/a b-=2
set/a num+=3
if %num%==12 set/a b-=1
call set space=%%space:~0,%b%%%
if %num% gtr 100 set num=溢出&&set c=
echo.
echo.
color fc
echo                     ┏━━┓我      ●╭○╮   我┏━━┓
echo                     ┃天长┃愛  ★ /█∨█\ ★ 想┃永远┃
echo                     ┃地久┃你      ∏  ∏     你┃拥有┃
echo                     ┗━━┛．   我爱你一万年    ┗━━┛
echo   感情进度条......
echo  ┏─────────────────────────────────────┓
echo  │%a%%space%%num%%c%│
echo  ┗─────────────────────────────────────┛
ping/n 2 127.1>nul
if "%num%" neq "溢出" cls&goto start
for /l %%a in (1,1,10) do color cf&ping/n 1 127.1>nul&color fc&ping/n 1 127.1>nul

