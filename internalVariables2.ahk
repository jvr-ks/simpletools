; internalvariables2.ahk
; https://www.autohotkey.com/docs/v2/Variables.htm#BuiltIn
; C:\___x2_wrk\_autohotkey\simpletools\internalvariables2.ahk

/*
 *********************************************************************************
 * 
 * GNU GENERAL PUBLIC LICENSE
 * 
 * A copy is included in the file "license.txt"
 *
  *********************************************************************************
*/
; UNDER CONSTRUCTION!

; AHK 2
#Requires AutoHotkey v2+

guiMain := gui("+Resize","AHK 2 builtin variables")

borderX := 30
borderY := 80

w := 1024 - borderX
h := 768 - borderY

lvParam := " w" w " h" h " Grid"

guiMain.AddText(, "Double-click an entry to open the online-docs!")
LV := guiMain.AddListView(lvParam, ["No. ","Name","Value"])

index := 1
LV.Add(, Format("{:03}", index), "", "---------------------------- Special Characters ----------------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_Tab", "A single tab character")
index += 1
LV.Add(, Format("{:03}", index), "A_Space", "A single space character")

;
index += 1
LV.Add(, Format("{:03}", index), "", "----------------------------- Script Properties -----------------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_Args", "Command line parameters")
index += 1
LV.Add(, Format("{:03}", index), "A_WorkingDir", A_WorkingDir)
index += 1
LV.Add(, Format("{:03}", index), "A_InitialWorkingDir", A_InitialWorkingDir)
index += 1
LV.Add(, Format("{:03}", index), "A_ScriptDir", A_ScriptDir)
index += 1
LV.Add(, Format("{:03}", index), "A_ScriptName", A_ScriptName)
index += 1
LV.Add(, Format("{:03}", index), "A_ScriptFullPath", A_ScriptFullPath)
index += 1
LV.Add(, Format("{:03}", index), "A_ScriptHwnd", A_ScriptHwnd)
index += 1
LV.Add(, Format("{:03}", index), "A_LineNumber", A_LineNumber)
index += 1
LV.Add(, Format("{:03}", index), "A_LineFile", A_LineFile)
index += 1
LV.Add(, Format("{:03}", index), "A_ThisFunc", A_ThisFunc)
index += 1
LV.Add(, Format("{:03}", index), "A_AhkVersion",A_AhkVersion )
index += 1
LV.Add(, Format("{:03}", index), "A_AhkPath", A_AhkPath)
index += 1
LV.Add(, Format("{:03}", index), "A_IsCompiled", A_IsCompiled)


