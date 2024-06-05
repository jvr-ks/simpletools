; pwEnterSvSettings.ahk
; Part of pwEnterService.ahk


;----------------------------- pwEnterSvSettings -----------------------------
pwEnterSvSettings(){
  global
  local Firefox_Password, Crypditor_Password, hHide, l1, l2, l3, sp3
  
  
  if (!FileExist(passwordsFile)){
    showHintColoredTop("USB stick not inserted!")
    return
  }
  
  openDirMenu := Menu()
  openDirMenu.Add("Configuration directory", openDir.Bind("Config"))
  openDirMenu.Add("Password directory", openDir.Bind("Password"))
  
  guiSettingsMenu := MenuBar()
  guiSettingsMenu.Add("Open Directories", openDirMenu)
  guiSettingsMenu.Add("🗙", settingsSave)
  
  
  Firefox_Password := pwEnterSvGetPwFirefox()
  Crypditor_Password := pwEnterSvGetPwCryptor()
  
  
  guiSettings := Gui("+resize", "Settings (Autosaved if closed!)")
  guiSettings.SetFont("c000000")
  guiSettings.BackColor := "ffffff"
  
  pShow := "Password"
  if (GetKeyState("Shift", "P"))
    pShow := ""

  guiSettings.MenuBar := guiSettingsMenu

  ;guiSettings.add("Text", "x2 y5", "                                     ") ; space dummy

  guiSettings.add("Text", "x2 y5", "Firefox_Password:                    ")
  Firefox_PasswordEdit := guiSettings.add("Edit", pShow " x+m yp+0 r1 w500 section", Firefox_Password)

  guiSettings.add("Text", "x2", "Crypditor_Password: ")
  Crypditor_PasswordEdit := guiSettings.add("Edit", pShow " xs yp+0 r1 w500", Crypditor_Password)

  guiSettings.add("Text", "x2", "Crypditor_ExeName: ")
  Crypditor_ExeNameEdit := guiSettings.add("Edit", "xs yp+0 r1 w500", Crypditor_ExeName)
  
  guiSettings.add("Text", "x2", "Passwordsfile location: ")
  remotePasswordsPathEdit := guiSettings.add("Edit", "xs yp+0 r1 w500", remotePasswordsPath)
  
  guiSettings.add("Text", "x2", "verifyDelayFirefox (millisec.): ")
  verifyDelayFirefoxEdit := guiSettings.add("Edit", "xs yp+0 r1 w500", 3000)
  
  guiSettings.add("Text", "x2", "verifyDelayCrypditor (millisec.): ")
  verifyDelayCrypditorEdit := guiSettings.add("Edit", "xs yp+0 r1 w500", 2000)
  
  guiSettings.add("Text", "x2", "testMode: ")
  testModeEdit := guiSettings.add("Edit", "xs yp+0 r1 w50", 0)
  
  guiSettings.Show("center autosize")
  
  guiSettings.OnEvent("Close", settingsSave)

  return
}
;------------------------------- settingsSave -------------------------------
settingsSave(*){
  global 
  
  IniWrite Firefox_PasswordEdit.Value, passwordsFile, "keepsecret", "Firefox_Password"
  IniWrite Crypditor_PasswordEdit.Value, passwordsFile, "keepsecret", "Crypditor_Password"
  IniWrite Crypditor_ExeNameEdit.Value, passwordsFile, "config", "Crypditor_ExeName"
  
  IniWrite remotePasswordsPathEdit.Value, configFile, "config", "remotePasswordsPath"
  IniWrite verifyDelayFirefoxEdit.Value, configFile, "config", "verifyDelayFirefox"
  IniWrite verifyDelayCrypditorEdit.Value, configFile, "config", "verifyDelayCrypditor"
  IniWrite testModeEdit.Value, configFile, "config", "testMode"
  
  ;save a copy
  IniWrite remotePasswordsPathEdit.Value, configFileLocal, "config", "remotePasswordsPath"
  IniWrite verifyDelayFirefoxEdit.Value, configFileLocal, "config", "verifyDelayFirefox"
  IniWrite verifyDelayCrypditorEdit.Value, configFileLocal, "config", "verifyDelayCrypditor"
  IniWrite testModeEdit.Value, configFileLocal, "config", "testMode"

  reload
  
  return
}
;---------------------------------- openDir ----------------------------------
openDir(d, *){
  global
  
  switch d {
    case "Config":
      run A_ComSpec " /c start " appDataDir
      
    case "Password":
      found := regExMatch(passwordsFile, "((?:[a-zA-Z]\:|\\\\[\w\s\.]+\\[\w\s\.$]+)\\(?:[\w\s\.]+\\)*)([\w\s\.]*?)", &match)
      if (found)
        run A_ComSpec " /c start " match.1

  }
}


;----------------------------------------------------------------------------

















