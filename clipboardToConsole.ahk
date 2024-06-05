; clipboardToConsole.ahk
#Requires AutoHotkey v2

;@Ahk2Exe-ConsoleApp

STD_OUTPUT_HANDLE := 0xFFFFFFF5     ; -10
ATTACH_PARENT_PROCESS := 0xFFFFFFFF ;  -1

allocated := 0
if (!DllCall("GetStdHandle", "UInt", STD_OUTPUT_HANDLE)) {
    if (!DllCall("AttachConsole", "UInt", ATTACH_PARENT_PROCESS)) {
        DllCall("AllocConsole")
        allocated := 1
    }
}
    
s := A_Clipboard "`n"

FileAppend s, "*"
  
if (allocated)
  DllCall("FreeConsole")

exitApp

