@rem compile_virusScanCreateLinks.bat

@echo off

rem AHK 2

SET appname=virusScanCreateLinks

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon "simpletools.ico" /base "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

call upx --best %appname%.exe

copy /y %appname%.ahk C:\___x2_wrk\_autohotkey\___allapps\apps2\*.*

