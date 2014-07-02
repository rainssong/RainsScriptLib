:: 转载请注明出处
:: by 非常批处理论坛 bbs.verybat.cn
:: 9306516整理(非本人原创)
@echo off
for /l %%i in (1,1,100) do set /a sum+=%%i
echo %sum%
pause