index += 1
LV.Add(, Format("{:03}", index), "", "------------------------------- Date and Time -------------------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_YYYY", A_YYYY)
; use formattime instead
index += 1
LV.Add(, Format("{:03}", index), "FormatTime(, `"LongDate`")", FormatTime(, "LongDate"))

index += 1
LV.Add(, Format("{:03}", index), "A_Now", A_Now)
index += 1
LV.Add(, Format("{:03}", index), "A_NowUTC", A_NowUTC)
index += 1
LV.Add(, Format("{:03}", index), "A_TickCount", A_TickCount)


index += 1
LV.Add(, Format("{:03}", index), "", "------------------------------ Script Settings ------------------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_IsSuspended", A_IsSuspended)
index += 1
LV.Add(, Format("{:03}", index), "A_IsPaused", A_IsPaused)

index += 1
LV.Add(, Format("{:03}", index), "A_IsCritical", A_IsCritical)
index += 1
LV.Add(, Format("{:03}", index), "A_TitleMatchMode", A_TitleMatchMode)
index += 1
LV.Add(, Format("{:03}", index), "A_TitleMatchModeSpeed", A_TitleMatchModeSpeed)
index += 1
LV.Add(, Format("{:03}", index), "A_DetectHiddenWindows", A_DetectHiddenWindows)
index += 1
LV.Add(, Format("{:03}", index), "A_DetectHiddenText", A_DetectHiddenText)
index += 1
LV.Add(, Format("{:03}", index), "A_FileEncoding", A_FileEncoding)
index += 1
LV.Add(, Format("{:03}", index), "DllCall(`"GetACP`")", DllCall("GetACP"))
index += 1
LV.Add(, Format("{:03}", index), "A_SendMode", A_SendMode)
index += 1
LV.Add(, Format("{:03}", index), "A_SendLevel", A_SendLevel)
index += 1
LV.Add(, Format("{:03}", index), "A_StoreCapsLockMode", A_StoreCapsLockMode)
index += 1
LV.Add(, Format("{:03}", index), "A_KeyDelay", A_KeyDelay)
index += 1
LV.Add(, Format("{:03}", index), "A_KeyDuration", A_KeyDuration)
index += 1
LV.Add(, Format("{:03}", index), "A_KeyDelayPlay", A_KeyDelayPlay)
index += 1
LV.Add(, Format("{:03}", index), "A_KeyDurationPlay", A_KeyDurationPlay)
index += 1
LV.Add(, Format("{:03}", index), "A_WinDelay", A_WinDelay)
index += 1
LV.Add(, Format("{:03}", index), "A_ControlDelay", A_ControlDelay)
index += 1
LV.Add(, Format("{:03}", index), "A_MenuMaskKey", A_MenuMaskKey)
index += 1
LV.Add(, Format("{:03}", index), "A_MouseDelay", A_MouseDelay)
index += 1
LV.Add(, Format("{:03}", index), "A_MouseDelayPlay", A_MouseDelayPlay)
index += 1
LV.Add(, Format("{:03}", index), "A_DefaultMouseSpeed", A_DefaultMouseSpeed)
index += 1
LV.Add(, Format("{:03}", index), "A_CoordModeToolTip", A_CoordModeToolTip)
index += 1
LV.Add(, Format("{:03}", index), "A_CoordModePixel", A_CoordModePixel)
index += 1
LV.Add(, Format("{:03}", index), "A_CoordModeMouse", A_CoordModeMouse)
index += 1
LV.Add(, Format("{:03}", index), "A_CoordModeCaret", A_CoordModeCaret)
index += 1
LV.Add(, Format("{:03}", index), "A_CoordModeMenu", A_CoordModeMenu)
index += 1
LV.Add(, Format("{:03}", index), "A_RegView", A_RegView)
index += 1
LV.Add(, Format("{:03}", index), "A_TrayMenu", A_TrayMenu)
index += 1
LV.Add(, Format("{:03}", index), "A_AllowMainWindow", A_AllowMainWindow)
index += 1
LV.Add(, Format("{:03}", index), "A_IconHidden", A_IconHidden)
index += 1
LV.Add(, Format("{:03}", index), "A_IconTip", A_IconTip)
index += 1
LV.Add(, Format("{:03}", index), "A_IconFile", A_IconFile)
index += 1
LV.Add(, Format("{:03}", index), "A_IconNumber", A_IconNumber)

index += 1
LV.Add(, Format("{:03}", index), "", "------------------------------ User Idle Time ------------------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_TimeIdle", A_TimeIdle)
index += 1
LV.Add(, Format("{:03}", index), "A_TimeIdlePhysical", A_TimeIdlePhysical)
index += 1
LV.Add(, Format("{:03}", index), "A_TimeIdleKeyboard", A_TimeIdleKeyboard)
index += 1
LV.Add(, Format("{:03}", index), "A_TimeIdleMouse", A_TimeIdleMouse)

index += 1
LV.Add(, Format("{:03}", index), "", "---------------- Hotkeys, Hotstrings, and Custom Menu Items ----------------")
index += 1
LV.Add(, Format("{:03}", index), "A_ThisHotkey", A_ThisHotkey)
index += 1
LV.Add(, Format("{:03}", index), "A_PriorHotkey", A_PriorHotkey)
index += 1
LV.Add(, Format("{:03}", index), "A_TimeSinceThisHotkey", A_TimeSinceThisHotkey)
index += 1
LV.Add(, Format("{:03}", index), "A_TimeSincePriorHotkey", A_TimeSincePriorHotkey)
index += 1
LV.Add(, Format("{:03}", index), "A_EndChar", A_EndChar)
index += 1
LV.Add(, Format("{:03}", index), "A_MaxHotkeysPerInterval", A_MaxHotkeysPerInterval)
index += 1
LV.Add(, Format("{:03}", index), "A_HotkeyInterval", A_HotkeyInterval)
index += 1
LV.Add(, Format("{:03}", index), "A_HotkeyModifierTimeout", A_HotkeyModifierTimeout)

