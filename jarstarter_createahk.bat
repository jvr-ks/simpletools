@rem jarstarter_createahk.bat

@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "appname=%~1"
if not defined appname exit /b 1

set "exename=%appname:.jar=%"
set "fileIn=jarstartertoexeproto.txt"
set "fileOut=jarstartertoexe.ahk"
set "wordOld=THEAPPNAME"
set "wordNew=%appname%"
set "tmp=%fileOut%.tmp"

rem Replace placeholders in proto file
> "%tmp%" (
  for /f "usebackq delims=" %%L in ("%fileIn%") do (
    set "line=%%L"
    setlocal EnableDelayedExpansion
    echo(!line:%wordOld%=%wordNew%!
    endlocal
  )
)

if not exist "%tmp%" (
  echo ERROR: temp file was not created.
  exit /b 1
)

move /y "%tmp%" "%fileOut%" >nul
if errorlevel 1 (
  echo ERROR: could not move "%tmp%" to "%fileOut%".
  exit /b 1
)

echo jarstartertoexe.ahk created!
exit /b 0

:error
echo ERROR: parameter 1 "appname" is missing!
exit /b 1
