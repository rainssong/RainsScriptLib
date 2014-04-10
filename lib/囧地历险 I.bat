rem 囧游戏   by：NOG 即杯具的新手
@echo off
cls
Title 囧地历险
::begin-----------------------------------
echo 欢迎来到某囧地！
ping -n 2 127.1>nul 
echo 有两条路，你要走哪条？
echo 1.通向彼岸的路 2.通向另一条路的路
set /p choose=
if "%choose%"=="1" goto die1
ping -n 2 127.1>nul
echo 地上有把枪，要不要捡？
echo 1.不捡 2.捡
set /p choose=
if "%choose%"=="2" goto die2
ping -n 2 127.1>nul
echo 地上有钞票，要不要捡？
echo 1.不捡 2.捡
set /p choose=
ping -n 2 127.1>nul
echo 遇到一个商店！
if "%choose%"=="2" goto qian
ping -n 2 127.1>nul
echo 靠，没钱！
:goon
ping -n 2 127.1>nul
echo 走啊走，走啊走，遇到了一个城管！
ping -n 2 127.1>nul
if "%qiang%"=="yes" goto chengguan
ping -n 2 127.1>nul
echo 城管无视了你
ping -n 2 127.1>nul
echo 继续走，遇到一只落入陷阱的恐龙。。。。。。
echo 恐龙落入陷阱了，你愿意帮助它吗？1.愿意 2.不愿意
set /p choose=
if "%choose%"=="1" goto konglong
:goon2
echo 遇到一只成仙的脑残猴子（不是孙悟空），原来他就是BOSS啊....
ping -n 2 127.1>nul
if "%konglong%"=="yes" goto win
echo 猴子运用未知脑残电波，解决了你，可惜啊，在终点前挂了。。。
goto end
:win
echo 恐龙冲上去与猴子大战！
ping -n 2 127.1>nul
echo 猴子直接被恐龙咬成碎片！
ping -n 2 127.1>nul
echo 偶也，你通关了！
ping -n 2 127.1>nul
echo.
echo.
echo --------------------------
echo 囧地历险
echo 制作者：NOG 即杯具的新手
echo 谢谢使用。
echo --------------------------
ping -n 2 127.1>nul
jiong2.bat
:konglong
echo 恐龙从现在起，到未来都是你的朋友！
ping -n 2 127.1>nul
set konglong=yes
goto goon2
:chengguan
echo 城管：非法持枪，跟我走一趟吧！
ping -n 2 127.1>nul
echo 你：靠，城管管这么宽！
ping -n 2 127.1>nul
echo 城管：好吧，你拿着枪走路，影响市容，现在拘留！
ping -n 2 127.1>nul
echo 你要不要与城管大战一场？
echo 1.要 2.不要
set /p choose=
if "%choose%"=="2" goto die3
echo 枪没子弹，你被城管打死了。。。。。人品问题。。。。。
echo 游戏完成度：60
goto end
:die3
echo 你被拘留啦！拘留天数：362452455245天！游戏结束！人品问题。。。。
echo 游戏完成度：60
goto end
:qian
ping -n 2 127.1>nul
echo 哇，商店里只卖一把手【囧】枪，于是你买了。。。
set qiang=yes
goto goon 
:die2
echo 枪走火，你挂啦！！！！杯具啊！
echo 游戏完成度：20
goto end
:die1
echo 哇，碰到陷阱，你真的到彼岸了！刚开始就挂了，杯具中的餐具！
echo 游戏完成度：0
goto end
::end-----------------------------------
:end
echo 按任意键退出.......
pause>nul
