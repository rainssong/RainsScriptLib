@echo off
:: 转载请注明出处
:: by 非常批处理论坛 bbs.verybat.cn
:: 9306516整理(非本人原创)

::说明----将文本中的所有内容无规则打乱顺序排列
@echo off
if "%1" neq "$" (
    for /f "tokens=2 delims=#" %%a in ('"%~0" $^|sort') do echo %%a
    pause>nul
) else for /f "delims=" %%i in (test.txt) do call echo %%random:~-1%%%%random:~-1%% #%%i