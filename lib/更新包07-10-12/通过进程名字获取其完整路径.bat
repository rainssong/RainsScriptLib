@echo off
:: 转载请注明出处
:: 非常批处理论坛 bbs.verybat.cn   会员 9306516整理(非本人原创)
:: 以svchost.exe为例
wmic process where name="svchost.exe" get executablepath|find /i /v "exec"
pause