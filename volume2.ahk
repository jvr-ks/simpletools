; volume2.ahk

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

#SingleInstance force

;-------------------------------- read cmdline param --------------------------------
hasParams := A_Args.Length

if (hasParams != 0){
  Loop hasParams
  {
    if(A_Args[A_index] = "remove"){
      exit()
    }
  }
}

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send "{Volume_Up}"
WheelDown::Send "{Volume_Down}"

MouseIsOver(WinTitle) {
    MouseGetPos ,, &Win
    return WinExist(WinTitle " ahk_id " Win)
}

exit(){
  exitApp
}
