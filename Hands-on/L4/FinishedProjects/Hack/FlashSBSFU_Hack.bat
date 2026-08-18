@echo off

setlocal

SET TOOL_BIN_DIR=c:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin
SET TOOL_NAME=STM32_Programmer_CLI.exe
SET TOOL="%TOOL_BIN_DIR%\%TOOL_NAME%"

@echo on
%TOOL% -c port=SWD mode=UR -e all --skipErase -d Binary\SBSFU_Hack.bin 0x08000000
pause
endlocal
