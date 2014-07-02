@echo off
:: 对加密批处理进行解密处理
:: 原理：
:: 　　for提取文本行不受编码格式制约,如果加密的代码是通过对文本文件头进行处理得来的话，
:: 可以用如下代码来还原。

if not exist ..\解密 md ..\解密
for %%i in (*.cmd) do (
    del /a /f /q ..\解密\%%~ni.bat 2>nul
    for /f "tokens=*" %%j in (%%i) do (
        >>..\解密\%%~ni.bat echo %%j
    )
)