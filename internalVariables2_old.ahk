; internalvariables2.ahk
; https://www.autohotkey.com/docs/v2/Variables.htm#BuiltIn
; C:\___x2_wrk\_autohotkey\simpletools\internalvariables2.ahk


; UNDER CONSTRUCTION!

; AHK 2
#Requires AutoHotkey v2+

guiMain := gui("+Resize","AHK 2 builtin variables")

borderX := 30
borderY := 80

rows := round(A_ScreenHeight/50) - 100
rows := 10
width := round(A_ScreenWidth - A_ScreenWidth/30)
w := width - borderX
h := A_ScreenHeight - borderY

lvParam := "r" . rows . " w" . width . " Grid"

guiMain.AddText(, "Double-click an entry to open the online-docs!")
LV := guiMain.AddListView(lvParam, ["Index","Name","Value"])
index := 1

LV.Add(, "", "---------------------------- Special Characters ----------------------------")
LV.Add(, "A_Tab", "A single tab character")
LV.Add(, "A_Space", "A single space character")

;
LV.Add(, "", "----------------------------- Script Properties -----------------------------")
LV.Add(, "A_Args", "Command line parameters")
LV.Add(, "A_WorkingDir", A_WorkingDir)
LV.Add(, "A_InitialWorkingDir", A_InitialWorkingDir)
LV.Add(, "A_ScriptDir", A_ScriptDir)
LV.Add(, "A_ScriptName", A_ScriptName)
LV.Add(, "A_ScriptFullPath", A_ScriptFullPath)
LV.Add(, "A_ScriptHwnd", A_ScriptHwnd)
LV.Add(, "A_LineNumber", A_LineNumber)
LV.Add(, "A_LineFile", A_LineFile)
LV.Add(, "A_ThisFunc", A_ThisFunc)
LV.Add(, "A_AhkVersion",A_AhkVersion )
LV.Add(, "A_AhkPath", A_AhkPath)
LV.Add(, "A_IsCompiled", A_IsCompiled)


LV.Add(, "", "------------------------------- Date and Time -------------------------------")
LV.Add(, "A_YYYY", A_YYYY)
; use formattime instead
LV.Add(, "FormatTime(, `"LongDate`")", FormatTime(, "LongDate"))

LV.Add(, "A_Now", A_Now)
LV.Add(, "A_NowUTC", A_NowUTC)
LV.Add(, "A_TickCount", A_TickCount)


LV.Add(, "", "------------------------------ Script Settings ------------------------------")
LV.Add(, "A_IsSuspended", A_IsSuspended)
LV.Add(, "A_IsPaused", A_IsPaused)

LV.Add(, "A_IsCritical", A_IsCritical)
LV.Add(, "A_TitleMatchMode", A_TitleMatchMode)
LV.Add(, "A_TitleMatchModeSpeed", A_TitleMatchModeSpeed)
LV.Add(, "A_DetectHiddenWindows", A_DetectHiddenWindows)
LV.Add(, "A_DetectHiddenText", A_DetectHiddenText)
LV.Add(, "A_FileEncoding", A_FileEncoding)
LV.Add(, "DllCall(`"GetACP`")", DllCall("GetACP"))
LV.Add(, "A_SendMode", A_SendMode)
LV.Add(, "A_SendLevel", A_SendLevel)
LV.Add(, "A_StoreCapsLockMode", A_StoreCapsLockMode)
LV.Add(, "A_KeyDelay", A_KeyDelay)
LV.Add(, "A_KeyDuration", A_KeyDuration)
LV.Add(, "A_KeyDelayPlay", A_KeyDelayPlay)
LV.Add(, "A_KeyDurationPlay", A_KeyDurationPlay)
LV.Add(, "A_WinDelay", A_WinDelay)
LV.Add(, "A_ControlDelay", A_ControlDelay)
LV.Add(, "A_MenuMaskKey", A_MenuMaskKey)
LV.Add(, "A_MouseDelay", A_MouseDelay)
LV.Add(, "A_MouseDelayPlay", A_MouseDelayPlay)
LV.Add(, "A_DefaultMouseSpeed", A_DefaultMouseSpeed)
LV.Add(, "A_CoordModeToolTip", A_CoordModeToolTip)
LV.Add(, "A_CoordModePixel", A_CoordModePixel)
LV.Add(, "A_CoordModeMouse", A_CoordModeMouse)
LV.Add(, "A_CoordModeCaret", A_CoordModeCaret)
LV.Add(, "A_CoordModeMenu", A_CoordModeMenu)
LV.Add(, "A_RegView", A_RegView)
LV.Add(, "A_TrayMenu", A_TrayMenu)
LV.Add(, "A_AllowMainWindow", A_AllowMainWindow)
LV.Add(, "A_IconHidden", A_IconHidden)
LV.Add(, "A_IconTip", A_IconTip)
LV.Add(, "A_IconFile", A_IconFile)
LV.Add(, "A_IconNumber", A_IconNumber)

