/*
 *********************************************************************************
 * 
 * sbt.ahk
 *
 * Just starts sbt.bat
 * 
 * all files are UTF-8 no BOM encoded
 * 
 * from https://www.autohotkey.com/board/topic/10384-download-progress-bar/
 * 
 * Copyright (c) 2022 jvr.de. All rights reserved.
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

#NoEnv
#Warn

;@Ahk2Exe-ConsoleApp

args := ""
Loop % A_Args.Length()
{
  args .= A_Args[A_index] . " " 
}

runwait, sbt.bat %args%


exitApp

