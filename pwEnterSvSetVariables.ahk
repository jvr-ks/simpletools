; pwEnterSvSetVariables.ahk
; Part of pwEnterService.ahk


;------------------------------- setVariables -------------------------------
setVariables(){
  global
  
  quot := "`""
  ; "
  
  appDataDir := A_AppDataCommon "\" appnameLower "\"

  if (!FileExist(AppDataDir)){
    DirCreate(AppDataDir)
  }

  useDir := A_WorkingDir "\"
  configFile := appDataDir appnameLower "_" A_ComputerName ".ini"
  configFileLocal := useDir appnameLower ".ini"

  if (FileExist("_" appnameLower ".ini")){
    configFileLocal := "_"  appnameLower ".ini"
  }
    
  ; take local config if exists
  if (!FileExist(configFile)){
    if (FileExist(configFileLocal)){
      FileCopy configFileLocal, configFile
    }
  }
  
  passwordsFile := useDir "pwEnterServicePasswords.ini"
  
  remotePasswordsPath := IniRead(configFile, "config", "remotePasswordsPath" , "")
  if (remotePasswordsPath != ""){
    if (SubStr(remotePasswordsPath, -1, 1) = "\")
      passwordsFile := remotePasswordsPath "pwEnterServicePasswords.ini"
    else
      passwordsFile := remotePasswordsPath "\" "pwEnterServicePasswords.ini"
  } else {
    MsgBox("The settings parameter `"remotePasswordsPath`" is missing, closing the app due to this error!","SEVERE ERROR occurred!","Icon!")
    exitApp
  }
  
  
  showSettings := 0
  pname := ""
  verifyDelayFirefox := 3000
  verifyDelayCrypditor := 2000
  testMode := 0
  newAppsStarted := Map()
  newAppsStop := 0

}


;----------------------------------------------------------------------------

















