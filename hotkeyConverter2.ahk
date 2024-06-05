/*
 *********************************************************************************
 * 
 * hotkeyConverter2.ahk
 * 
 * uses UTF-8 BOM
 * 
 * Version: no versioning
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

; TODO ESC-key

#Requires Autohotkey v2+

#SingleInstance Force

#Include Lib\codeToText.ahk

textBackIn := ""
textBackOut := ""
useMarkdown := 1

Loop A_Args.Length
{
  if(InStr(A_Args[A_index],"nomd"))
    useMarkdown := 0
}

hotkeyConverter()

;------------------------------ hotkeyConverter ------------------------------
hotkeyConverter(){
  global hcGui, hotkeyName, hotkeyNameText, textBackIn, textBackOut
  
  buttonWidth := 200
  msg1 := "
  (
Not supported: Mouse, Wheel, Space, Tab, Enter, Escape, Backspace, ScrollLock, Delete, Insert, Numpadkeys, PrintScreen, Modifier keys, Gamepad, Joystick etc.
)"
  
  separatorWidth := buttonWidth * 2 + 10
  hcGui := Gui("0x80000", "Hotkey Converter")
  hcGui.add("Text", "x2 y2 w200", "Please press Hotkeys:`n(Text is localized!)")
  hotkeyName := hcGui.add("Hotkey", "x+m yp+0 w" . buttonWidth)
  hcGui.add("Text", "x2 w400", msg1)
  
  buttonPrintHotkey := hcGui.add("Button", "x2 w" . buttonWidth, "Show Hotkeys code")
  buttonPrintHotkey.OnEvent("Click", printHotkey)
  hcGui.add("Text", "x2 r2 w" . buttonWidth, "Hotkey code:`n(is copied to the Clipboard)")
  hotkeyNameText := hcGui.add("Edit", "x+m yp+0 w" . buttonWidth . " Readonly")

  hcGui.add("Text", "x2 w" . separatorWidth . " 0x7 h2")

  hcGui.add("Text", "x2 w" . buttonWidth, "Hotkey code as text:")
  textBackIn := hcGui.add("Edit", "x+m yp+0 w" . buttonWidth)
  buttonConvertHotkeycodetoKeys := hcGui.add("Button", "x2 w" . buttonWidth, "Convert Hotkey code to Keys")
  buttonConvertHotkeycodetoKeys.OnEvent("Click", lSuBcodeToText)
  hcGui.add("Text", "x2 w" . buttonWidth, "Hotkey code as Keys:`n(is copied to the Clipboard)")
  textBackOut := hcGui.add("Edit", "x+m yp+0 w" . buttonWidth)
  hcGui.show("autosize center")
  
  return
}
;-------------------------------- printHotkey --------------------------------
printHotkey(*) {
  global hcGui, hotkeyName, hotkeyNameText
  
  oSaved := hcGui.Submit("0")
  
  For Name , Wert in oSaved.OwnProps()
    msgbox Name , Wert
  
  A_Clipboard := hotkeyName.Value 
  hotkeyNameText.Value := hotkeyName.Value
  
  return
}
;------------------------------ lSuBcodeToText ------------------------------
lSuBcodeToText(*){
  global textBackIn, textBackOut, useMarkdown
  
  oSaved := hcGui.Submit("0")
  
  theText := codeToText(textBackIn.Value, useMarkdown)
  
  textBackOut.Value := theText
  
  textBackOut.Focus()
  ControlSend "^c" , textBackOut
  ControlSend "^{Home}" , textBackOut
}
;----------------------------------------------------------------------------





