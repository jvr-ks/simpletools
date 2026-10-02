@rem compile_jarstarter2.bat

@echo off

SET appname=jarstarter

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon "simpletools.ico" /base "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

if [%2]==upx call upx --best %appname%.exe

timeout /T 4

echo %appname% compiled!
