@rem getfromclipTest.bat

@echo off

cd %~dp0

set command=dir *.ahk

rem copy (without newline character) to the clipboard.
echo | set/p=%command% | clip

rem read the clipboard and run the command 
call getfromclip | %comspec% 


