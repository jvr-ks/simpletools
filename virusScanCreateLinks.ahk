/*
 *********************************************************************************
 * 
 * virusScanCreateLinks.ahk
 * 
 * Sourcecode uses UTF-8 BOM, Resulting file uses ANSI codec
 * 
 * Creates links (to be appended to the readme-file) using the latest scan results only
 * 
 * Version: no versioning
 * 
 * Copyright (c) 2024 jvr.de. All rights reserved.
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

#Requires Autohotkey v2+

#SingleInstance Force
#Warn

FileEncoding "UTF-8"

inputFileName := "_virusscanresults.txt"
outputFileName := "_virusscanLinks.txt"

virusscanResults := Map()

Loop read, inputFileName {
    if (StrLen(A_LoopReadLine) > 10){
      line := StrSplit(A_LoopReadLine, ",")
      if (virusscanResults.Has(line[1]))
        virusscanResults.Delete(line[1])
      
      virusscanResults.Set(line[1], line[2])
    }
}

output := ""
inCleaned := ""

for (k, v in virusscanResults){
  n := "[Virusscan at Virustotal, " k " 64bit-exe, Check here](" v ")  `n"
  output .= n
  inCleaned .= k "," v "`n"
}

If (FileExist(outputFileName))
  FileDelete outputFileName

FileAppend output, outputFileName, "`n CP0"

; create a new "cleaned" inputfile
If (FileExist(inputFileName))
  FileDelete inputFileName
  
FileAppend inCleaned, inputFileName, "`n CP0"

showHintColoredTop("Created: " virusscanResults.Count " entries!")

return
;---------------------------- showHintColoredTop ----------------------------
showHintColoredTop(s := "", n := 3000, fg := "cFFFFFF", bg := "a900ff"){
  global
  local t
  
  hintColored := Gui("+0x80000000 -Caption +ToolWindow +AlwaysOnTop")
  hintColored.SetFont("c" fg)
  hintColored.BackColor := bg
  hintColored.add("Text", , s)
  hintColored.Show("y10 xcenter")
  
  if (n > 0){
    sleep(n)
    hintColored.Destroy()
  }
}
;----------------------------------------------------------------------------
