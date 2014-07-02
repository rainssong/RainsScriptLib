@echo off
:: 转载请注明出处
:: 非常批处理论坛 bbs.verybat.cn   会员 9306516整理(非本人原创)
:: 以转移到D盘为例
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "D:\pagefile.sys 512 1024"