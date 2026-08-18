@echo off

setlocal
SET SCRIPT_DIR=%~dp0
call %SCRIPT_DIR%\..\..\Tools\Other\SetEnv.bat

@echo on
%stm32programmercli% -c port=SWD mode=UR -ob RDP=0xBB -ob RDP=0xAA WRP1A_STRT=0xFF WRP1A_END=0x0 -ob displ 
pause
endlocal
