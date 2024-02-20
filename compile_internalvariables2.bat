@rem compile_internalvariables2.bat

@echo off

rem AHK 2

SET appname=internalvariables2

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon "simpletools.ico" /base "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

upx --best %appname%.exe


