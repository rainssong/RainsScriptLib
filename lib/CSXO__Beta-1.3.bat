
@rem ----- ExeScript Options Begin -----
@rem ScriptType: console
@rem DestDirectory: temp
@rem Icon: default
@rem OutputFile: 【火京灵の制作】
@rem ----- ExeScript Options End -----
@echo off
@rem ====上面数据不要修改====



title CSXO  Beta-1.3版 开发者的愤怒 
color 0a

set lv=0
set rhp=100
set rhpsx=100
set rmp=50
set rmpsx=50
set rgj=15
set rfy=10
set yl=0
set ds=0
set exp=0
set sjexp=10
set wqmc=无
set wqgj=0
set fzmc=无
set fzfy=0
set ydmc=无
set ydqx=0
set mzmc=无
set mzmf=0
set mfhf=3
set sjexpdz=10
set hh=1
set jcy=0
set xhy=0
set jnl1=无
set jnl01=空技能栏

set jse=楚云星
set sp=0
set jshu=0
set sli=0
set sbai=0
set sp=0




echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 游戏启动                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.     
echo                                                         Bug提交: 百度丨弦灵吧
echo.
echo.
echo.
echo.
echo.                         
echo               人人都可以制作游戏，用记事本打开这个游戏，
echo.
echo.
echo                         修改、加工这个游戏吧~
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
goto sye

:sye
set fhui=sye
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                    首 页                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店                             角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo CSXO  Beta-1.3版 开发者的愤怒       
echo.
echo.
echo.
echo.
echo                                1. 对抗模式  
echo.
echo.
echo. 
echo.
echo                                2.制作人员
echo.
echo                                3.更新公告
echo.
echo                                0.退出游戏
echo.
echo.
echo 请输入：
set /p you=
if %you%==1 goto dkms
if %you%==2 goto zzry
if %you%==3 goto gxgg
if %you%==0 goto tcyx

if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd

echo 输入错误！请重新输入！
pause
goto sye

:tcyx
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                               退出游戏                                   ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo.
echo.  
echo                             真的要退出游戏么？
echo. 
echo.
echo.
echo.
echo.
echo                      1.退出              0.返回首页
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 请输入：
set /p you=
if %you%==1 goto tuichu
if %you%==0 goto sye

echo 输入错误的输入，正在返回！
pause
goto sye

:zzry
set fhui=zzry
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                               开 发 者                                   ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo   源代码：bat                 编码：火京灵              =百 度  弦 灵 吧=
echo.  
echo.
echo.
echo.
echo.
echo  1.关注作者微博
echo.
echo  2.加入官方贴吧
echo.
echo  3.查看CSXO小说
echo.
echo.
echo.
echo  输入弦灵吧Q群进入 开发者调试工具 (234877335)
echo.
echo.
echo.
echo 请输入：
set /p you=
if %you%==234877335 goto kfz
if %you%==1 goto zzwb
if %you%==2 goto gftb
if %you%==3 goto dkxs
if %you%==0 goto sye

echo 输入错误的代码，请重新输入！
pause
goto zzry


:zzwb
"C:\Program Files\Internet Explorer\iexplore.exe" "http://t.qq.com/mj3860"
echo.
echo 你的支持是我们的动力，谢谢
echo.
pause
goto zzry

:gftb
"C:\Program Files\Internet Explorer\iexplore.exe" "http://tieba.baidu.com/f?kw=弦灵"
echo.
echo 欢迎加入我们的贴吧！记得经常签到哦~啵
echo.
pause
goto zzry

:dkxs
"C:\Program Files\Internet Explorer\iexplore.exe" "http://www.17k.com/book/140031.html"
echo.
echo 小说虽然太监了，还是看一下吧~
echo.
pause
goto zzry

:kfz
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                          开 发 者 调试工具                               ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo                                 s.首页
echo.
echo.
echo.
echo 1.修改角色数据
echo.
echo 2.修改其他数据
echo.
echo 3.修改主题颜色
echo.
echo.
echo                                     开发者功能仅用于学习，过渡修改失去游戏乐趣
echo.
echo                                            百度弦灵贴吧--游戏部门
echo.
echo.
echo.
echo.
echo 请输入：
set /p you=
if %you%==1 goto jssj
if %you%==2 goto qtsj
if %you%==3 goto zts

if %you%==s goto sye

echo 输入错误，请重新输入！
pause
goto kfz

