# Time-Capture

#### Acknowlegements:

I am using Joy's ReportTime code from : https://github.com/yevolcn/RecordTime/blob/master/RecordTime.ahk
I personally use Hellbent aka CivReborn Timer/StopWatch from: https://pastebin.com/HxgmZVXF
Thank you to both these people for sharing their code.

### Project:

This code is based upon Joy's ReportTime application.
I've only modified:
1- Adding a Project Code pull down list
2- Making items comma separated rather than tab separated.

This project was undertaken to learn about compiling and distributing AHK programs and to share with others a tool that I find extremely useful.

## How it works:

I have included the .ahk file, so if anyone wants to use it and develop further they are welcome to, please aknowlege Joy as he was the originator of the project.

_Note- Hotkeys shown in titles eg (Alt + 3) can be modified to suit your own preference- see below_

### 1-Running Program (Alt + 3)

Run the Time Capture.exe file.

To Fill in new time information press Alt+3 or
You will get a little icon in your Task Tray Menu. Right mouse click on the icon in Task Tray & choose "Run Time Capture"

This writes input information to a Destination file that you can then open and use for billing or reporting on your time management.

### 2-Opening Destination File (Alt+4)

There is a default destination file, called "\_TimeCapture.txt" That is created and written to the same direcctory that the program is located in. There is also a Backup file created "\_TimeCaptureBackup.csv" that is stored in the same folder.

You can create a different file name, in a different folder, see below

### 3-Creating your own project codes (Alt+5)

To create a file for your project codes first follow the format of files below and create your own code.txt file:
0-ProjectCodes.txt or
0-ProjectCodesQuotes.txt

Next press Alt+5 or right mouse click on the icon in Task Tray & choose "Upload Project Codes" and select your file
This will create a .ini file with your codes in it , so that every time you run the program in future your project codes will show, unless you update them again with the Alt+5 hotkey

### 4-Personal File & Folder Location (Alt + 6)

There is a preset Destination file created when you first run the program, see above & Hotkey Alt + 4

To change this press Alt+6 or right mouse click on the icon in Task Tray & choose "Create File Name to Store" and:

1/ Create a filename with a .txt or .csv extension (.csv will open easiliy in Excel or Google Sheets)- eg MyStoredFile.txt

2/ Select a folder where you'd like that file to be stored.

_Note1- It will also store a backup file to the same location that will have MyStoredFile**Backup.csv** added at the end_

_Note 2-This file & path location is stored in (\_File_HotKeys.ini) in the directory of the **Time Capture.exe** file_

### 5-Choose different Hotkeys (Alt + 7)

You can choose different hotkeys by re-mapping them in a pop-up window

To change this press Alt+7 or right mouse click on the icon in Task Tray & choose "ReMap Hotkeys" and:

Select different hotkey combinations, these must include a Cntrl , a Shift and/or an Alt key and then a letter or number combination
eg Shift+Alt+Z, Cntrl+Alt+1, etc then press the OK button.

If you have a _blank cell_ or _None_ it will keep the original key, you can just re-do again if there is a problem.

### 6-To exit the program (Alt + 8)

To quit press Alt+8 or right mouse click on the icon in Task Tray & choose "Exit the Program"
