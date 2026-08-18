@echo off

setlocal
SET SCRIPT_DIR=%~dp0
call %SCRIPT_DIR%\..\..\Tools\Other\SetEnv.bat

@echo on
%stm32programmercli% -c port=SWD mode=UR -e all --skipErase -d ..\STM32L476_SimpleApp\Binary\SBSFU_STM32L476_SimpleAppV1.bin 0x08000000
pause
endlocal
