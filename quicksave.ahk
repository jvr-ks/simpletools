/*
 *********************************************************************************
 *
 * quicksave.ahk
 *
 * all files are UTF-8 no BOM encoded
 *
 * Version -> appVersion
 *
 * Copyright (c) 2021 jvr.de. All rights reserved.
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
; ******************** UNDER CONSTRUCTION! ********************


; AutoHotkey v1.1+

#Warn
#SingleInstance force

appname := "quicksave"
useDir := A_WorkingDir

param1 := A_Args[1]

;------------------------------ start-parameter ------------------------------
if(param1 == "context" || GetKeyState("Alt")){
  appPath := StrReplace(A_WorkingDir . "\","\","\\")
  
  code := "Windows Registry Editor Version 5.00`n`n"
  code .= "[HKEY_CLASSES_ROOT\Directory\shell\" . appname . "]`n"
  code .= """ICON""=""" . appPath . appname . ".exe""`n`n"
  code .= "[HKEY_CLASSES_ROOT\Directory\shell\" . appname . "\command]`n"
  code .= "@=""" . appPath . appname . ".exe %1""`n"
  
  FileDelete, quicksave.reg
  
  FileAppend , %code%, quicksave.reg, UTF-16
  
  msgbox,4,Generated file "quicksave.reg",%code%`n`nAdd it to the registry now?
  
  IfMsgBox Yes
  {
    run,%comspec% /C quicksave.reg
  }
  
  exitApp
}

if(param1 == "createlink" || (GetKeyState("Shift") && param1 == "")){
  appSource := A_ScriptDir . "\" . appname . ".exe"

  code := "powershell ""$s=(New-Object -COM WScript.Shell).CreateShortcut('______" . appname . ".lnk');$s.TargetPath='" . appSource . "';$s.WorkingDirectory='" . A_WorkingDir . "';$s.Save()""`n"

  targetFile := "quicksaveCreatelink.bat"

  if (FileExist(targetFile))
    FileDelete, %targetFile%
  
  FileAppend , %code%, %targetFile%
  
  run, %comspec% /C %targetFile%
  
  sleep, 6000
  
  if (FileExist(targetFile))
    FileDelete, %targetFile%
  
  exitApp
}


if(param1 != ""){
  useDir := param1  ; call via context-menu or cmd-line

  if(GetKeyState("Shift")){
    appSource := A_ScriptDir . "\" . appname . ".exe"

    code := "powershell ""$s=(New-Object -COM WScript.Shell).CreateShortcut('______" . appname . ".lnk');$s.TargetPath='" . appSource . "';$s.WorkingDirectory='" . useDir . "';$s.Save()""`n"

    targetFile := "quicksaveCreatelink.bat"
    targetPath := useDir . "\" . targetFile
    
    if (FileExist(targetPath))
      FileDelete, %targetPath%
    
    sleep, 500
    FileAppend , %code%, %targetPath%
    sleep, 1000
    run, %comspec% /C %targetFile%, %useDir%

    sleep, 6000
  
    if (FileExist(targetPath))
      FileDelete, %targetPath%
  
    exitApp
  }
  
}
  
targetDir := "C:\___SAVE"

EnvGet, qst, QUICKSAVETARGET

if (qst != "")
  targetDir := qst
  
quickSaveOptions := """tmp"" ""target"" ""streams"" "".git"" "

EnvGet, qsOptions, QUICKSAVEOPTIONS

if (qsOptions != "")
  quickSaveOptions := qsOptions
  
if (targetDir != ""){

  SplitPath, useDir, name

  p := targetDir . "\" . name
  FormatTime, t, %A_Now% T8,yyyy_MM_dd_hh_mm_ss
  saveTotPath :=  p . "_" . t

  run, robocopy %useDir% %saveTotPath% /XD %quickSaveOptions% /XF *.lnk /XJF /MIR /XO /TEE /FFT /W:1 /R:2 /NP
  FileSetTime, , %saveTotPath%, , 2
} else {
  msgbox, Path-error: "%useDir%" -> "%saveTotPath%"
}














