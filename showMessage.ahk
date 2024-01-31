/*
 *********************************************************************************
 * 
 * showMessage.ahk
 * 
 * uses UTF-8
 * 
 * 
 * Copyright (c) 2024 jvr.de. All rights reserved.
 *
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

#Warn
#SingleInstance force

Fileencoding "UTF-8-RAW"

SetTitleMatchMode "2"
DetectHiddenWindows false
SendMode "Input" 

InstallKeybdHook true

;-------------------------------- read cmdline param --------------------------------
hasParams := A_Args.Length
if (hasParams > 0){
  msg := ""
  loop hasParams {
    msg .= A_Args[A_Index] . " "
  }
  msg := trim(msg)
  
  showHintColoredTop(msg, 4000 ,,,,12)
}

exitApp

;---------------------------- showHintColoredTop ----------------------------
showHintColoredTop(s := "", n := 3000, fg := "FFFFFF", bg := "a900ff", newfont := "Segoe UI", newfontsize := "9"){
  global hintColored
  local t
  
  hintColored := Gui("+0x80000000")
  hintColored.SetFont("s" newfontsize " c" fg, newfont)
  
 
  
  hintColored.BackColor := bg
  hintColored.add("Text", , s)
  hintColored.Opt("-Caption")
  hintColored.Opt("+ToolWindow")
  hintColored.Opt("+AlwaysOnTop")
  hintColored.Show("y10 xcenter")
  
  if (n > 0){
    sleep(n)
    hintColored.Destroy()
  }
}
;-----------------------------------------------------------------



