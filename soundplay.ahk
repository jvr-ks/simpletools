/*
 *********************************************************************************
 *
 * soundplay.ahk
 *
 * all files are UTF-8 with BOM encoded
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

; AutoHotkey v1.1+


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

;@Ahk2Exe-ConsoleApp

FileEncoding, UTF-8

playTime := 0

if (A_Args[1] != ""){
  soundfile := A_Args[1]
  if (A_Args[2] != "")
    playTime := 0 + A_Args[2]

  if (playTime > 0){
    SoundPlay, %soundfile%
    sleep, %playTime%
  } else {
    SoundPlay, %soundfile%, 1
  }
}

exitApp

