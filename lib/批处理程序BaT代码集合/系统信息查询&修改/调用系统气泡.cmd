@echo off
:: 调用系统气泡，自定义提示信息
:: 调用无所不能的 C#，所以需要 .NET Framework 2.0 以上支持
:: 代码中C:\Windows\System32\acwizard.ico自己换成自己系统里真实存在的 .ico图标，否则程序会崩溃
:: Code by electronixtar 2007-1-15 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26751

set "dnfpath=C:\Windows\Microsoft.NET\Framework"
set "est=DO_NOT_ZT_WITHOUT_PERMISSION"
for /f "delims=" %%v in ('dir /ad /b %dnfpath%\v?.*') do (
         if exist "%dnfpath%\%%v\csc.exe" set "cscpath=%dnfpath%\%%v\csc.exe"
)

< "%~f0" more +17 > "%temp%\estTrayTip.cs"
%cscpath% "/out:%cd%\estTrayTip.exe" "%temp%\estTrayTip.cs"
estTrayTip.exe C:\Windows\System32\acwizard.ico 看什么看 没见过批处理啊？没见过任务栏的汽泡信息啊？见过了吧？见过了顶electronixtar的帖子。 2
:exe的参数解释：estTrayTip.exe 图标路径　标题　内容　提示图标类型Error、Info、None、Warning，这里取2=Info。每个参数都必须正确填写
>nul ping 127.1 -n 1
del estTrayTip.exe

goto:eof

:estTrayTip

using System;
using System.Windows.Forms;
using System.Drawing;

namespace estTrayTip
{
    class Program
    {
        static void Main(string[] args)
        {
            NotifyIcon estIcon = new NotifyIcon();
            estIcon.Icon = new Icon(args[0]);
            estIcon.Visible = true;
            ToolTipIcon estToolTipIcon = new ToolTipIcon();
            switch(args[3])
            {
                case "1": 
                    estToolTipIcon = ToolTipIcon.Error; break;
                case "2":
                    estToolTipIcon = ToolTipIcon.Info; break;
                case "3":
                    estToolTipIcon = ToolTipIcon.None; break;
                case "4":
                    estToolTipIcon = ToolTipIcon.Warning; break;
            }
            estIcon.ShowBalloonTip(1,args[1],args[2],estToolTipIcon);
        }
    }
}
