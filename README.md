# SimpleTools
Windows &gt; 10 64bit only!  
  
A collection of some simple windows tools.  
(Autohotkey scripts)  
*.exe are 64 bit.  

**Currently no viruschecks of "clsidwin10", "internalvariables2" and "cmdprompt" are made!** 
  
### Overview  
All *.exe are compressed by [UPX](https://upx.github.io/) now!
  
Name | Description | Type | Year of creation 
------------ | ------------- | ------------- | -------------  
clipboardToConsole  | Copies text-content from clipbard to the console | shell | 2024
clsid | Windows Class Identifiers tryout | gui | 2023
cmdprompt  | Opens a command prompt (current directory!) | shell | 2023
getfromclip | Get text-content from clipbard | exe (console) | 2022  
hotkeyConverter2 | Convert Hotkeys | exe  | 2024  
internalvariables2 | Show AHK internal variables | exe  | 2023  
quicksave | makes a copy of the directory to C:\\_ _ _SAVE| exe (console) | 2022/2023 
sbt | Just calls sbt.bat | exe (console) | 2022  
soundplay | plays sound or video, to be used in batch-files | exe (console) | 2022  
showMessage | to display a message, if a batch-file is started minimized | exe | 2024  

~~keyremapper~~
  
### Latest changes  
Name | Modification
------------ | -------------  
clipboardToConsole | NEW
showMessage | NEW
hotkeyConverter2 | NEW
cmdprompt | removal of the temporary file "cd.tmp" sometimes failed (fixed)
quicksave | sets destination folder timestamp to current time, \*.lnk-files and junctions are not copied!
quicksave | environment variable: "QUICKSAVEOPTIONS"  
keyremapper | new
quicksave | ok-request removed  
quicksave | file "quicksaveCreatelink.bat" is removed after execution (6 seconds delayed)
  
### Download  
Click on *.exe, then click on "View Raw"!   
  
### Descriptions  
(Alphabetically ordered)  
  
#### clipboardToConsole  
Console app.  
Prints the clipboard content on the console.  
Like "getfromclip", but made with AHK version 2.  
  
#### cmdprompt  
Opens a commandprompt in the current folder.  
NOT the directory of the app!  
Tip: Create a link/Shortcut of "cmdprompt.exe" and  
edit the properties, remove the "running directory" entry.  
Copy "cmdprompt.lnk" to each directory of interest.  
  
#### clsid  
List of Windows (10) clsids.  
Click an entry to execute.  
If it fails, you may press the F1 ... F6 hotkeys to tryout different run configurations ...  
(AHK 2)  
Clsids from https://www.autohotkey.com/docs/v2/misc/CLSID-List.htm  
List is "hardcoded".  
  
### getfromclip
Get clipboard-content as a command-line command. 
(Appends a newline to the clipboard-content).  
**WARNING: Use with care, it may affect the security of your system!**  
(The clipboard is not save against manipulations!)  
  
Example ("getfromclipTest.bat"): 

````
@rem getfromclipTest.bat

@echo off

cd %~dp0

set command=dir *.ahk

rem copy (without \r\n) to the clipboard.
echo | set/p=%command% | clip

rem read the clipboard and run the command 
call getfromclip | %comspec% 
````

#### quicksave
Makes a copy (a snapshot) (using [robocopy](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy)) of the directory (with name: directoryname) containing "quicksave.exe" to:  
"C:\___SAVE\&lt;directoryname&gt;_TIMESTAMP" 
where TIMESTAMP is year, month, day, hour, minute, second and    
&lt;directoryname&gt; is the last part of the path (i.e. the subdirectory-name).  
If not using distinct (sub-)directorynames, it is more difficult the select the correct folder in case of a restore.  
Robocopy parameter used are: " /MIR /XO /TEE /FFT /W:1 /R:2 /NP" (hardcoded, not changable),  
automatically excluded directories are: "tmp" "target" "streams" ".git"  
(surround a path containing blanks with quotation marks),  
overwritten by the content of the environment variable: "QUICKSAVEOPTIONS",
example:  
set QUICKSAVEOPTIONS=tmp  
  
Default target directory "C:\___SAVE" is overriden by defining an environment variable: "QUICKSAVETARGET",  
example:  
Name: QUICKSAVETARGET  
Value: D:\___SAVE  
  
(Start Windows System Properties control "sysdm.cpl" to create permanent environment variables).  
  
##### quicksave context-menu integration  
**Holding down the Alt-key while double clicking "quicksave.exe"**  
(Or a call of "quicksave context")  
Creates the file "quicksave.reg" containing a registry-entry  
to create a file-explorer **context-menu entry** and executes it, if allowed.  
The file-explorer **folder tree context menu** contains an entry "quicksave" afterwards!  
  
##### quicksave creating link-file "quicksave.lnk"
**Holding down a Shift-key while double clicking "quicksave.exe"**  
(Or a call of "quicksave createlink")  
Creates the file "quicksave.lnk" in the current directory.  
Doubleclick it every time if you want to execute a quicksave operation!  
If the above context-menu entry was made before,  
the file-explorer folder tree context menu may be used to create this link-file inside a selected directory:    
Hold down the "Shift"-key while selecting the directory in the folder tree context menu!  
(NOT in the directory listing!)  
A Powerscript-file "quicksaveCreatelink.bat" is created and run.  
It creates the the link "quicksave.lnk" then.  
The Powerscript-file "quicksaveCreatelink.bat" is deleted afterwards (with 6 seconds delay).  
  
I prefer double clicking the file "quicksave.lnk", as the fastest method to make a snapshot!  
  
#### sbt  
sbt.exe just calls "sbt.bat"  
  
#### soundplay  
I use it to signal the end of long running operations, i.e. backup etc.,  
````
soundplay[.exe] [&lt;soundfile.wav&gt;] [&lt;duration milliseconds&gt;]  
````  
Other soundfile-formats support depends on the installed codecs (mp3 etc.).  
  
#### hotkeyConverter2  
Convert Autohotkey hotkeys (pressed keys) to hotkey-code and code to "text".  
The "text" is formated to be inserted into markdown documents, i.e. prepending a "\\"-character to "\[".  
To use standard text add the word "nomd" as a start-parameter.  
  
#### showMessage  
Add to the batchfile:  
````
start showMessage.exe "TEXT"  
````
Example TEXT: "Started &lt;Batchfilename&gt; Parameter: %1%"  
  
"showMessage.exe" must be located in a directory of the Window Path-variable,  
or use the full pathname.  
  
Hint: Create a link-file of the batchfile to start minimized,  
besides all Desktop Icons are already link-files.  
  
**More to come ...**  
  

/*
 *********************************************************************************
 * 
 * GNU GENERAL PUBLIC LICENSE
 * 
 * A copy is included in the file "license.txt"
 *
  *********************************************************************************
*/

Copyright (c) 2022/23/24 J. v. Roos  

  
<a name="virusscan">



##### Virusscan at Virustotal 
[Virusscan at Virustotal, getfromclip.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/840545518901c3566fd7913adcbe650c577398480d59faec12b39823820ec937/detection/u-840545518901c3566fd7913adcbe650c577398480d59faec12b39823820ec937-1708425890
)  
[Virusscan at Virustotal, sbt.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/6e68e12d3e3d75ad32260de5a1773c448db2bdcc0aeae92208a63f2548de60e9/detection/u-6e68e12d3e3d75ad32260de5a1773c448db2bdcc0aeae92208a63f2548de60e9-1708425906
)  
[Virusscan at Virustotal, quicksave.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/96d29b8ff29df39581415998bcc674bddb33b45b01c4b6e0c7487e0d71abd160/detection/u-96d29b8ff29df39581415998bcc674bddb33b45b01c4b6e0c7487e0d71abd160-1708425922
)  
[Virusscan at Virustotal, soundplay.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/7698dd56516eb44073ea1de7d0acfb71c1eff53b1c4ddaaf6a792408cffd991d/detection/u-7698dd56516eb44073ea1de7d0acfb71c1eff53b1c4ddaaf6a792408cffd991d-1708425938
)  
[Virusscan at Virustotal, clsidwin10.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/55c6b3210a7edea5e4941207dabfa8dc31385fd0aafcd7718a18e7e0c93b8a31/detection/u-55c6b3210a7edea5e4941207dabfa8dc31385fd0aafcd7718a18e7e0c93b8a31-1708425954
)  
[Virusscan at Virustotal, internalvariables2.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/56c0581afeb608cd65378e1d7c615e3b81c5f9dd4085933e49aeeb697a40d90e/detection/u-56c0581afeb608cd65378e1d7c615e3b81c5f9dd4085933e49aeeb697a40d90e-1708425970
)  
[Virusscan at Virustotal, cmdprompt.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/de8e8d08260ad184d698d5877c18fddd9500b39492beeeea0732db785dadb2da/detection/u-de8e8d08260ad184d698d5877c18fddd9500b39492beeeea0732db785dadb2da-1708425986
)  
[Virusscan at Virustotal, hotkeyConverter2.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/680037c3c62d22d393f96931f9ca39d7173874bd0eb84df7eccb9d05ea23dc40/detection/u-680037c3c62d22d393f96931f9ca39d7173874bd0eb84df7eccb9d05ea23dc40-1708426002
)  
[Virusscan at Virustotal, showMessage.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/6825725c52043018b67892e27074650266f311c756d0b5c1cf258a70925adb80/detection/u-6825725c52043018b67892e27074650266f311c756d0b5c1cf258a70925adb80-1708426018
)  
Use [CTRL] + Click to open in a new window! 
