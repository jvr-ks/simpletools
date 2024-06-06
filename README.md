# SimpleTools
A collection of some simple windows tools.  
(Autohotkey scripts)  
All *.exe are 64 bit.  
  
All files are licensed under the **GNU GENERAL PUBLIC LICENSE**  
A copy is included of the file "license.txt" is included in each download.  
  
  
### <a name="0verview">Overview</a>  
All *.exe are compressed by [UPX](https://upx.github.io/) now!  
"console" are executables to be used at the command line.
  
Name | Version | Description | Type | AHK | Year of creation  
------------ | ------------- | ------------- | ------------- | ------------- | -------------  
<a href="#AutohotkeyHelp2">AutohotkeyHelp2</a> | 0.50 | Shows Autohotkey help (the word the cursor is inside or the marked word(s))  | exe| 2 | 2024 
AhkVersionInfo | 1.00 | Shows installed Autohotkey 1 and 2 version numbers [Download AhkVersionInfo.exe](https://github.com/jvr-ks/simpletools/raw/main/AhkVersionInfo.exe)  | exe| 2 | 2024
<a href="#chunkCopy">chunkCopy</a>  | moved | Helper to copy large backupfiles in chunks to the cloud  | exe| 2 | 2024  
<a href="#clipboardToConsole">clipboardToConsole</a> | -  | Copies text-content from clipboard to the console | console| 2 | 2024  
<a href="#clsidwin10">clsidwin10</a> | 1.00 | Windows Class Identifiers tryout | gui| 2 | 2023  
<a href="#cmdprompt">cmdprompt</a> | 1.00 | Opens a command prompt (current directory!) | console| 1 | 2023  
~~getfromclip~~ | 1.00 | Get text-content from clipboard | console| 1 | 2022 deprecated  
<a href="#hotkeyConverter2">hotkeyConverter2</a> | 1.00 | Convert Hotkeys | exe | 2 | 2024  
<a href="#internalvariables2">internalvariables2</a> | 1.00 | Shows AHK2 internal variables | exe | 2 | 2023  
<a href="#pwEnterService">pwEnterService</a> | moved | Automatic fills in the Firefox (an other apps) main password | exe| 2 | 2024  
<a href="#quicksave">quicksave</a> | 1.00 | makes a copy of the current directory to C:\\_ _ _SAVE| console| 1 | 2022/2023  
<a href="#sbt">sbt</a> | 1.00 | Just calls sbt.bat | console| 1 | 2022  
<a href="#showMessage">showMessage</a> | 1.00 | to display a message, if a batch-file is started minimized | exe| 1 | 2024  
<a href="#soundplay">soundplay</a> | 1.00 | plays sound or video, to be used in batch-files | console| 1 | 2022  
<a href="#TranslateViaGoogle2">TranslateViaGoogle2</a> | 0.04 | Opens Google Translate webpage with the selected text | exe| 2 | 2024  
<a href="#volume2">volume2</a> | 1.00 | Control the Volume with the Mousewheel, if the mouse is over the TrayWindow. | exe| 2 | 2024  
  
### Latest changes  
Name | Modification / Issue
------------ | -------------  
pwEnterService | Move to a project of its own! [pwEnterService](https://github.com/jvr-ks/pwEnterService)
chunkCopy | Move to a project of its own! [chunkCopy](https://github.com/jvr-ks/chunkCopy)
translateViaGoogle2 | text selection mechanism changed
  
### Descriptions  
(Alphabetically ordered)  
Download links are below each description, or click on the *.exe, then click on "View Raw"! 
  
#### <a name="AutohotkeyHelp2">AutohotkeyHelp2</a><a href="#overview"> &uarr;</a>
Shows Autohotkey help AHK Version 1 or 2.  
- put the cursor inside a word or mark the command word(s),  
  positioning the mouse pointer over a word is sufficient, if the word is selected by the doubleclick automatically performed,  
- - press F4 key to show AHK 2 help  
- - press Shift key and F4 key to show AHK 1 help  

If the cursor is:
- behind a word: the word is selected,  
- before a word: behavior is unpredictable,  

If nothing is marked or the cursor is outside a word, nothing is shown.  
  
Using the "AutoHotkey.chm" files, i.e. Autohotkey must be installed!
  
AutohotkeyHelp2 is running as a companion to Codetester if enabled.  
Drawback: AutohotkeyHelp2 is removed from memory then, if Codetester is closed!  
  
Based on https://www.autohotkey.com/docs/v2/scripts/  
"Context Sensitive Help in Any Editor" (based on the v1 script by Rajat)  
  
[Download AutohotkeyHelp2.exe](https://github.com/jvr-ks/simpletools/raw/main/AutohotkeyHelp2.exe)  
  
#### <a name="chunkCopy">chunkCopy</a><a href="#overview"> &uarr;</a>  
Move to a project of its own! [chunkCopy](https://github.com/jvr-ks/chunkCopy)
  
#### <a name="clsidwin10">clsidwin10</a><a href="#overview"> &uarr;</a>
List of Windows (10) clsids.  
Click an entry to execute.  
If it fails, you may press the F1 ... F6 hotkeys to tryout different run configurations ...  
(AHK 2)  
Clsids from https://www.autohotkey.com/docs/v2/misc/CLSID-List.htm  
List is "hardcoded".  

[Download clsidwin10.exe](https://github.com/jvr-ks/simpletools/raw/main/clsidwin10.exe)  
  
#### <a name="cmdprompt">cmdprompt</a><a href="#overview"> &uarr;</a>
Opens a commandprompt in the current folder.  
NOT the directory of the app!  
Tip: Create a link/Shortcut of "cmdprompt.exe" and  
edit the properties and remove the "running directory" entry.  
Copy "cmdprompt.lnk" to each directory of interest.  

[Download cmdprompt.exe](https://github.com/jvr-ks/simpletools/raw/main/cmdprompt.exe)  

#### ~~getfromclip~~ deprecated
Get clipboard-content as a command-line command. 
(Appends a newline to the clipboard-content).  
**WARNING: Use with care, it may affect the security of your system!**  
(The clipboard is not save against manipulations!)  
  
#### <a name="hotkeyConverter2">hotkeyConverter2</a><a href="#overview"> &uarr;</a>
Convert Autohotkey hotkeys (pressed keys) to hotkey-code and code to "text".  
The "text" is formated to be inserted into markdown documents, i.e. prepending a "\\"-character to "\[".  
To use standard text add the word "nomd" as a start-parameter.  

[Download hotkeyConverter2.exe](https://github.com/jvr-ks/simpletools/raw/main/hotkeyConverter2.exe)  
 
#### <a name="internalvariables2">internalvariables2</a><a href="#overview"> &uarr;</a>
Shows AHK2 internal variables, i.e. "A_XY" etc. ...  

[Download internalvariables2.exe](https://github.com/jvr-ks/simpletools/raw/main/internalvariables2.exe)  
  
#### <a name="pwEnterService">pwEnterService</a><a href="#overview"> &uarr;</a>  
Move to a project of its own! [pwEnterService](https://github.com/jvr-ks/pwEnterService)

#### <a name="quicksave">quicksave</a><a href="#overview"> &uarr;</a>
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
   
[Download quicksave.exe](https://github.com/jvr-ks/simpletools/raw/main/quicksave.exe)  
  
#### <a name="sbt">sbt</a><a href="#overview"> &uarr;</a>  
sbt.exe just calls "sbt.bat"  
[Download sbt.exe](https://github.com/jvr-ks/simpletools/raw/main/sbt.exe) 
  
#### <a name="soundplay">soundplay</a><a href="#overview"> &uarr;</a>  
I use it to signal the end of long running operations, i.e. backup etc.,  
````
soundplay[.exe] [&lt;soundfile.wav&gt;] [&lt;duration milliseconds&gt;]  
````  
Other soundfile-formats support depends on the installed codecs (mp3 etc.).  
  
[Download soundplay](https://github.com/jvr-ks/simpletools/raw/main/soundplay.exe)  
  
#### <a name="showMessage">showMessage</a><a href="#overview"> &uarr;</a>
Add to the batchfile:  
````
start showMessage.exe "TEXT"  
````
Example TEXT: "Started &lt;Batchfilename&gt; Parameter: %1%"  
  
"showMessage.exe" must be located in a directory of the Window Path-variable,  
or use the full pathname.  
  
Hint: Create a link-file of the batchfile to start minimized,  
besides all Desktop Icons are already link-files.  
  
[Download showMessage](https://github.com/jvr-ks/simpletools/raw/main/showMessage.exe)  
  

#### <a name="translateViaGoogle2">translateViaGoogle2</a><a href="#overview"> &uarr;</a>
Mark a text an press and press \[Ctrl] + \[t] to open the browser with the Google Translation webpage.  
If no text is selected, "translateViaGoogle2" takes the entire line as input.  
  
``` 
To remove from memory:  

run translateViaGoogle2.exe remove  
or  
mark a space character and press \[Ctrl] + \[c].  
```  
The source-language is automatically detected by Google, the target-language is the language of your system!  
  
[Download translateViaGoogle2](https://github.com/jvr-ks/simpletools/raw/main/translateViaGoogle2.exe)  
  
#### <a name="volume2">volume2</a><a href="#overview"> &uarr;</a>
Control the volume with the mousewheel if the mouse is over the TrayWindow.  
  
[Download volume2](https://github.com/jvr-ks/simpletools/raw/main/volume2.exe)  
  
  
  
**More to come ...**  
  
Copyright (c) 2022/23/24 J. v. Roos  

Virustotal virusscan results, please use [CTRL] + Click to open in a new window! 

<a name="virusscan">



[Virusscan at Virustotal, AhkVersionInfo.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/35e1d501284bf5cf750976da4ad3a82e39fc797dd257477e46484a9a8ca6d4ba/detection/u-35e1d501284bf5cf750976da4ad3a82e39fc797dd257477e46484a9a8ca6d4ba-1716023368)  
[Virusscan at Virustotal, AutohotkeyHelp2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/cd88a87c618d6c76bb885d99edcc8b6a339ea7f20dcb3715c9f31924cc7eff32/detection/u-cd88a87c618d6c76bb885d99edcc8b6a339ea7f20dcb3715c9f31924cc7eff32-1716801439)  
[Virusscan at Virustotal, clipboardToConsole.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/41f1138450948a54f8a95709e6866841bef6cdaf768b635614d9b50fb533f150/detection/u-41f1138450948a54f8a95709e6866841bef6cdaf768b635614d9b50fb533f150-1714330637)  
[Virusscan at Virustotal, clsidwin10.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/55c6b3210a7edea5e4941207dabfa8dc31385fd0aafcd7718a18e7e0c93b8a31/detection/u-55c6b3210a7edea5e4941207dabfa8dc31385fd0aafcd7718a18e7e0c93b8a31-1714330804)  
[Virusscan at Virustotal, cmdprompt.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/de8e8d08260ad184d698d5877c18fddd9500b39492beeeea0732db785dadb2da/detection/u-de8e8d08260ad184d698d5877c18fddd9500b39492beeeea0732db785dadb2da-1714330823)  
[Virusscan at Virustotal, getfromclip.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/840545518901c3566fd7913adcbe650c577398480d59faec12b39823820ec937/detection/u-840545518901c3566fd7913adcbe650c577398480d59faec12b39823820ec937-1714330841)  
[Virusscan at Virustotal, hotkeyConverter2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/680037c3c62d22d393f96931f9ca39d7173874bd0eb84df7eccb9d05ea23dc40/detection/u-680037c3c62d22d393f96931f9ca39d7173874bd0eb84df7eccb9d05ea23dc40-1714330860)  
[Virusscan at Virustotal, internalvariables2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/56c0581afeb608cd65378e1d7c615e3b81c5f9dd4085933e49aeeb697a40d90e/detection/u-56c0581afeb608cd65378e1d7c615e3b81c5f9dd4085933e49aeeb697a40d90e-1715115179)  
[Virusscan at Virustotal, passwordEN2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/e797b409c0685aac447283e524c48007445fbc3000d93f8c06a060d251d58028/detection/u-e797b409c0685aac447283e524c48007445fbc3000d93f8c06a060d251d58028-1713959496)  
[Virusscan at Virustotal, passwordFF2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/d58df15c453f3f73341e693d06d05a9f80e26916aa67aa64e5da26cbb97b0d90/detection/u-d58df15c453f3f73341e693d06d05a9f80e26916aa67aa64e5da26cbb97b0d90-1713787212)  
[Virusscan at Virustotal, pwEnter.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/19bec3f503f4454554bb85e92c57b658d2bab09367398d5e4f83b22a8e35f0a9/detection/u-19bec3f503f4454554bb85e92c57b658d2bab09367398d5e4f83b22a8e35f0a9-1714330897)  
[Virusscan at Virustotal, quicksave.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/96d29b8ff29df39581415998bcc674bddb33b45b01c4b6e0c7487e0d71abd160/detection/u-96d29b8ff29df39581415998bcc674bddb33b45b01c4b6e0c7487e0d71abd160-1714330915)  
[Virusscan at Virustotal, sbt.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/6e68e12d3e3d75ad32260de5a1773c448db2bdcc0aeae92208a63f2548de60e9/detection/u-6e68e12d3e3d75ad32260de5a1773c448db2bdcc0aeae92208a63f2548de60e9-1714330933)  
[Virusscan at Virustotal, showMessage.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/6825725c52043018b67892e27074650266f311c756d0b5c1cf258a70925adb80/detection/u-6825725c52043018b67892e27074650266f311c756d0b5c1cf258a70925adb80-1714330951)  
[Virusscan at Virustotal, soundplay.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/7698dd56516eb44073ea1de7d0acfb71c1eff53b1c4ddaaf6a792408cffd991d/detection/u-7698dd56516eb44073ea1de7d0acfb71c1eff53b1c4ddaaf6a792408cffd991d-1714330970)  
[Virusscan at Virustotal, translateViaGoogle2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/ca6a814e935c0c5d56443d7da74ee2abcf42f97e59919e3c9f86c09624335944/detection/u-ca6a814e935c0c5d56443d7da74ee2abcf42f97e59919e3c9f86c09624335944-1714387830)  
[Virusscan at Virustotal, volume2.exe 64bit-exe, Check here]( https://www.virustotal.com/gui/url/9906645597895a8deba575ee56b762554925cc546f89a6333843f8cb5d1d491d/detection/u-9906645597895a8deba575ee56b762554925cc546f89a6333843f8cb5d1d491d-1714331007)  