LV.Add(, "", "------------------------------ User Idle Time ------------------------------")
LV.Add(, "A_TimeIdle", A_TimeIdle)
LV.Add(, "A_TimeIdlePhysical", A_TimeIdlePhysical)
LV.Add(, "A_TimeIdleKeyboard", A_TimeIdleKeyboard)
LV.Add(, "A_TimeIdleMouse", A_TimeIdleMouse)

LV.Add(, "", "---------------- Hotkeys, Hotstrings, and Custom Menu Items ----------------")
LV.Add(, "A_ThisHotkey", A_ThisHotkey)
LV.Add(, "A_PriorHotkey", A_PriorHotkey)
LV.Add(, "A_TimeSinceThisHotkey", A_TimeSinceThisHotkey)
LV.Add(, "A_TimeSincePriorHotkey", A_TimeSincePriorHotkey)
LV.Add(, "A_EndChar", A_EndChar)
LV.Add(, "A_MaxHotkeysPerInterval", A_MaxHotkeysPerInterval)
LV.Add(, "A_HotkeyInterval", A_HotkeyInterval)
LV.Add(, "A_HotkeyModifierTimeout", A_HotkeyModifierTimeout)

LV.Add(, "", "---------------------- Operating System and User Info ----------------------")
LV.Add(, "A_ComSpec", A_ComSpec)
LV.Add(, "A_Temp", A_Temp)
LV.Add(, "A_OSVersion", A_OSVersion)
LV.Add(, "A_Is64bitOS", A_Is64bitOS)
LV.Add(, "A_PtrSize", A_PtrSize)
LV.Add(, "A_Language", A_Language)
LV.Add(, "Languages", "Open Languages list (misc.)")
LV.Add(, "A_ComputerName", A_ComputerName)
LV.Add(, "A_UserName", A_UserName)
LV.Add(, "A_WinDir", A_WinDir)
LV.Add(, "A_ProgramFiles", A_ProgramFiles)
LV.Add(, "A_AppData", A_AppData)
LV.Add(, "A_AppDataCommon", A_AppDataCommon)
LV.Add(, "A_Desktop", A_Desktop)
LV.Add(, "A_DesktopCommon", A_DesktopCommon)
LV.Add(, "A_StartMenu", A_StartMenu)
LV.Add(, "A_StartMenuCommon", A_StartMenuCommon)
LV.Add(, "A_Programs", A_Programs)
LV.Add(, "A_ProgramsCommon", A_ProgramsCommon)
LV.Add(, "A_Startup", A_Startup)
LV.Add(, "A_StartupCommon", A_StartupCommon)
LV.Add(, "A_MyDocuments", A_MyDocuments)
LV.Add(, "A_IsAdmin", A_IsAdmin)
LV.Add(, "A_ScreenWidth", A_ScreenWidth)
LV.Add(, "A_ScreenHeight", A_ScreenHeight)
LV.Add(, "A_ScreenDPI", A_ScreenDPI)

LV.Add(, "", "----------------------------------- Misc -----------------------------------")
A_Clipboard := "😀😀😀 Hello world! 😀😀😀"
LV.Add(, "A_Clipboard", A_Clipboard)
LV.Add(, "A_Cursor", A_Cursor)
LV.Add(, "A_EventInfo", A_EventInfo)
LV.Add(, "A_LastError", A_LastError)
LV.Add(, "True", True)
LV.Add(, "False", False)

LV.Add(, "", "----------------------------------- Loop -----------------------------------")
LV.Add(, "A_Index", "Only inside a Loop")
LV.Add(, "A_LoopFileName", "Only inside a Loop")
LV.Add(, "A_LoopRegName", "Only inside a Loop")
LV.Add(, "A_LoopReadLine", "Only inside a Loop")
LV.Add(, "A_LoopField", "Only inside a Loop")
LV.Add(, "------------------------", "----------------------------------------------------------------------------")

;LV.ModifyCol()
LV.OnEvent("DoubleClick", LV_DoubleClick)

guiMain.show("center")

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





