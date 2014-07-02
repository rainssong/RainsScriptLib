@echo off
:: 转载请注明出处
:: 非常批处理论坛 bbs.verybat.cn   会员 9306516整理(非本人原创)
:: 原帖子地址:http://bbs.verybat.cn/viewthread.php?tid=4464&extra=page%3D1
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
rem 这里开始可以加入你需要执行的命令们了。
