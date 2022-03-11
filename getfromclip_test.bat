@rem getfromclip_test.bat

@echo off

rem put date to the clipboard
echo %date:~0% | clip

rem read content from clipboard (can read only a single line!)

for /f %%i in ('getfromclip') do set VAR=%%i

@echo %VAR%

pause













