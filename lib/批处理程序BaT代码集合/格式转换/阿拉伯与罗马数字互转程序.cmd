:: 阿拉伯与罗马数字互转程序
:: qzwqzw http://bbs.cn-dos.net
:: 2007-01-03 Revision 2
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26230
@echo off
setlocal EnableDelayedExpansion

for /l %%i in (1,1,100) do (
    set /a numin=!random!*4200/32768-100
    set in=!numin!
    set out=
    call :Arab2Roman
    set in=!out!
    call :Roman2Arab
    echo.%%i [!numin!:!in!:!out!]
    if !numin! neq !out! set /p=--- Invalid ---
)
pause
endlocal
goto :eof

:Arab2Roman
setlocal EnableDelayedExpansion
set num=%in%
set /a tmp=num+0
if not "%num%"=="%tmp%" goto :eof
if %num% geq 4000 goto :eof
if %num% leq 0 goto :eof

set i=0
for %%v in (1000 900 500 400 100 90 50 40 10 9 5 4 1) do (
    set /a i+=1
    set arab!i!=%%v
)

set i=0
for %%v in (M CM D CD C XC L XL X IX V IV I) do (
    set /a i+=1
    set roman!i!=%%v
)

set i=1
:a2r_loop
call set tmp=%%arab%i%%%

if 1%num% lss 1%tmp% (
    set /a i+=1
) else (
    call set rom=%rom%%%roman%i%%%
    set /a num-=tmp
)

if 1%num% gtr 10 goto a2r_loop

endlocal & set out=%rom%
goto :eof
::Arab2Roman

:Roman2Arab
setlocal EnableDelayedExpansion

echo.%in%|findstr /r "[^IVXLCDMivxlcdm]">nul && goto :eof

set i=0
for %%v in (1000 900 500 400 100 90 50 40 10 9 5 4 1) do (
    set /a i+=1
    set arab!i!=%%v
)

set i=0
for %%v in (M 1 D 2 C 3 L 4 X 5 V 6 I) do (
    set /a i+=1
    set roman!i!=%%v
)

set in=%in:m=M%
set in=%in:d=D%
set in=%in:c=C%
set in=%in:l=L%
set in=%in:x=X%
set in=%in:v=V%
set in=%in:i=I%

set in=%in:CM=1%
set in=%in:CD=2%
set in=%in:XC=3%
set in=%in:XL=4%
set in=%in:IX=5%
set in=%in:IV=6%

set i=1
set num=0
:r2a_loop
set tmp=%in:~0,1%
call set rom1=%%roman%i%%%
if "%tmp%"=="%rom1%" (
    call set /a num+=arab%i%
    set in=%in:~1%
) else (
    set /a i+=1
)
if %i% gtr 13 goto :eof
if not "%in%"=="" goto r2a_loop

endlocal & set out=%num%
goto :eof
::Roman2Arab