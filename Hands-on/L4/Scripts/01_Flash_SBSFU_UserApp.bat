@echo off

setlocal
SET SCRIPT_DIR=%~dp0
call %SCRIPT_DIR%\..\..\Tools\Other\SetEnv.bat

@echo on
%stm32programmercli%  -c port=SWD mode=UR -e all --skipErase -d ..\STM32CubeExpansion_SBSFU_V2.4.0\Projects\NUCLEO-L476RG\Applications\2_Images\2_Images_UserApp\Binary\SBSFU_UserApp.bin 0x08000000
pause
endlocal
