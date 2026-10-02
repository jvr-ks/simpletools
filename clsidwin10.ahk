;-------------------------------- clsidwin10 --------------------------------
/*
 *********************************************************************************
 * 
 * GNU GENERAL PUBLIC LICENSE
 * 
 * A copy is included in the file "license.txt"
 *
  *********************************************************************************
*/
#Requires AutoHotkey v2+

#SingleInstance Force
#Warn


clsids := Map()

clsids.CaseSense := "Off"
clsids.Default := ""

clsids["Administrative Tools (shell)"] := ":::{D20EA4E1-3957-11D2-A40B-0C5020524153}"
clsids["Briefcase (fails)"] := "::{85BBD920-42A0-1069-A2E4-08002B30309D}"
clsids["Control Panel"] := "::{21EC2020-3AEA-1069-A2DD-08002B30309D}"
clsids["Fonts (fails)"] := "::{D20EA4E1-3957-11D2-A40B-0C5020524152}"
clsids["God mode (shell)"] := ":::{ED7BA470-8E54-465E-825C-99712043E01C}"
clsids["History (shell)"] := ":::{FF393560-C2A7-11CF-BFF4-444553540000}"
clsids["Inbox (fails)"] := "::{00020D75-0000-0000-C000-000000000046}"
clsids["Microsoft Network (fails)"] := "::{00028B00-0000-0000-C000-000000000046}"
clsids["My Computer (shell)"] := ":::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
clsids["My Documents (run)"] := "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"
clsids["My Network Places (run)"] := "::{208D2C60-3AEA-1069-A2D7-08002B30309D}"
clsids["Network Computers (fails)"] := "::{1F4DE370-D627-11D1-BA4F-00A0C91EEDBA}"
clsids["Network Connections (run)"] := "::{7007ACC7-3202-11D1-AAD2-00805FC1270E}"
clsids["Printers and Faxes (run)"] := "::{2227A280-3AEA-1069-A2DE-08002B30309D}"
clsids["Programs Folder (fails)"] := "::{7BE9D83C-A729-4D97-B5A7-1B7313C39E0A}"
clsids["Recycle Bin (run)"] := "::{645FF040-5081-101B-9F08-00AA002F954E}"
clsids["Scanners and Cameras (fails)"] := "::{E211B736-43FD-11D1-9EFB-0000F8757FCD}"
clsids["Scheduled Tasks"] := "::{D6277990-4C6A-11CF-8D87-00AA0060F5BF}"
clsids["Start Menu Folder (shell)"] := ":::{48E7CAAB-B918-4E58-A94D-505519C795DC}"
clsids["Temporary Internet Files (shell)"] := "::{7BD29E00-76C1-11CF-9DD0-00A0C9034933}"
clsids["Web Folders (fails)"] := "::{BDEADF00-C265-11D0-BCED-00A0C90AB50F}"

currentSelectedRow := 0

mainWindow()

return

;------------------------------- mainWindow -------------------------------
mainWindow(){
  global mainLV
  global clsids

  mainGui := Gui()
  mainGui.SetFont("s9", "Segoi UI")
  mainLV := mainGui.add("ListView","r25 w650",["Function                                          ➞","Description"])

  mainLV.OnEvent("Click", mainLVClick)
  mainStatusBar := mainGui.add("StatusBar", "0x800")
  hMainStatusBarHwnd := mainStatusBar.hwnd
  mainStatusBar.SetParts(500)
  mainStatusBar.SetText("**** Click an entry! ****")
  mainGui.show("autosize xCenter y20")

  mainGui.OnEvent("Close", mainGuiClose)

  mainLV.Opt("-Redraw")
  for key,value in clsids {
    mainLV.Add("Vis",key,value)
  }

  mainLV.Opt("+Redraw")

  return mainGui
}

;-------------------------------- mainLVClick --------------------------------
mainLVClick(mainLV, RowNumber){
  global clsids, currentSelectedRow

  key := mainLV.GetText(RowNumber,1)
  if (key != ""){
    currentSelectedRow := RowNumber
    sel := clsids[key]
    if (InStr(key,"(run)")){
      run(sel)
    } else {
      if (InStr(key,"(shell)")){
        run("shell" . sel)
      } else {
        DirSelect(sel)
      }
    }
  } else {
    msgbox "Key not found!"
  }
  return
}

mainGuiClose(*){
  ExitApp
}



F1::
{
global clsids, currentSelectedRow, mainLV

key := mainLV.GetText(currentSelectedRow,1)
sel := clsids[key]
run(sel)

return
}

F2::
{
global clsids, currentSelectedRow, mainLV

key := mainLV.GetText(currentSelectedRow,1)
sel := clsids[key]
run("shell" . sel)

return
}

F3::
{
global clsids, currentSelectedRow, mainLV

key := mainLV.GetText(currentSelectedRow,1)
sel := clsids[key]
DirSelect(sel)

return
}

F4::
{
global clsids, currentSelectedRow, mainLV

key := mainLV.GetText(currentSelectedRow,1)
sel := clsids[key]
run(":" . sel)

return
}

F5::
{
global clsids, currentSelectedRow, mainLV

key := mainLV.GetText(currentSelectedRow,1)
sel := clsids[key]
run("shell" . ":" . sel)

return
}

F6::
{
global clsids, currentSelectedRow, mainLV

key := mainLV.GetText(currentSelectedRow,1)
sel := clsids[key]
DirSelect(":" . sel)

return
}



