set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
::系统环境变量
::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
::用户环境变量
::HKEY_CURRENT_USER\Environment
reg add "%regpath%" /v "<name>" /d "<data>"

:: 将上面的<>内容替成你需要定义的名称和值就可以了