:jssj
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                          开 发 者 调试工具                               ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo                                 s.首页
echo.
echo.
echo.
echo 1.修改角色HP
echo.
echo 2.修改角色攻击
echo.
echo 3.设定SP值
echo.
echo 4.修改角色名字
echo.
echo.
echo 0.返回
echo.
echo                                     开发者功能仅用于学习，过渡修改失去游戏乐趣
echo.
echo                                            百度弦灵贴吧--游戏部门
echo.
echo.
echo 请输入：
set /p you=
if %you%==1 goto jshp
if %you%==2 goto jsgj
if %you%==3 goto ssp
if %you%==4 goto jsmz
if %you%==0 goto kfz

if %you%==s goto sye

echo 输入错误，请重新输入！
pause
goto jssj

:jshp
echo.
echo 请输入HP值：
set /p rhp=
set /a rhpsx=%rhp%
echo 角色HP修改成功！
pause
goto jssj
:jsgj
echo.
echo 请输入攻击力：
set /p rgj=
echo 角色攻击力修改成功！
pause
goto jssj
:ssp
echo.
echo 请输入SP值：
set /p SP=
echo 角色SP值修改成功！
pause
goto jssj
:jsmz
echo.
echo 请输入角色名字：
set /p jse=
echo 角色名字修改成功！如果需要中文名字请用粘贴功能！
pause
goto jssj

:qtsj
echo 作者还没想出要修改的东西，请等待更新！
pause
goto kfz

:zts
echo 作者懒，没做出来，请等待更新！
pause
goto kfz


:gxgg
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 更新公告                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo 1.0版，优化发布，游戏前身是《CSOL战记》
echo.
echo 1.1版，更新内容，新增技能疯狂杀戳和修复已知BUG
echo.
echo 1.2版，修复显示金币数量
echo.
echo 1.3版开发者的愤怒，新增开发者调试功能，修复显示角色攻击力和攻击力的加点功能
echo.    
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo   提示：人物的不会自动升级，所以够经验后自己手动升级。
echo.
echo.
pause
goto sye

:rwxx
set fhui=rwxx
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 个人信息                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店             s.首页         角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓          
echo     角色：%jse%  
echo                                                              战：%jshu%      
echo     等级：%lv%   
echo                                                              胜：%sli% 
echo     经验：%exp%/%sjexp%               
echo                                                              负：%sbai%
echo     血：  %rhp%/%rhpsx%                
echo     魔：  %rmp%/%rmpsx% 
echo     防：  %rfy% 
echo     攻：  %rgj%                     
echo     技能：%jnl1%            
echo     SP：  %sp%
echo. 
echo   .1. 加血量   .2. 加魔力   .3. 加防御   .4. 加攻击                
echo.                           
echo   .5.学习技能  .6. 升级     .y. 查看说明  
echo. 
echo 请输入：
set /p you=
if %you%==1 goto jxue
if %you%==2 goto jmo
if %you%==3 goto jfang
if %you%==4 goto jgj
if %you%==5 goto jjnd
if %you%==6 goto sj
if %you%==y goto sming
if %you%==0 goto %fhui%
if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd
if %you%==s goto sye

echo 输入错误！请重新输入！
pause
goto rwxx

:jxue
if %sp% geq 1 goto jxue2
echo.
echo SP不足，加点失败！
pause
goto rwxx
:jxue2
set /a sp=%sp%-1
set /a rhp=%rhp%+5+%lv%
set /a rhpsx=%rhpsx%+5+%lv%
echo.
echo 加点成功！
pause
goto rwxx
:jmo
if %sp% geq 1 goto jmo2
echo.
echo SP不足，加点失败！
pause
goto rwxx
:jmo2
set /a sp=%sp%-1
set /a rmp=%rmp%+5+%lv%
set /a rmpsx=%rmpsx%+5+%lv%
echo.
echo 加点成功！
pause
goto rwxx

:jfang
if %sp% geq 1 goto jfang2
echo.
echo SP不足，加点失败！
pause
goto rwxx
:jfang2
set /a sp=%sp%-1
set /a rfy=%rfy%+5+%lv%
echo.
echo 加点成功！
pause
goto rwxx


:jgj
if %sp% geq 1 goto jgj2
echo.
echo SP不足，加点失败！
pause
goto rwxx
:jgj2
set /a sp=%sp%-1
set /a rgj=%rgj%+5+%lv%
echo.
echo 加点成功！
pause
goto rwxx


:jjnd
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 学习技能                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo.
echo     技能名称            使用效果              消耗          学习要求
echo.
echo.
echo  1. 疯狂杀戳        对敌人连续攻击10次        50法力        LV3和10sp值
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  0.返回
echo.
echo.
echo 请输入：
set /p you=
if %you%==1 goto fjsc

if %you%==0 goto rwxx

