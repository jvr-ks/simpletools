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
 * Licens -> license.txt
 * 
 *********************************************************************************
*/

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

