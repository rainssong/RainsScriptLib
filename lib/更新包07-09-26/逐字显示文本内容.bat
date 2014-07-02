:: 转载请注明出处
:: by 非常批处理论坛 bbs.verybat.cn
:: 9306516整理(非本人原创)
@echo off
::创建范例文本
echo “非常批处理论坛，批处理爱好者的家园。” bbs.verybat.cn>verybat.txt
::进入正题
set str=0
for /f "delims=" %%a in (verybat.txt) do call :lis %%a
pause
del verybat.txt
goto :eof

:lis
  set var=%*
:loop
  call set num=%%var:~%str%,1%%
  if "%num%"=="" set str=0&goto :eof 
  if "%num%"==" " (echo\) else set /p x=%num%<nul
  set/a str+=1
  goto loop