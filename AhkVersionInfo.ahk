; AhkVersionInfo.ahk

#SingleInstance
#Warn

#Requires AutoHotkey v2

clipSaved := ClipboardAll()

s := "Installed versions: `n`n"

A_Clipboard := "Unknown!"

RunWait A_ComSpec " /c AhkVersionInfoHelper.ahk",, "Hide"

sleep 2000

s .= "AHK 1: " A_Clipboard "`n"

s .= "AHK 2: " A_AhkVersion

msgbox s, "Autohotkey version info"

A_Clipboard := ClipSaved 
ClipSaved := ""

exitApp


