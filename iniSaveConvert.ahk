; IniSaveConvert
; not copied to github!

; converts:
; IniRead, font, %configFile%, config, font, %fontDefault%
; to:
; iniReadSave("name", "section", defaultValue)
  
gui, add, text,,IniSaveConvert running ...
gui,show,xcenter y5

return


guiclose(){
  exitApp
}

Escape::
 exitApp


F3::
{
  sendInput, {Home}{LShift down}{END}{LShift up}
  sleep, 500
  sendInput, ^c
  
  clipWait
  sleep, 500
  
  a := clipboard
  
  b := StrSplit(StrReplace(a,", ",","),",")

  q := """"
  k := ", "
  
  c := b[2] . " := iniReadSave(" . q . b[2] . q . k . q . b[4] . q . k . StrReplace(b[6],"%","") . ")"

  MouseGetPos, xpos, ypos 
  xpos += 100
  ypos -= 100
  
  tooltip, %c%, xpos, ypos

  clipboard := c
  
  clipWait

  return
}



