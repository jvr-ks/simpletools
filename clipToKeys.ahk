; clipToKeys.ahk
; v 1.001


#Requires AutoHotkey >=2.0
#SingleInstance

appVersion := "1.001"
ClipboardDataType := 0

/*
ClipboardDataType:
0 = Clipboard is now empty.
1 = Clipboard contains something that can be expressed as text (this includes files copied from an Explorer window).
2 = Clipboard contains something entirely non-text such as a picture.
*/

Loop A_Args.Length {
  if(A_Args[A_index] == "remove"){
    exitTheApp()
  }
}

CoordMode "ToolTip", "Screen"
OnClipboardChange ClipChanged, 1

showTip("ClipToKeys v " appVersion " started,`nusing Shift + Right-Mouseclick!`n(To stop it, please press Shift + Escape)", 5000)

;-------------------------------- $+RBUTTON:: --------------------------------
$+RBUTTON::
{
  global ClipboardDataType
  
  switch ClipboardDataType {
    case 0:
      showTip("clipToKeys warning:`nClipboard contains no data!")
    case 1:
      contents := A_Clipboard
      SetKeyDelay 5, 2
      SendText contents
    case 2:
      showTip("clipToKeys ERROR:`nClipboard contains not text but other data!", 4000)
    Default:
      showTip("clipToKeys ERROR:`nClipboard contains not text but other data!", 4000)
  }
}
;---------------------------------- +ESC:: ----------------------------------
+ESC:: 
{
  exitTheApp()
}
;-------------------------------- ClipChanged --------------------------------
ClipChanged(DataType) {
  global ClipboardDataType
  
  ClipboardDataType := DataType
}

;---------------------------------- showTip ----------------------------------
showTip(msg, removeTimer := 3000, xInc := 40, yInc := -80){

  MouseGetPos &xActuPos, &yActuPos
  ToolTip(msg, xActuPos + xInc, yActuPos + yInc)
  SetTimer removeTip, removeTimer
}
;--------------------------------- removeTip ---------------------------------
removeTip(){
  ToolTip
}
;-------------------------------- exitTheApp --------------------------------
exitTheApp(){

  showTip("Closing ClipToKeys, by by!")
  OnClipboardChange ClipChanged, 0
  sleep 4000
  exitApp
}
;----------------------------------------------------------------------------

