/*
 *********************************************************************************
 * 
 * getfromclip.ahk
 * 
 * all files are UTF-8 no BOM encoded
 * 
 * from https://www.autohotkey.com/board/topic/10384-download-progress-bar/
 * 
 * Copyright (c) 2022 jvr.de. All rights reserved.
 *
 * Licens -> license.txt
 * 
 *********************************************************************************
*/
; AHK 1

#NoEnv
#Warn

;@Ahk2Exe-ConsoleApp

s := clipboard
FileAppend %s%`n, *

exitApp

