@rem jarstarter_createexe.bat

@echo off
set "appname=%~1"
if not defined appname exit /b 1

set "exename=%appname:.jar=%"
set "fileIn=%~dp0jarstartertoexeproto.txt"
set "fileOut=%~dp0jarstartertoexe.ahk"

echo appname=[%appname%]
echo exename=[%exename%]
echo fileOut=[%fileOut%]

if exist "%exename%.exe" del /f /q "%exename%.exe" >nul 2>nul

set "ahk2exe=C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
set "base=C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

if exist "%exename%.ico" (
  "%ahk2exe%" /in "%fileOut%" /out "%exename%.exe" /icon "%exename%.ico" /base "%base%"
) else (
  "%ahk2exe%" /in "%fileOut%" /out "%exename%.exe" /base "%base%"
)

if errorlevel 1 (
  echo ERROR: compilation failed.
  exit /b 1
)

del /f /q %~dp0jarstartertoexe.ahk

echo Done.
exit /b 0

:error
echo ERROR: parameter 1 "appname" is missing!
exit /b 1



