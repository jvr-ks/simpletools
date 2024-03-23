@rem compile_translateViaGoogle2.bat

@echo off

rem AHK 2

SET appname=translateViaGoogle2

call %appname%.exe remove

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon "simpletools.ico" /base "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

upx --best %appname%.exe


