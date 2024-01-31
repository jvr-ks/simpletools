/*
 *********************************************************************************
 * 
 * hotkeyConverter2.ahk
 * 
 * uses UTF-8
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

textBackIn := ""
textBackOut := ""


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
  buttonConvertHotkeycodetoKeys.OnEvent("Click", codeToText)
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
;-------------------------------- pressHotkey --------------------------------
codeToText(*) {
  global textBackIn, textBackOut
  
  oSaved := hcGui.Submit("0")
  
  theText := ""
  toParse := textBackIn.Value
  ; ¡	¢	£	¤	¥	¦	§	¨	©	ª	«	¬	­	®

  c := 0x00A1 ; INVERTED EXCLAMATION MARK
  toParse := RegExReplace(toParse, "i)F12",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F11",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F10",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F9",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F8",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F7",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F6",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F5",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F4",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F3",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F2",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)F1",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)Home",Chr(c),&rest,1,1) ; 0x00AD
  c += 1
  toParse := RegExReplace(toParse, "i)End",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)PgUp",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)PgDn",Chr(c),&rest,1,1) ; 0x00B0
  c += 1
  toParse := RegExReplace(toParse, "i)Pause",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)CapsLock",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)Up",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)Down",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)Left",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)Right",Chr(c),&rest,1,1)
  c += 1
  toParse := RegExReplace(toParse, "i)Pause",Chr(c),&rest,1,1) ; 0x00B7



  Loop Parse, toParse, "", "`n`r"
  {
    switch A_LoopField
    {
      case "+": 
        theText .= "[SHIFT]" . " + "
        
      case "^": 
        theText .= "[CTRL]" . " + "
        
      case "!": 
        theText .= "[ALT]" . " + "
        
      case "#": 
        theText .= "[WIN]" . " + "
        
      case " ": 
        theText .= " "
      
      case Chr(0x00A1): 
        theText .= "[F12]" . " + "
        
      case Chr(0x00A2): 
        theText .= "[F11]" . " + "
        
      case Chr(0x00A3): 
        theText .= "[F10]" . " + "
        
      case Chr(0x00A4): 
        theText .= "[F9]" . " + "

      case Chr(0x00A5): 
        theText .= "[F8]" . " + " 

      case Chr(0x00A6): 
        theText .= "[F7]" . " + " 

      case Chr(0x00A7): 
        theText .= "[F6]" . " + "        
        
      case Chr(0x00A8): 
        theText .= "[F5]" . " + "    
        
      case Chr(0x00A9): 
        theText .= "[F4]" . " + "  
        
      case Chr(0x00AA): 
        theText .= "[F3]" . " + "        
        
      case Chr(0x00AB): 
        theText .= "[F2]" . " + "        
        
      case Chr(0x00AC): 
        theText .= "[F1]" . " + "
        
      case Chr(0x00AC): 
        theText .= "[F1]" . " + "

      case Chr(0x00AD): 
        theText .= "[Home]" . " + "

      case Chr(0x00AE): 
        theText .= "[End]" . " + "

      case Chr(0x00AF): 
        theText .= "[PgUp]" . " + "

      case Chr(0x00B0): 
        theText .= "[PgDn]" . " + "

      case Chr(0x00B1): 
        theText .= "[Pause]" . " + "

      case Chr(0x00B2): 
        theText .= "[CapsLock]" . " + "

      case Chr(0x00B3): 
        theText .= "[Up]" . " + "

      case Chr(0x00B4): 
        theText .= "[Down]" . " + "

      case Chr(0x00B5): 
        theText .= "[Left]" . " + "

      case Chr(0x00B6): 
        theText .= "[Right]" . " + "
        
      case Chr(0x00B7): 
        theText .= "[Pause]" . " + "


      
      default:
        theText .= "[" . A_LoopField . "]"
    }
  }
  ; StringCaseSense, Off
  ;theText := SubStr(theText, 1, -3)
  textBackOut.Value := theText
  
  textBackOut.Focus()
  ControlSend "^c" , textBackOut
  ControlSend "^{Home}" , textBackOut

  return
}

