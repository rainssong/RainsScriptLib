@echo off
:: 获取当前目录名
:: 当路径中含有空格、感叹号、点号、&和~的时候，也能正确提取
set "cd_=%cd%"

:loop
set "cd_=%cd_:*\=%"
set "cd_tmp=%cd_:\=%"
if not "%cd_tmp%"=="%cd_%" goto loop
echo "%cd_%"
pause