index += 1
LV.Add(, Format("{:03}", index), "", "---------------------- Operating System and User Info ----------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_ComSpec", A_ComSpec)
index += 1
LV.Add(, Format("{:03}", index), "A_Temp", A_Temp)
index += 1
LV.Add(, Format("{:03}", index), "A_OSVersion", A_OSVersion)
index += 1
LV.Add(, Format("{:03}", index), "A_Is64bitOS", A_Is64bitOS)
index += 1
LV.Add(, Format("{:03}", index), "A_PtrSize", A_PtrSize)
index += 1
LV.Add(, Format("{:03}", index), "A_Language", A_Language)
index += 1
LV.Add(, Format("{:03}", index), "Languages", "Open Languages list (misc.)")
index += 1
LV.Add(, Format("{:03}", index), "A_ComputerName", A_ComputerName)
index += 1
LV.Add(, Format("{:03}", index), "A_UserName", A_UserName)
index += 1
LV.Add(, Format("{:03}", index), "A_WinDir", A_WinDir)
index += 1
LV.Add(, Format("{:03}", index), "A_ProgramFiles", A_ProgramFiles)
index += 1
LV.Add(, Format("{:03}", index), "A_AppData", A_AppData)
index += 1
LV.Add(, Format("{:03}", index), "A_AppDataCommon", A_AppDataCommon)
index += 1
LV.Add(, Format("{:03}", index), "A_Desktop", A_Desktop)
index += 1
LV.Add(, Format("{:03}", index), "A_DesktopCommon", A_DesktopCommon)
index += 1
LV.Add(, Format("{:03}", index), "A_StartMenu", A_StartMenu)
index += 1
LV.Add(, Format("{:03}", index), "A_StartMenuCommon", A_StartMenuCommon)
index += 1
LV.Add(, Format("{:03}", index), "A_Programs", A_Programs)
index += 1
LV.Add(, Format("{:03}", index), "A_ProgramsCommon", A_ProgramsCommon)
index += 1
LV.Add(, Format("{:03}", index), "A_Startup", A_Startup)
index += 1
LV.Add(, Format("{:03}", index), "A_StartupCommon", A_StartupCommon)
index += 1
LV.Add(, Format("{:03}", index), "A_MyDocuments", A_MyDocuments)
index += 1
LV.Add(, Format("{:03}", index), "A_IsAdmin", A_IsAdmin)
index += 1
LV.Add(, Format("{:03}", index), "A_ScreenWidth", A_ScreenWidth)
index += 1
LV.Add(, Format("{:03}", index), "A_ScreenHeight", A_ScreenHeight)
index += 1
LV.Add(, Format("{:03}", index), "A_ScreenDPI", A_ScreenDPI)

index += 1
LV.Add(, Format("{:03}", index), "", "----------------------------------- Misc -----------------------------------")
A_Clipboard := "😀😀😀 Hello world! 😀😀😀"
index += 1
LV.Add(, Format("{:03}", index), "A_Clipboard", A_Clipboard)
index += 1
LV.Add(, Format("{:03}", index), "A_Cursor", A_Cursor)
index += 1
LV.Add(, Format("{:03}", index), "A_EventInfo", A_EventInfo)
index += 1
LV.Add(, Format("{:03}", index), "A_LastError", A_LastError)
index += 1
LV.Add(, Format("{:03}", index), "True", True)
index += 1
LV.Add(, Format("{:03}", index), "False", False)

index += 1
LV.Add(, Format("{:03}", index), "", "----------------------------------- Loop -----------------------------------")
index += 1
LV.Add(, Format("{:03}", index), "A_Index", "Only inside a Loop")
index += 1
LV.Add(, Format("{:03}", index), "A_LoopFileName", "Only inside a Loop")
index += 1
LV.Add(, Format("{:03}", index), "A_LoopRegName", "Only inside a Loop")
index += 1
LV.Add(, Format("{:03}", index), "A_LoopReadLine", "Only inside a Loop")
index += 1
LV.Add(, Format("{:03}", index), "A_LoopField", "Only inside a Loop")
index += 1
LV.Add(, Format("{:03}", index), "------------------------", "----------------------------------------------------------------------------")

LV.OnEvent("DoubleClick", LV_DoubleClick)

guiMain.show("center")

LV.ModifyCol(1,"AutoHdr Integer")
LV.ModifyCol()

guiMain.OnEvent("size", Gui_Size , 1)

guiMain.Maximize()

return

;------------------------------ LV_DoubleClick ------------------------------
LV_DoubleClick(LV, RowNumber){

  builtin := LV.GetText(RowNumber, 1)
  value := LV.GetText(RowNumber, 2)
  if(InStr(value,"(misc.)")){
    run "https://www.autohotkey.com/docs/v2/misc/" . builtin . ".htm"
  } else {
    run "https://www.autohotkey.com/docs/v2/lib/" . builtin . ".htm"
  }
}
;------------------------------ guiMainGuiSize ------------------------------
Gui_Size(guiMain, MinMax, w, h){

   if (A_EventInfo != 1) {
    guiMain.GetPos(&X, &Y, &clientWidth, &clientHeight)

    LV.Move(,, (clientWidth - borderX), (clientHeight - borderY))
  }

  return
}





