@rem compile_getfromclip.bat

@echo off

SET progname=getfromclip

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %progname%.ahk /out %progname%.exe /icon simpletools.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %progname%.ahk /out %progname%32.exe /icon simpletools.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 32-bit.bin"

call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in %progname%.ahk /out %progname%A32.exe /icon simpletools.ico /bin "C:\Program Files\AutoHotkey\Compiler\ANSI 32-bit.bin"

call _virusscan.bat %progname%




