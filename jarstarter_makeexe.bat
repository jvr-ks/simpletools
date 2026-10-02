@rem jarstarter_makeexe.bat
@echo off

@echo off
set "appname=%~1"
if not defined appname exit /b 1

call "jarstarter_createahk.bat" "%appname%"
if errorlevel 1 exit /b 1

call "jarstarter_createexe.bat" "%appname%"
if errorlevel 1 exit /b 1

exit /b 0
