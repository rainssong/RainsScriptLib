@echo off 
echo 请输入想产生的随机数的最大值,如1-100就输入100 
set /p s= 
echo 请输入显示的个数 
set /p g= 
cls 
set count=0 
:loop 
set /a num=%random%%%%s%+1 
if not defined num%num% ( 
set num%num%=%num% 
set /a count+=1 
call echo %%num%% 
) 
if %count% lss %g% goto loop 

pause>nul
