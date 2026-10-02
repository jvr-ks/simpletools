/*
 *********************************************************************************
 * 
 * jarstarter.ahk
 * 
 * Version: no versioning
 * 
 * Copyright (c) 2026 jvr.de. All rights reserved.
 *
 * Fileencodings: "AutohotkeyHelp2.ahk" UTF-8-BOM
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


#Requires AutoHotkey >=2.0

; Start java "*.jar" apps

#Warn
#SingleInstance

; Dowmload java:
; https://adoptium.net/de/temurin/releases?os=windows&arch=x64&mode=filter


hasParams := A_Args.Length

Switch hasParams
{
Case 1:
  ; path to java.exe:
  javaExe := EnvGet("JAVA_HOME") . "\bin\java.exe"
  if (javaExe){
    run A_ComSpec ' /c ' javaExe  ' -jar ' A_Args[1]
  } else {
    run A_ComSpec ' /c java.exe -jar ' A_Args[1]
  }
    
Case 2:
    javaExe := A_Args[2]
    run A_ComSpec ' /c ' javaExe ' -jar ' A_Args[1]
Default:
    MsgBox "ERROR, please add the filename of the jar file as the first argument`n(optional: path to java.exe as the 2nd argument)!"
}

exitApp

;----------------------------------------------------------------------------




