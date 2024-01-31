@rem compile_cmdprompt.bat
@echo off

rem AHK 1

SET appname=cmdprompt

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon simpletools.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"



