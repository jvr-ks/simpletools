/*
 *********************************************************************************
 * 
 * clipboardForce.ahk
 * 
 * use UTF-8 BOM codec
 * 
 * Version :  appVersion
 * 
 * Copyright (c) 2025 jvr.de. All rights reserved.
 *
 *
 *********************************************************************************
*/
/*
 *********************************************************************************
 * 
 * MIT License
 * 
 * 
 * Copyright (c) 2025 jvr.de. All rights reserved.
 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all 
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * UTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
  *********************************************************************************
*/

; Gdip standard library v1.45 by tic (Tariq Porter) 07/09/11
; Modifed by Rseding91 using fincs 64 bit compatible Gdip library 5/1/2013
; Supports: Basic, _L ANSi, _L Unicode x86 and _L Unicode x64
; Modifed by jvr

#Requires AutoHotkey v1

#NoEnv
#Warn
#SingleInstance Force

#InstallKeybdHook

#Include %A_ScriptDir%

#Include, Lib\gdipAllpatched.ahk

;---------------------------------------------------------------
; Coordinate mode
;--------------------------------------------------------------
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen

SetWorkingDir %A_ScriptDir%

wrkDir := A_ScriptDir . "\"

appName := "clipboardForce"
appVersion := "0.004"
app := appName . " " . appVersion

configFile := A_ScriptDir . "\clipboardForce.ini"

gdiToken := 0
cursorChanged := 0

x1 := 0
y1 := 0
x2 := 0
y2 := 0

holdtime := 3000
holdtimeshort := 2000
holdtimelong := 6000
ocrHotkeyDefault := "!y"

ClipboardDataType := 0

firstclick := false

/*
ClipboardDataType:
0 = Clipboard is now empty.
1 = Clipboard contains something that can be expressed as text (this includes files copied from an Explorer window).
2 = Clipboard contains something entirely non-text such as a picture.
*/

  
tesseractPath := iniReadSave("tesseractPath", "tesseract", "C:\Program Files\Tesseract-OCR\tesseract.exe")
lang := iniReadSave("lang", "tesseract", "eng+deu+chi_sim+rus")
psm := iniReadSave("psm", "tesseract", 6 )
imagenameTmp := iniReadSave("imagenameTmp", "tesseract", "_tmp.png")
tesseracOutputbase := iniReadSave("tesseracOutputbase", "tesseract", "tmp")
  
ocrHotkey := iniReadSave("ocrHotkey", "hotkeys", ocrHotkeyDefault)

killswitch := iniReadSave("killswitch", "dev", 1)

debug := iniReadSave("debug", "dev", 0)

OnExit("resetCursor")

OnClipboardChange("ClipChanged" , -1) ; start monitoring

Hotkey, %ocrHotkey%, ocr, On

Loop % A_Args.Length() {
  if(eq(A_Args[A_index], "remove"))
    exit()
}

if (killswitch){
  msg := "OCR select area started,`nHotkey is: " . hotkeyToText(ocrHotkey) . "`nKillSwitch is [Ctrl]+[Escape]"
} else {
  msg := "OCR select area started,`nHotkey is: " . hotkeyToText(ocrHotkey)  
}
msg := msg . "`nThe integrated ClipToKeys function uses`n [Ctrl] + [Shift] + [Right-Mouseclick] Hotkey!"


tipTop(msg, holdtimelong)