echo 输入错误！请重新输入！
pause
goto jjnd

:fjsc
if %LV% geq 3 goto fjsc1
echo.
echo 等级不足，操作失败！
pause
goto jjnd

:fjsc1
if %sp% geq 10 goto fjsc2
echo.
echo SP不足，操作失败！
pause
goto jjnd
:fjsc2
set /a sp=%sp%-10
set jnl1= 疯狂杀戳
set jnl01= 疯狂杀戳
echo.
echo 恭喜，操作成功！
pause
goto jjnd

:sj
if %sjexp% leq %exp% goto sjcg
echo.
echo 经验不足，升级失败！
pause
goto rwxx
:sjcg
set /a lv=%lv%+1 
set /a exe=%exp%-%sjexp%
set /a sjexp=%sjexp%+%sjexpdz%
set /a sjexpdz=%sjexpdz%+10
set /a rhpsx=%rhpsx%+20
set /a rhp=%rhpsx%
set /a rmpsx=%rmpsx%+10
set /a rmp=%rmpsx%  
set /a rgj=%rgj%+5
set /a rfy=%rfy%+5
set /a sp=%sp%+4
echo.
echo 升级成功！
pause
goto rwxx

:sming
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 关于说明                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                         
echo.
echo.    
echo.
echo    每加一项能力消耗1 SP值。
echo.
echo    每次升级都可以获得4 SP值。
echo.
echo.
echo.
echo    了解更多内容请到 弦灵吧。
echo.
echo.
pause
goto rwxx

:grck
set fhui=grck
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                    仓 库                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo.
echo.
echo.
echo.
echo                            抱歉，此功能尚未开放！
echo. 
echo.                               
echo. 
echo.                            
echo.
echo.
echo.
echo.
pause
goto rwxx



