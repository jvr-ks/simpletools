/*
 *********************************************************************************
 *
 * cmdprompt.ahk
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
; AutoHotkey v1.1+



#Warn
#SingleInstance force

run, %comspec% /c cd > cd.tmp,, Min
sleep, 2000

curDir := ""

fileReadLine, curDir, cd.tmp, 1
sleep, 1000

run, %comspec% /k, curDir
sleep, 1000

fileDelete, %curDir%\cd.tmp

if (Errorlevel)
  msgbox, Failed to delete the temporary file "cd.tmp"

sleep, 500
exitApp













