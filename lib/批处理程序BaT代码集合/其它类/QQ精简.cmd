@echo off
:: 来源于网络
if exist 精简版 do goto menu
md 精简版
set succeed=目前已经选择成功的有：

:menu
cls
@echo.
@echo          QQ 精简保留组件选择菜单
@echo     *********************************
@echo     *    1--【QQ基本组件】          *
@echo     *    2--【QQ安全中心】          *
@echo     *    3--【QQ远程协助】          *
@echo     *    4--【QQ音频视频】          *
@echo     *    5--【QQ原版声音】          *
@echo     *    6--【QQ硬盘+群共享】       *
@echo     *    7--【QQ秀+自定义头像】     *
@echo     *    8--【QQ自定义面板】　　    *
@echo     *    9--【QQ宠物】              *
@echo     *    0--【QQ短信】              *
@echo     *    a--【QQ升级】              *
@echo     *    b--【QQ库文件】　　        *
@echo     *    x--【退出菜单】            *
@echo     *********************************
@echo     本精简方案适用于QQ2006所有版本
@echo.
@echo     %succeed%
@echo.
@echo     请根据各自所需选择前面相应的按键
@echo.
@set /p choice=
if {%choice%}=={1} goto Lite1 else (
if {%choice%}=={2} goto Lite2 else (
if {%choice%}=={3} goto Lite3 else (
if {%choice%}=={4} goto Lite4 else (
if {%choice%}=={5} goto Lite5 else (
if {%choice%}=={6} goto Lite6 else (
if {%choice%}=={7} goto Lite7 else (
if {%choice%}=={8} goto Lite8 else (
if {%choice%}=={9} goto Lite9 else (
if {%choice%}=={0} goto Lite0 else (
if {%choice%}=={a} goto LiteA else (
if {%choice%}=={b} goto LiteB else (
goto LiteX


:Lite1
set succeed=%succeed%【QQ基本组件】
REM 精简版保留的文件夹
move Face 精简版
move NEWFACE 精简版
move NewSkins 精简版
md 精简版\Dat
move Dat\Find.gif 精简版\Dat
move Dat\GroupLayer.xml 精简版\Dat
move Dat\RsItemBot.gif 精简版\Dat
move Dat\SXingBmp.gif 精简版\Dat
move Dat\Tipbackground.bmp 精简版\Dat
move Dat\TipbackgroundBig.bmp 精简版\Dat
md 精简版\SkinBmp
move SkinBmp\button1.bmp 精简版\SkinBmp
move SkinBmp\button2.bmp 精简版\SkinBmp
move SkinBmp\button3.bmp 精简版\SkinBmp
move SkinBmp\button4.bmp 精简版\SkinBmp
REM 登录必需组件
move QQ.exe 精简版
move QQBaseClassInDll.dll 精简版
move QQHelperDll.dll 精简版
move BasicCtrlDll.dll 精简版
move QQInfo.Dat 精简版
move LoginCtrl.dll 精简版
move npkcntc.dll 精简版
move npkpdb.dll 精简版
move QQMainFrame.dll 精简版
move QQRes.dll 精简版
move WizardCtrl.dll 精简版
move NewSkin.dll 精简版
move vbscript.dll 精简版
REM 加载好友列表
move CQQApplication.dll 精简版
REM 加载群组列表
move QQGroupMng.dll 精简版
move GroupLive.dll 精简版
move HostingMgr.dll 精简版
move default.Dat 精简版
move QQSpace.dll 精简版
REM 加载设置菜单及好友消息管理器
move QQConfigPlugin.dll 精简版
move QQMsgFriXMng.dll 精简版
move QQSettingCtrl.dll 精简版
move QQSysMsgMng.dll 精简版
move QQZip.dll 精简版
move SCCore.dll 精简版
REM 查看好友详细资料
move QQAddr.dll 精简版
move QQPlugin.dll 精简版
REM 加载文字聊天
move CameraDll.dll 精简版
move QQAllInOne.dll 精简版
move QQCustomFace.dll 精简版
move SCCore.dll 精简版
REM 文件传送
move QQFileTransfer.dll 精简版
move LongConnection.dll 精简版
move GroupConnection.dll 精简版
REM 加载动态表情
move ImageOle.dll 精简版
move QQZip.dll 精简版
REM 邮件提示
move MailSummary.dll 精简版
cls
goto menu

:Lite2
set succeed=%succeed%【QQ安全中心】
move npkcrypt.sys 精简版
move npkcrypt.vxd 精简版
move npkcusb.sys 精简版
cls
goto menu

:Lite3
set succeed=%succeed%【远程协助】
move DShared.dll 精简版
move LongConnection.dll 精简版
move InPlus.dll 精简版
move tencent-proto2.dll 精简版
move tencent-proto1.dll 精简版
move tencent-comlib.dll 精简版
move VqqAllInOne.dll 精简版
cls
goto menu

:Lite4
set succeed=%succeed%【QQ音频视频】
REM 【音频】
move audioengine.dll 精简版
move GIPSVoiceEngineDLL.dll 精简版
move LongConnection.dll 精简版
move tencent-comlib.dll 精简版
move tencent-proto1.dll 精简版
move tencent-proto2.dll 精简版
move VqqAllInOne.dll 精简版
move VqqModule.dll 精简版
move vqqset.dll 精简版
REM 【视频】除了上述音频组件外再添加
move ACodec.dll 精简版
move AudioDevice.dll 精简版
move InPlus.dll 精简版
move VCodec.dll 精简版
move VideoDevice.dll 精简版
move vphone.dll 精简版
cls
goto menu

:Lite5
set succeed=%succeed%【QQ原版声音】
move SOUND 精简版
cls
goto menu

:Lite6
set succeed=%succeed%【QQ硬盘+群共享】
move QQNetDisk.dll 精简版
move QQGroupDisk.dll 精简版
cls
goto menu

:Lite7
set succeed=%succeed%【QQ秀+QQ自定义头像】
REM 【QQ秀】
move QQAvatar.dll 精简版
move Dat\default_av_boy.gif 精简版\Dat
move Dat\default_av_boy_largess.gif 精简版\Dat
move Dat\default_av_girl.gif 精简版\Dat
move Dat\default_av_girl_largess.gif 精简版\Dat
REM 【QQ自定义头像】
move UserDefinedHead.dll 精简版
cls
goto menu

:Lite8
set succeed=%succeed%【QQ自定义面板】
move ContentTab.dll 精简版
move Content_Config.ini 精简版
cls
goto menu

:Lite9
set succeed=%succeed%【QQ宠物】
md 精简版\QQPet
move QQPet.dll 精简版
move QQPet\QQPet.exe 精简版\QQPet
move QQPet\GdiPlus.dll 精简版\QQPet
move QQPet\QQPetCommunity.dll 精简版\QQPet
move QQPet\QQPetResDownload.dll 精简版\QQPet
cls
goto menu

:Lite0
set succeed=%succeed%【QQ短信】
move QQMMSXer.dll 精简版
move Dat\SmsMsgFail.gif 精简版\Dat
move Dat\SmsMsgSXing.gif 精简版\Dat
move Dat\SmsMsgSuccess.gif 精简版\Dat
cls
goto menu

:LiteA
set succeed=%succeed%【QQ升级】
move QQLiveUpdate.exe 精简版
cls
goto menu

:LiteB
set succeed=%succeed%【QQ库文件】
move GdiPlus.dll 精简版
move InPlus.dll 精简版
move Mfc42.dll 精简版
move QQAPI.dll 精简版
move riched20.dll 精简版
move Riched32.dll 精简版
cls
goto menu

:LiteX
cls
@echo.
@echo.
@echo     您已完成 QQ 精简保留组件选择 所有操作，请进入子文件夹 【精简版】 中查看！
@echo.
@echo     是否需要删除此精简批处理文件，删除请输入 y 保留请输入 n 然后回车退出本程序
@echo.
@set /p del=【Yes/No】
if {%del%}=={y} goto DEL
if {%del%}=={n} goto NODEL

:DEL
del %0

:NODEL