:sd
set fhui=sd
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 商 店                                    ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店             s.首页         角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo   名称          属性      价格 (金币） 
echo.  
echo 1.MP5           攻击+17     100
echo 2.AK-47         攻击+31     500
echo 3.M4A1          攻击+29     250
echo.
echo.
echo.
echo.
echo 9.下一页
echo.
echo 请输入：
set /p you=
if %you%==1 goto mp5
if %you%==2 goto ak
if %you%==3 goto m4
if %you%==9 goto sd2
if %you%==0 goto %fhui%
if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd
if %you%==s goto sye
echo.
echo 输入错误！请重新输入！
pause
goto sd
:mp5
set zwqmc=MP5 
set /a zwqgj=17
set /a wqjg=100
goto wqgm
:ak
set zwqmc=AK-47
set /a zwqgj=31
set /a wqjg=500
goto wqgm
:m4
set zwqmc=M4A1
set /a zwqgj=29
set /a wqjg=250
goto wqgm

:wqgm
if %wqjg% leq %yl% goto gmwqcg
echo.
echo 金币不足，购买失败！
pause
goto sd
:gmwqcg
set /a yl=%yl%-%wqjg%
set wqmc=%zwqmc%
set wqgj=%zwqgj%
set /a rgj=%rgj%+%wqgj%
echo.
echo 购买成功！
pause
goto sd

:sd2
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                  商 店                                   ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店             s.首页         角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo   名称          属性      价格 (金币） 
echo.   
echo 1.布衣          防御+10   100
echo 2.皮衣          防御+30   500
echo 3.防弹衣        防御+60   1000
echo 4.防弹衣+头盔   防御+100  5000
echo.
echo 0.返回    9.下一页
echo.
echo 请输入：
set /p you=
if %you%==1 goto by
if %you%==2 goto py
if %you%==3 goto lj
if %you%==4 goto szy
if %you%==0 goto sd
if %you%==9 goto sd3
if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd
if %you%==s goto sye
echo.
echo 输入错误！请重新输入！
pause
goto sd2
:by
set zfjmc=布衣
set /a zfzfy=10
set /a fzjg=100
goto fzgm
:py
set zfzmc=皮衣
set /a zfzfy=30
set /a fzjg=500
goto fzgm
:lj
set zfzmc=防弹衣
set /a zfzfy=60
set /a fzjg=1000
goto fzgm
:szy
set zfzmc=防弹衣+头盔
set /a zfzfy=100
set /a fzjg=5000
goto fzgm

:fzgm
if %fzjg% leq %yl% goto gmfzcg
echo.
echo 金币不足，购买失败！
pause
goto sd2
:gmfzcg
set /a yl=%yl%-%fzjg%
set fzmc=%zfzmc%
set fzfy=%zfzfy%
set /a rfy=%rfy%+%fzfy%
echo.
echo 购买成功！
pause
goto sd2

:sd3
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 商 店                                    ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店             s.首页         角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo   名称          属性      价格 (金币） 
echo.
echo 1.生命补液  恢复血400点   1000          已持数量：%jcy%
echo.
echo 2.魔力丸    恢复法100点    500          已持数量：%xhy%
echo.
echo.
echo.
echo 3.免费恢复 血，法（剩余次数：%mfhf%）
echo.
echo.
echo.
echo.
echo 请输入：
set /p you=
if %you%==1 goto gmjcy
if %you%==2 goto gmxhy
if %you%==3 goto hf
if %you%==0 goto sd2
if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd
if %you%==s goto sye
echo.
echo 输入错误！请重新输入！
pause
goto sd3
:gmjcy
if %yl% geq 1000 goto gmjcycg
echo.
echo 金币不足，购买失败！
pause
goto sd3
:gmjcycg
set /a yl=%yl%-1000
set /a jcy=%jcy%+1
echo.
echo 购买成功！
pause
goto sd3
:gmxhy
if %yl% geq 500 goto gmxhycg
echo.
echo 金币不足，购买失败！
pause
goto sd3
:gmxhycg
set /a yl=%yl%-500
set /a xhy=%xhy%+1
echo.
echo 购买成功！
pause
goto sd3
:hf
if %mfhf%==0 goto hfsb
set /a mfhf=%mfhf%-1
set /a rhp=%rhpsx%
set /a rmp=%rmpsx%
echo.
echo 恢复成功！下次再来哟！
echo.
pause
goto sd3

:hfsb
echo.
echo 你的免费恢复次数为0，恢复失败！
echo.
pause
goto sd3
:dkms
set fhui=dkms
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 地图选择                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店             s.首页         角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo.
echo.
echo                    1.失落之城   （等级：LV1-LV3）
echo.
echo                    2.乌拉斯蒂镇 （等级：LV3-LV5）
echo.
echo                    3.莱恩城     （等级：LV5-LV10）
echo.
echo.
echo.                 
echo 请输入：
set /p you=
if %you%==1 goto slzc
if %you%==2 goto wls
if %you%==3 goto lec
if %you%==0 goto %fhui%
if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd
if %you%==s goto sye
echo.
echo 输入错误！请重新输入！
pause
goto dkms
:slzc
set fhui=slzc
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                 失落之城                                 ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo a.人物  b.仓库  c.商店             s.首页         角色：%jse%     %yl%金币
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
echo.
echo.
echo                    1.太监     （等级：LV1-LV3）
echo.
echo                    2.小奥     （等级：LV3-LV5）
echo.
echo                    3.水泥工   （等级：LV5-LV10）
echo.
echo.
echo.                 
echo 请输入：
set /p you=
if %you%==1 goto tjian
if %you%==2 goto xao
if %you%==3 goto sng
if %you%==0 goto %fhui%
if %you%==a goto rwxx
if %you%==b goto grck
if %you%==c goto sd
if %you%==s goto sye
echo 输入错误！请重新输入！
pause
goto slzc
:tjian
set gmc=太监 
set ghp=20
set ggj=15
set gfy=10
set jyl=10
set jexp=10
set dd=dhw
goto zd
:dhgtl
:xao
set gmc=小奥 
set ghp=30
set ggj=20
set gfy=15
set jyl=20
set jexp=15
set dd=dhw
goto zd
:sng
set gmc=水泥工
set ghp=50
set ggj=30
set gfy=20
set jyl=50
set jexp=25
set dd=dhcc
goto zd

:wls
echo.
echo 时间仓促，尚未开放！
pause
goto dkms
:lec
echo.
echo 时间仓促，尚未开放！
pause
goto dkms
:zd
set /a rsjgj=%rgj%-%gfy%
set /a gsjgj=%ggj%-%rfy%
if %gsjgj% lss 1 set gsjgj=1
if %rsjgj% lss 1 set rsjgj=1
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓                                  战斗中                                  ▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo                                   回合数：%hh%                          
echo.
echo                      名称：%gmc%          气血：%rhp%/%rhpsx%            
echo.
echo                      气血：%ghp%              法力：%rmp%/%rmpsx%  
echo.
echo                      攻击：%ggj%      V S     攻击：%rgj%
echo.
echo                      防御：%gfy%              防御：%rfy%
echo.
echo                      A.攻击  Q.技能  E.道具  G.逃跑     
echo.
echo 请输入：
set /p you=
if %you%==a goto gj
if %you%==q goto fs
if %you%==e goto dj
if %you%==g goto tp
echo 输入错误！请重新输入！
pause
goto zd
:gj
set /a ghp=%ghp%-%rsjgj%
set /a rhp=%rhp%-%gsjgj%
echo.
echo 你攻击%gmc%，对其造成了%rsjgj%点伤害。
ping/n 2 127.1>nul
echo.
echo %gmc%攻击你，对你造成了%gsjgj%点伤害。 
ping/n 2 127.1>nul
if %ghp% lss 1 goto win
if %rhp% lss 1 goto lose
set /a hh=%hh%+1
goto zd
set
:dj
echo.
echo 1.生命补液  恢复气血400点  剩余数量：%jcy%
echo.
echo 2.魔力丸    恢复法力100点  剩余数量：%xhy%
echo.
echo 0.返回
echo.
echo 请输入：
set /p you=
if %you%==1 goto cjcy
if %you%==2 goto cxhy
if %you%==0 goto zd
echo 输入错误！请重新输入！
pause
goto dj
:cjcy
if %jcy% geq 1 goto cjcycg
echo.
echo 剩余数量为0，使用失败！
pause
goto dj
:cjcycg
set /a jcy=%jcy%-1
set /a rhp=%rhp%+400
if %rhp% gtr %rhpsx% set /a rhp=%rhpsx%
echo.
echo 使用成功，你的气血恢复了！
ping/n 2 127.1>nul
echo.
echo %gmc%攻击你，对你造成了%gsjgj%点伤害。 
ping/n 2 127.1>nul
if %rhp% lss 1 goto lose
set /a hh=%hh%+1
goto zd
:cxhy
if %xhy% geq 1 goto cjcycg
echo.
echo 剩余数量为0，使用失败！
pause
goto dj
:cjcycg
set /a xhy=%xhy%-1
set /a rmp=%rmp%+400
if %rmp% gtr %rmpsx% set /a rhp=%rhpsx%
echo.
echo 使用成功，你的法力恢复了！
ping/n 2 127.1>nul
echo.
echo %gmc%攻击你，对你造成了%gsjgj%点伤害。 
ping/n 2 127.1>nul
if %rhp% lss 1 goto lose
set /a hh=%hh%+1
goto zd
:fs
echo.
echo 1. 重击   对对方造成20点固定伤害  消耗：20法力
echo.
echo 2.%jnl1%     
echo.
echo 3.返回
echo.
echo 请输入：
set /p you=
if %you%==1 goto ndxs
if %you%==2 goto %jnl01%
if %you%==3 goto zd
echo 输入错误！请重新输入！
pause
goto fs
:ndxs
if %rmp% geq 20 goto ndxscg
echo.
echo 法力不足，技能使用失败！
pause
goto fs
:ndxscg
set /a rmp=%rmp%-20
set /a ghp=%ghp%-20
set /a rhp=%rhp%-%gsjgj%
echo.
echo 你攻击%gmc%，对其造成了20点固定伤害。
ping/n 2 127.1>nul
echo.
echo %gmc%攻击你，对你造成了%gsjgj%点伤害。 
ping/n 2 127.1>nul
if %ghp% lss 1 goto win
if %rhp% lss 1 goto lose
set /a hh=%hh%+1
goto zd
:空技能栏
echo 技能栏空，请重新输入！
pause
goto fs
: 疯狂杀戳
set /a rmp=0
set /a ghp=%ghp%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%-%rsjgj%
set /a rhp=%rhp%-%gsjgj%
echo.
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo 你攻击%gmc%，对其造成了%rsjgj%点固定伤害。
ping/n 2 127.1>nul
echo.
echo %gmc%攻击你，对你造成了%gsjgj%点伤害。 
ping/n 2 127.1>nul
if %ghp% lss 1 goto win
if %rhp% lss 1 goto lose
set /a hh=%hh%+1
goto zd
:tp
set /a jshu=%jshu%+1
set /a sbai=%sbai%+1
goto %fhui%
:win
echo.
echo 你胜利了！
set /a hh=0
set /a jshu=%jshu%+1
set /a sli=%sli%+1
ping/n 2 127.1>nul
echo.
echo 获得:
ping/n 2 127.1>nul
echo.
echo 金币：%jyl%
set /a yl=%yl%+%jyl%
ping/n 2 127.1>nul
echo.
echo 经验：%jexp%
set /a exp=%exp%+%jexp%
ping/n 2 127.1>nul
echo.
echo 按任意键返回
pause>nul
goto %fhui%
:lose
echo.
echo 你失败了！
set /a hh=0
set /a jshu=%jshu%+1
set /a sbai=%sbai%+1
echo.
echo 按任意键返回
pause>nul
set /a rhp=1
goto %fhui%

