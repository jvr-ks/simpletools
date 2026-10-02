; brownout.ahk
; Switch screen off

#Requires AutoHotkey >=2.0

#SingleInstance


hasParams := A_Args.Length

if (hasParams != 0){
  Loop hasParams
  {
    if(A_Args[A_index] = "remove"){
      showHintColoredTop("Brownout removed from memory, by by!", 2000)
      sleep 2000
      exitApp
    }
  }
}

showHintColoredTop("Brownout started!", 2000)
sleep 2000
  
^b::
{
  KeyWait "Ctrl" ; wait until key released
  Sleep 300
  DllCall("SendMessage","UInt",0xFFFF,"UInt",0x112,"UInt",0xF170,"Int",2)

  Return
}

+^b::
{
  showHintColoredTop("Brownout removed from memory, by by!")
  sleep 3000
  ExitApp
}

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

