@echo off
:: 转载请注明出处
:: by 非常批处理论坛 bbs.verybat.cn
:: 9306516整理(非本人原创)
::功能很简单，就是：隐藏自我，杀任务管理器。
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit
:begin
echo 这里开始可以加入你需要执行的命令了。
