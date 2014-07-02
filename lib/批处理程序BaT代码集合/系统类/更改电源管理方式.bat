@echo off
:: =========================================================================================================
:: ChangeHalByRundll.cmd  使用Windows的rundll32命令来更改计算机类型的批处理
:: 用法： ChangeHalByRundll <硬件ID>
:: 　　<硬件ID>是指你想更改成的计算机类型所对应的HardwareID。
:: 例如：你想将计算机改成ACPI Uniprocessor类型，那么使用命令：ChangeHalByRundll ACPIPIC_UP
:: 计算机类型与硬件ID的对应关系如下：
:: 计算机类型            硬件ID(HardwareID)
:: Standard              E_ISA_UP
:: ACPI Uniprocessor     ACPIAPIC_UP
:: ACPI Multiprocessor   ACPIAPIC_MP
:: MPS Uniprocessor      MPS_UP
:: MPS Multiprocessor    MPS_MP
:: Compaq SystemPro      SYSPRO_MP
:: ACPI                  ACPIPIC_UP
:: ========================================================================================================= 


if %1#==# goto _usage
set HardIDs=E_ISA_UP ACPIPIC_UP ACPIAPIC_UP ACPIAPIC_MP MPS_UP MPS_MP SGI_MPS_MP SYSPRO_MP
echo %HardIDs% | find /i "%1" > nul
if errorlevel 1 goto _usage

:_update
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0000" /f
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0001" /f
REG.EXE DELETE "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0000" /f
REG.EXE DELETE "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E966-E325-11CE-BFC1-08002BE10318}\0001" /f
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Enum\Root\ACPI_HAL" /f
REG.EXE DELETE "HKLM\SYSTEM\CurrentControlSet\Enum\Root\PCI_HAL" /f
rundll32.exe setupapi,InstallHinfSection %1_HAL 131 %windir%\inf\hal.inf
cls
echo.
echo 恭喜，计算机类型更改完毕，请重新启动计算机使更改生效，系统会重新扫描硬件！
echo 按任意键退出...
pause >nul
goto _quit

:_usage
cls
echo.
echo 错误：你没有指定计算机类型对应的硬件ID或者你指定的硬件ID不存在。
echo 用法： %0  ^<硬件ID^>
echo.
echo 计算机类型与硬件ID的对应关系如下：
echo.
echo 计算机类型            硬件ID(HardwareID)
echo Standard              E_ISA_UP
echo ACPI Uniprocessor     ACPIAPIC_UP
echo ACPI Multiprocessor   ACPIAPIC_MP
echo MPS Uniprocessor      MPS_UP
echo MPS Multiprocessor    MPS_MP
echo Compaq SystemPro      SYSPRO_MP
echo ACPI                  ACPIPIC_UP
echo.
echo 按任意键退出...
pause>nul
goto _quit

:_quit
set HardIDs=