return
;----------------------------------- Esc:: -----------------------------------
^Esc::
  settimer, ocrLoop, delete
  
  tipTop("""" . app . """ closed and removed from memory!", 3000)
  sleep, 3000
  tipTopClose()
  
  exitApp
;------------------------------------ ocr ------------------------------------
ocr(){
  global gdiToken, holdtime, holdtimelong, wrkDir
  global tesseractPath, lang, psm, imagenameTmp, tesseracOutputbase
  global theGraphics, theBrush, theImgx, theImgy, theWidth, theHeight, overlayHWND, theHbm, theHdc, theObm
  global x1, y1, x2, y2, debug
  
  changeCursor()
  
  startGDI()
  
  Gui, overlay:New, -Caption +E0x80000 +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs HWNDoverlayHWND
  Gui, overlay:Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%
  
  theHbm := CreateDIBSection(A_ScreenWidth, A_ScreenHeight)
  theHdc := CreateCompatibleDC()
  theObm := SelectObject(theHdc, theHbm)
  theGraphics := Gdip_GraphicsFromHDC(theHdc)
  Gdip_SetSmoothingMode(theGraphics, 4)
  
  theBrush := Gdip_BrushCreateSolid(0x660000ff)
  
  theImgx := 0
  theImgy := 0
  theHeight := 0
  theWidth := 0

  thePen := Gdip_CreatePen(0xffff0000, 3)

  mouseGetPos, x1, y1
  tooltipText := "Release [y] key or press [ESCAPE] to kill the app!"
  if (debug)
    tooltipText := "Release [y] key or press [ESCAPE] to kill the app! (Mem: " . GetProcessMemoryUsage() . " MB)"
    
  tooltip, %tooltipText%, x1 + 50, y1 - 50, 2
    
  keywait, y
  tooltip,,,, 2
  settimer, ocrLoop, -10
  
  return
}
;---------------------------------- ocrLoop ----------------------------------
ocrLoop(){
  global gdiToken, holdtime, holdtimelong, wrkDir
  global tesseractPath, lang, psm, imagenameTmp, tesseracOutputbase
  global theGraphics, theBrush, theImgx, theImgy, theWidth, theHeight, overlayHWND, theHbm, theHdc, theObm
  global x1, y1, x2, y2, debug
  
  if(GetKeyState("Alt", "P")){
    mouseGetPos, x2, y2
    Gdip_GraphicsClear(theGraphics)
    
    theImgx := min(x1, x2)
    theImgy := min(y1, y2)
    theWidth := abs(x2 - x1)
    theHeight := abs(y2 - y1)
    
    Gdip_FillRoundedRectangle(theGraphics, theBrush, theImgx, theImgy, theWidth, theHeight, 2)
    UpdateLayeredWindow(overlayHWND, theHdc, 0, 0, A_ScreenWidth, A_ScreenHeight)
    
    tooltipText := "Select the area with a mouse movement,`nthen release the [ALT] key!`n(No mouse dragging or clicking!)"
    if (debug)
      tooltipText := tooltipText .  "(Mem: " . GetProcessMemoryUsage() . " MB)"
      
    tooltip, %tooltipText%, x2 + 50, y2 - 50, 2
    settimer, ocrLoop, -10
  } else {
    settimer, ocrLoop, delete
    tooltip,,,, 2
    resetCursor()
  
    Gui, overlay:Destroy

    Image := Gdip_Bitmapfromscreen(theImgx "|" theImgy "|" theWidth "|" theHeight)
  
    Gdip_Savebitmaptofile(Image, imagenameTmp)
    Gdip_DisposeImage(Image)
    
    Gdip_DeleteBrush(theBrush)
    SelectObject(theHdc, theObm)
    DeleteObject(theHbm)
    DeleteDC(theHdc)
    Gdip_DeleteGraphics(theGraphics)
    StopGDI()
    
    ; Do the OCR
    txtExtension :=  ".txt"
    outputfile := wrkDir . tesseracOutputbase . txtExtension
    
    if (FileExist(outputfile))
      FileDelete, %outputfile% 

    if (FileExist(tesseractPath)){
      runWait %tesseractPath% %imagenameTmp% %tesseracOutputbase% -l %lang% --psm %psm%,, Hide
      data := ""
      if (FileExist(outputfile)){
        FileRead, data, %outputfile%
        if (!ErrorLevel){
          tipTop(data, holdtimelong)
          clipboard := data
        } else {
          tipTop("OCR-error occured, something went wrong!", holdtime)
        }
      } else {
        tipTop("Tesseract-error occured, produced no output!", holdtime)
      }
    } else {
      tipTop("Tesseract installation missing, file " . tesseractPath . " not found!", holdtime)
    }
  }
  
  return
}
;-------------------------------- resetCursor --------------------------------
resetCursor(){
  global cursorChanged

  if (cursorChanged)
    changeCursor()

  return
}
;-------------------------------- iniReadSave --------------------------------
iniReadSave(name, section, defaultValue){
  global configFile
  
  r := ""
  IniRead, r, %configFile%, %section%, %name%, %defaultValue%
  if (r == "" || r == "ERROR")
    r := defaultValue
    
  if (r == "#empty!")
    r := ""
    
  return r
}
;------------------------------- changeCursor -------------------------------
changeCursor(){
  global cursorChanged

  NULL=
  IDC_APPSTARTING := 32650
  IDC_HAND := 32649
  IDC_ARROW := 32512
  IDC_CROSS := 32515
  IDC_IBEAM := 32513
  IDC_ICON := 32641
  IDC_NO := 32648
  IDC_SIZE := 32640
  IDC_SIZEALL := 32646
  IDC_SIZENESW := 32643
  IDC_SIZENS := 32645
  IDC_SIZENWSE := 32642
  IDC_SIZEWE := 32644
  IDC_UPARROW := 32516
  IDC_WAIT := 32514

  result1 := DllCall("LoadCursor", "Uint", NULL, "Int", IDC_CROSS, "Uint")
  result2 := DllCall("SetSystemCursor", "Uint", result1, "Int", IDC_ARROW, "Uint")
  cursorChanged := !cursorChanged
  
  return
}
;--------------------------------- startGDI ---------------------------------
startGDI(){
  global gdiToken

  if (gdiToken != 0){
    tipTop("Gdi already running!", 3000)
  } else {
    gdiToken := Gdip_Startup(1)
    
    If (gdiToken == 0) {
      MsgBox, 48, gdiplus error!, Gdiplus failed to start. File "Gdip_All_patched.ahk" missing? Please ensure you have gdiplus on your system
      exit()
    }
  }
  
  return
}
;---------------------------------- stopGDI ----------------------------------
stopGDI(){
  global gdiToken
  
  DllCall("CloseClipboard")
  Gdip_Shutdown(gdiToken)
  gdiToken := 0
  
  return
}
;------------------------------------ eq ------------------------------------
eq(a, b) {
  if (InStr(a, b) && InStr(b, a))
    return 1
  return 0
}
;--------------------------------- tipTop ---------------------------------
tipTop(msg, t := 3000, n := 1){

  s := StrReplace(msg,"^",",")
  
  toolX := Floor(A_ScreenWidth / 2)
  toolY := 2

  ToolTip,%s%, toolX, toolY, n
  
  WinGetPos, X,Y,W,H, ahk_class tooltips_class32

  toolX := (A_ScreenWidth / 2) - W / 2
  
  ToolTip,%s%, toolX, toolY, n
  
  if (t > 0){
    tvalue := -1 * t
    SetTimer,tipTopClose,%tvalue%
  }
  
  return
}
;------------------------------ tipTopClose ------------------------------
tipTopClose(){
  
  Loop, 20
  {
    ToolTip,,,,%A_Index%
  }
  
  return
}
;----------------------------------- exit -----------------------------------
exit() {
  global app
  global holdtime, holdtimeshort, holdtimelong
  global gdiToken
  
  Static CCM_SETCOLORSCHEME := 0x2002 ; (CCM_FIRST + 2) lParam is color scheme

  tipTop("""" . app . """ closed and removed from memory!", holdtimelong)
  
  stopGDI()
  
  if (gdiToken != "")
    Gdip_Shutdown(gdiToken)
  
  sleep, 3000
  
  ExitApp
}
;------------------------------ hkToDescription ------------------------------
hkToDescription(c) {
  s := ""
  
  switch c
  {
    case "^":
      s := "[CTRL]"
    case "!":
      s := "[ALT]"
    case "#":
      s := "[WIN]"
    case "+":
      s := "[SHIFT]"
    case ">":
      s := "Right"
    case "<":
      s := "Left"
    case "$":
      s := "[Alt] + [Tab]"
    default:
      s := "[" . c . "]"
  }
  
  return s
}
;------------------------------- hotkeyToText -------------------------------
hotkeyToText(h) {
  
  StringLower,h,h
  
  ; h := extractHotkey(h)
  
  isOff := ""
  if (InStr(h, "off") > 0){
    h := RegExReplace(h, "i)off" , "")
    isOff := " (is off!)"
  }
  
  if (InStr(h, "tab") > 0){
    h := RegExReplace(h, "i)alt & tab" , "$")
  }
  
  hk := StrSplit(StrRev(h))
  s := ""
  l := hk.Length() - 1
  
  
  Loop, % l
  {
    s := hkToDescription(hk[A_Index + 1]) . " + " . s
  }
  s := s . hkToDescription(hk[1])
  
  return s . isOff
}
;---------------------------------- StrRev ----------------------------------
StrRev(in) {
  DllCall("msvcrt\_" (A_IsUnicode ? "wcs":"str") "rev", "UInt",&in, "CDecl")
  return in
}
;--------------------------- GetProcessMemoryUsage ---------------------------
GetProcessMemoryUsage() {
    PID := DllCall("GetCurrentProcessId")
    size := 440
    VarSetCapacity(pmcex,size,0)
    ret := ""
    
    hProcess := DllCall( "OpenProcess", UInt,0x400|0x0010,Int,0,Ptr,PID, Ptr )
    if (hProcess)
    {
        if (DllCall("psapi.dll\GetProcessMemoryInfo", Ptr, hProcess, Ptr, &pmcex, UInt,size))
            ret := Round(NumGet(pmcex, (A_PtrSize=8 ? "16" : "12"), "UInt") / 1024**2, 2)
        DllCall("CloseHandle", Ptr, hProcess)
    }
    return % ret
}


;---------------------------------------------------------------
; clipToKeys functionality
;---------------------------------------------------------------

; Shift + Ctrl + Right-Mouse-Button:
;-------------------------------- $+RBUTTON:: --------------------------------
$^+RButton::
  global ClipboardDataType
  if (ClipboardDataType = 0) {
      tipTop("clipToKeys warning:`nClipboard contains no data!")
  } else if (ClipboardDataType = 1) {
      contents := Clipboard
      SetKeyDelay, 10, 2
      SendInput %contents%       ; send literal text
  } else {
      tipTop("clipToKeys ERROR:`nClipboard contains non-text data!", 4000)
  }
  
return
;-------------------------------- ClipChanged --------------------------------
ClipChanged(DataType) {
  global ClipboardDataType
  
  ClipboardDataType := DataType
}

;----------------------------------------------------------------------------

