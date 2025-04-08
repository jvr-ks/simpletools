@rem compile_keyremapper.bat
@echo off

rem AHK 2

SET appname=keyremapper

keyremapper remove

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon "simpletools.ico" /base "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"




