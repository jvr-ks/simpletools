; pwEnterSvCheckAndSend.ahk
; Part of pwEnterService.ahk

;------------------------------- checkAndSend -------------------------------
checkAndSend(forced := 0){
  global
  local pw
  
  static showOnceOnly := 0
  
  pw := ""
  
  useFirefox := 0
  useCrypditor := 0
  
  if (!FileExist(passwordsFile)){
    settimer checkAndSend, 0
    if (!showOnceOnly){
      showHintColoredTop("USB stick not inserted?")
      showOnceOnly := 1
    }
    return
    
  } else {
    showOnceOnly := 0
  }
  
  if (pwEnterSvGetPwFirefox() != "")
    useFirefox := 1
    
  if (pwEnterSvGetPwCryptor() != "")
    useCrypditor := 1
    
  ;-------------------------------- targetApp1 --------------------------------
  if ((InStr(pname, "firefox.exe") && useFirefox) || forced && WinExist(Firefox_WinActivateId)){
    if (forced){
      if (WinExist(Firefox_PwBoxId))
        WinActivate(Firefox_PwBoxId)
    }
    forced := 0
    started := WinWaitActive(Firefox_PwBoxId,,30)
    if (started){
      if (testMode){
        mainMsg.Value := "Password request detected, app: " pname
      }
      pw := pwEnterSvGetPwFirefox()
      try {
        WinActivate(Firefox_PwBoxId)
        ;ControlFocus: id of control is hidden in Firefox
        sleep 50
        ControlSendText pw,, Firefox_PwBoxId
        sleep 500
        ControlSend "{Enter}",, Firefox_PwBoxId
      }
      pw := ""
      sleep verifyDelayFirefox
      ; still exists?
      if (WinExist(Firefox_PwBoxId)){
        showHintColoredTop("Firefox password failed! (Set the focus on the password request box)`n`nTrying again in 5 seconds!`n`n(Press Escape to abort).", 5000)
        if (!GetKeyState("Escape", "P")){
          settimer checkAndSend, -1000
        } else {
          showHintColoredTop("Retry canceled!")
        }
      } else {
        newAppsStarted.Delete("firefox.exe")
        if (newAppsStarted.Count > 0){
          ; showHintColoredTop("Warning, `"pwEnterService`" multible concurrent requests!")
          settimer checkAndSend, -1000
        }
      }
    }
  }
  ;-------------------------------- Crypditor_ -------------------------------- 
  if (((pname = Crypditor_ExeName) && useCrypditor) || forced && WinExist(Crypditor_WinActivateId)){
    started := WinWaitActive(Crypditor_WinActivateId,,30)
    forced := 0
    if (started){
      if (testMode){
        mainMsg.Value := "Password request detected, app: " pname
      }
      pw := pwEnterSvGetPwCryptor()
      try {
        WinActivate(Crypditor_WinActivateId)
        ControlFocus Crypditor_ControlId, Crypditor_WinActivateId
        sleep 50
        ControlSendText pw, Crypditor_ControlId, Crypditor_PwBoxId
        sleep 500
        ControlSend "{Enter}", Crypditor_ControlId, Crypditor_PwBoxId
      }
      pw := ""
      sleep verifyDelayCrypditor
      ; still exists?
      if (WinExist(Crypditor_WinActivateId)){
        showHintColoredTop("Crypditor password failed! (Set the focus on the password request box)`n`n Trying again in 5 seconds!`n`n(Press Escape to abort).", 5000)
        if (!GetKeyState("Escape", "P")){
          settimer checkAndSend, -1000
        } else {
          showHintColoredTop("Retry canceled!")
        }
      } else {
        newAppsStarted.Delete(Crypditor_ExeName)
        if (newAppsStarted.Count > 0){
          ; showHintColoredTop("Warning, `"pwEnterService`" multiple concurrent requests!")
          settimer checkAndSend, -1000
        }
      }
    }
  }
  if (pname = "pwEnterServiceSettings.exe"){
    newAppsStop := 1
    newAppsStarted := Map()
    pwEnterSvSettings()
    pause
  }
  if (pname = "pwEnterServiceRemove.exe"){
    newAppsStop := 1
    exit()
  }
}
;--------------------------- pwEnterSvGetPwFirefox ---------------------------
pwEnterSvGetPwFirefox(){
  return IniRead(passwordsFile, "keepsecret", "Firefox_Password" , "")
}
;--------------------------- pwEnterSvGetPwCryptor ---------------------------
pwEnterSvGetPwCryptor(){
  return IniRead(passwordsFile, "keepsecret", "Crypditor_Password" , "")
}
;----------------------------------------------------------------------------

















