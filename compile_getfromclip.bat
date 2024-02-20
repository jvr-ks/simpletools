@rem compile_getfromclip.bat

@echo off

SET appname=getfromclip

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %appname%.ahk /out %appname%.exe /icon simpletools.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"

upx --best %appname%.exe






