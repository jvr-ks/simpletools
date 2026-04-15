#Requires AutoHotkey >=2.0

#SingleInstance

Loop A_Args.Length {
  if(A_Args[A_index] == "remove"){
    MouseGetPos &xActuPos, &yActuPos
    ToolTip("Closing ClipToKeys, by by!", xActuPos + 20, yActuPos - 50)
    sleep 2000
    ExitApp
  }
}

MouseGetPos &xActuPos, &yActuPos
ToolTip("ClipToKeys started,`nusing [Ctrl] + [Shift] + [Right-Mouseclick]!`n(To stop it, please press [Shift] + [Escape])", xActuPos + 40, yActuPos - 80)
sleep 5000
ToolTip()

$+RBUTTON::
{
  Send "{Shift up}"

  contents := A_Clipboard
  SetKeyDelay 10, 2
  SendText contents
}

+ESC:: 
{
  MouseGetPos &xActuPos, &yActuPos
  ToolTip("Closing ClipToKeys, by by!", xActuPos + 20, yActuPos - 50)
  sleep 2000
  exitApp
}

