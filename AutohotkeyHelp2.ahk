/*
 *********************************************************************************
 * 
 * AutohotkeyHelp2.ahk
 * 
 * Version: no versioning
 * 
 * Copyright (c) 2024 jvr.de. All rights reserved.
 *
 * Fileencodings: "AutohotkeyHelp2.ahk" UTF-8-BOM
 *
 *********************************************************************************
*/
/*
 *********************************************************************************
 * 
 * GNU GENERAL PUBLIC LICENSE
 * 
 * A copy is included in the file "license.txt"
 *
  *********************************************************************************
*/


#Requires AutoHotkey v2

; From https://www.autohotkey.com/docs/v2/scripts/
; Context Sensitive Help in Any Editor (based on the v1 script by Rajat)
; https://www.autohotkey.com
; This script makes (Ctrl+2) (or another hotkey of your choice) F4 (-> AHK 2) and Shift F4 (-> AHK 1) show the help file
; page for the selected AutoHotkey function or keyword. If nothing is selected,
; the function name will be extracted from the beginning of the current line.

; The hotkey below uses the clipboard to provide compatibility with the maximum
; number of editors (since ControlGet doesn't work with most advanced editors).
; It restores the original clipboard contents afterward, but as plain text,
; which seems better than nothing.

; There is a version running as a companion to Codetester also!
; but AutohotkeyHelp2 is removed from memory then, if Codetester is closed!

#Warn
#SingleInstance

hasParams := A_Args.Length

if (hasParams != 0){
  Loop hasParams
  {
    if(A_Args[A_index] = "remove"){
      exitApp
    }
  }
}

ahkHelpGui := Gui("-Sysmenu +MinimizeBox", "ContextSensitiveHelp2")
;ahkHelpGui.Add("Edit", "x2 y2 r0 w320 h240 ", "") ; Focus dummy
t := "ContextSensitiveHelp2 started running in the background,"
. "`n`nPlease mark a keyword and press F4 (or +F4 if using AHK 1),"
. "`n`nPress Ctrl and F4 to remove ContextSensitiveHelp2 from memory!"

ahkHelpGuiText := ahkHelpGui.Add("Text","x10 y10", t)
ahkHelpGui.show("Center autosize")
settimer () => ahkHelpGui.Hide(), -10000

ahkHelpGui.onEvent("Close", ahkHelpGui_close)

hotkey("F4", ahkHelpAction.Bind("2"), "On")
hotkey("+F4", ahkHelpAction.Bind("1"), "On")
hotkey("^F4", exitAction, "On")

return

;------------------------------- ahkHelpGui_close -------------------------------
ahkHelpGui_close(*){
  exitAction()
}
;--------------------------------- ahkHelpAction ---------------------------------
ahkHelpAction(selectAHK,*) {
  local title, ahk_dir, tokenSelected, clipboardSave
  
  SetWinDelay 10
  SetKeyDelay 0

  title := ""
  ahk_dir := ""
  tokenSelected := ""
  clipboardSave := ""
  
  clipboardSave := A_Clipboard
  A_Clipboard := ""
  ; Use the highlighted word if there is one (since sometimes the user might
  ; intentionally highlight something that isn't a function):
  
  Send "^c"
  if !ClipWait(0.1) {
    if (tokenSelected = ""){ ; word was not marked, mark a word (or the whole line)
      Send "{LButton 2}"
      Send "^c"
      if !ClipWait(0.2) {
          A_Clipboard := clipboardSave
          return
      }
    }
  }
  tokenSelected := Trim(A_Clipboard)
  if (tokenSelected = "")
    return
  
  if (WinExist("AutoHotkey v2 Help"))
    WinClose("AutoHotkey v2 Help")
    
  if (WinExist("AutoHotkey Help"))
    WinClose("AutoHotkey Help")
  
  A_Clipboard := clipboardSave
  Loop Parse, tokenSelected, "`s" {
      tokenSelected := A_LoopField
      break ; i.e. we only need one interation.
  }
  
  if (selectAHK = 1){
    ahk_dir := A_ProgramFiles "\AutoHotkey"
    title := "AutoHotkey Help"
  }
  if (selectAHK = 2){
    ahk_dir := A_ProgramFiles "\AutoHotkey\v2"
    title := "AutoHotkey v2 Help"
  }
    
  if !WinExist(title) {
    Run ahk_dir "\AutoHotkey.chm"
    WinWait(title)
  }
  WinActivate(title)
  WinWaitActive(title,,10)
  tokenSelected := StrReplace(tokenSelected, "#", "{#}")
  Send "!n{home}+{end}" tokenSelected "{enter}"
}
;-------------------------------- exitAction --------------------------------
exitAction(*){
  global 
  
  ahkHelpGuiText.Value := "Closing ContextSensitiveHelp2, have a nice day!`n`nBy by ..."
  ahkHelpGui.show("Center autosize")
  sleep 3000
  exitApp
}
;----------------------------------------------------------------------------




