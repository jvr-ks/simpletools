#Requires AutoHotkey >=2.0

#SingleInstance

Loop A_Args.Length {
  if(A_Args[A_index] == "remove"){
    ExitApp
  }
}

try
  Hotkey "F5", windoof
catch TargetError
  MsgBox "Setting hotkey failed: " . TargetError

windoof(hk){
  Send "{LWin down}"
  sleep 3000
  Send "{LWin up}"

  return
}
