@rem compile_AhkVersionInfo.bat

@echo off

rem AHK 2

SET appname=AhkVersionInfo

rem call %appname%.exe remove

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon "simpletools.ico" /base "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

call upx --best %appname%.exe

echo | set /p dummyName="%appname%.exe, " >> _virusscanresults.txt
call python _hidden\_virusscanSimpletools.py %appname% >> _virusscanresults.txt

if not [%1]== bulkVirusScan (
  call virusScanCreateLinks.exe
  call virusScanLinksCopyToReadme.bat
) else (
  timeout /T 15
)
