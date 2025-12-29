@rem compile_cmdprompt.bat
@echo off

rem AHK 1

SET appname=cmdprompt

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon simpletools.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"

call upx --best %appname%.exe

echo | set /p dummyName="%appname%.exe, " >> _virusscanresults.txt
call python _hidden\_virusscanSimpletools.py %appname% >> _virusscanresults.txt

if not [%1]==bulkVirusScan (
  call virusScanCreateLinks.exe
  call virusScanLinksCopyToReadme.bat

)


copy /y %appname%.ahk C:\___x2_wrk\_autohotkey\___allapps\apps\*.*


