
/*
20210402 v1.00

Joy's Record Time code :https://github.com/yevolcn/RecordTime/blob/master/RecordTime.ahk
Helbents Clock/Stopwatch code: https://pastebin.com/HxgmZVXF

This has been modified to do projects & sends to CSV file 
Also drop down lists for projects - see vid https://www.youtube.com/watch?v=zj00VrYFbJU
Also Jo Glines ini file vid-https://www.youtube.com/watch?v=ebQvOCYyBks
Also Tab Nation ini gui vid - https://www.youtube.com/watch?v=BEd88xI-tTo
Also- https://www.youtube.com/watch?v=c0LiIF3yMvg

gui context Menu:
https://www.youtube.com/watch?v=6qRxkWo1fSo
https://www.youtube.com/watch?v=0f3Yhr_cpIM

Hotkeys dynamically: 
https://autohotkey.com/board/topic/64933-can-we-create-hotkeys-dynamically/
There were a few interesting methods but I decided to try and build my own. 

I hope this is of use to you, 
Max Drake- drakemax@hotmail.com

*/
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;------------------GLOBAL VARIABLES ----------------------
;------------IniFilePath
IniFilePath1= %A_ScriptDir%\_Project_Code.ini
IniFilePath2= %A_ScriptDir%\_File_HotKeys.ini

; IniFilePath1= C:\Users\%A_UserName%\Downloads\AHK-Working\ProjectTime\1-ProjectTime.ini
; IniFilePath2= C:\Users\drake\Downloads\AHK-Working\ProjectTime\1-myfile1.ini

;------------------START THE PROGRAM ----------------------

;-------Tray Menu items 
Menu, Tray, NoStandard ; remove default tray menu entries
Menu, Tray, Add ; adds a separator between 
Menu, Tray, Add, Run Time Capture, MyLabel_1
Menu, Tray, Add, Open File to Edit, MyLabel_2
Menu, Tray, Add, Upload Project Codes, MyLabel_3
Menu, Tray, Add, Create FileName to Store, MyLabel_4
Menu, Tray, Add, ReMap HotKeys, MyLabel_5
Menu, Tray, Add, Exit the Program, Exit

; if the hotkey & file name do not exist then these are default settings
IfNotExist, %IniFilePath2% 
{
  IniWrite, _TimeCapture.txt, %IniFilePath2%, FileIdLocName, FileNameVar
  IniWrite, !3, %IniFilePath2%, DynamicHotKeys, Replace!3
  IniWrite, !4, %IniFilePath2%, DynamicHotKeys, Replace!4
  IniWrite, !5, %IniFilePath2%, DynamicHotKeys, Replace!5
  IniWrite, !6, %IniFilePath2%, DynamicHotKeys, Replace!6
  IniWrite, !7, %IniFilePath2%, DynamicHotKeys, Replace!7
}
; Get the hotkeys from the .ini file
{
  IniRead, HtKy1, %IniFilePath2%, DynamicHotKeys, Replace!3
  IniRead, HtKy2, %IniFilePath2%, DynamicHotKeys, Replace!4
  IniRead, HtKy3, %IniFilePath2%, DynamicHotKeys, Replace!5
  IniRead, HtKy4, %IniFilePath2%, DynamicHotKeys, Replace!6
  IniRead, HtKy5, %IniFilePath2%, DynamicHotKeys, Replace!7

  Hotkey, %HtKy1%, MyLabel_1
  Hotkey, %HtKy2%, MyLabel_2
  Hotkey, %HtKy3%, MyLabel_3
  Hotkey, %HtKy4%, MyLabel_4
  Hotkey, %HtKy5%, MyLabel_5

  Return
}

MyLabel_5: ;!7:: This remaps hotkeys 
  {

    Gui,Destroy
    Gui,+AlwaysOnTop 
    Gui,Color,0x72B4B1
    Gui, font,bold
    Gui, Add, Text,x12 y30 w230 h21 +Left,PopUp for Time- Replace Alt+3 with:
    Gui, Add, Hotkey, x250 y30 w80 h21 vVar1,!3
    Gui, Add, Text,x12 y60 w230 h21 +Left, Open File- Replace Alt+4 with:
    Gui, Add, Hotkey, x250 y60 w80 h21 vVar2,!4
    Gui, Add, Text,x12 y90 w230 h21 +Left, Upload Project Codes- Replace Alt+5 with:
    Gui, Add, Hotkey, x250 y90 w80 h21 vVar3,!5
    Gui, Add, Text,x12 y120 w230 h21 +Left, Create File for Storing -Replace Alt+6 with:
    Gui, Add, Hotkey, x250 y120 w80 h21 vVar4,!6
    Gui, Add, Text,x12 y150 w230 h21 +Left, Change Hotkeys -Replace Alt+7 with:
    Gui, Add, Hotkey,x250 y150 w80 h21 vVar5,!7
    Gui, Add, Button, Default w80 gButton_To_INI, OK ; This goes to Button_To_INI
    SettingForm_x:=Round((A_ScreenWidth-315)/2)
    Gui, Show, x%SettingForm_x% y320 h230 w335, Choose your Own HotKeys
    Return

    Button_To_INI: 
      Gui, Submit, NoHide
      GuiControlGet, Var1
      GuiControlGet, Var2
      GuiControlGet, Var3
      GuiControlGet, Var4
      GuiControlGet, Var5
      if(!Var1)
        Var1=!3
      if(!Var2)
        Var2=!4
      if(!Var3)
        Var3=!5
      if(!Var4)
        Var4=!6
      if(!Var5)
        Var5=!7

      ;MsgBox %Var1% %Var2% %Var3% %Var4% %Var5%
      IniWrite, %Var1%, %IniFilePath2%, DynamicHotKeys, Replace!3
      IniWrite, %Var2%, %IniFilePath2%, DynamicHotKeys, Replace!4
      IniWrite, %Var3%, %IniFilePath2%, DynamicHotKeys, Replace!5
      IniWrite, %Var4%, %IniFilePath2%, DynamicHotKeys, Replace!6
      IniWrite, %Var5%, %IniFilePath2%, DynamicHotKeys, Replace!7

      Gui, Destroy
      Reload
      Sleep 1000 
    Return
  }

  MyLabel_4: ;!6:: ; Alt + 6   This allows user to Create file name to store information to  
    {
      txIntro =
      (
        PART 1:
          Please enter a File Name and a .txt or .csv extension to the file
          eg FunnyName20210411.csv

          If it is a .CSV file then you can open it in a spreadsheet 
            program such as Excel or Google Sheets. 
          This will allow you to filter by Date/Project & 
          sum the Hours/times etc in those programs 

          If you just need a Text file of information then choose a .TXT file extension
            You can then open your file in Notepad or Wordpad

        PART 2: 
          After you have selected File Name you'll be asked to select which
          folder you want to store the File in Make sure its one you can access easily. 
        )

        ; File Name Input 
        InputBox, FileName , File Name to Save Time Sheet Data, % txIntro, , 500, 450
        ; if ErrorLevel
        ;   MsgBox, CANCEL was pressed.
        ; else
        ;   MsgBox, You entered %FileName%

        ;Select folder
        FileSelectFolder, Folder,,3

        FileId = %Folder%\%FileName%
        ;MsgBox,"File Name & location Selected is=" %FileId%

        IniWrite, %FileId%, %IniFilePath2%, FileIdLocName, FileNameVar
        return

      }

      MyLabel_3: ;!5:: ; Alt + 5   This allows user to up[load Project Codes to ini file for pull-down list
        ; Select a text file with codes in it to upload
        FileSelectFile, SelectedFile, 3, , Open a file, Text Documents (*.txt; *.doc)

          FileDelete, %IniFilePath1%
          x:=0
          Loop, Read, %SelectedFile% 
          {
            x++
            totLines= %A_Index%
            IniWrite, %A_Index%, %IniFilePath1%, 0-totalLines, TotLines
            IniWrite, %A_LoopReadLine%, %IniFilePath1%, ProjectCodes, Key%x%
          }
          return

          MyLabel_2: ;!4:: ; This opens the Report file with excel (if a csv) or Notepad (if .txt)
            { 
              ;MsgBox %A_ThisLabel%
              IniRead,TX, %IniFilePath2%, FileIdLocName, FileNameVar
              RecordFile = %TX%
              Run,%RecordFile%
              Return
            }

          MyLabel_1:

            ;!3:: ; This is main program for booking time against project and note   MyLabel1: ;
            {
              ;-------- This is reading ini file to get name of file to write to & assigning it to RecordFile variable from (!5)
              IniRead,TX, %IniFilePath2%, FileIdLocName, FileNameVar
              RecordFile = %TX%

              ;IniRead,TX, %InFileX%, FileIdLocName, FileNameVar
              ;--------------------This makes a backup file 
              ;RecordFile = %TX%
              ;MsgBox, %RecordFile%
              vx:=StrLen(RecordFile)-4
              RecordBackupFile = % SubStr(RecordFile ,1 ,vx)"Bakup.csv"

              ;MsgBox, the file is= %RecordBackupFile%

              ;-------- This is reading .ini file for Project Code names and assigning to ProjectCodes variable from (!4)
              x:=0
              arr:=[]
              ;ProjectCodes := 
              Loop, Read, %IniFilePath1% 
              {
                IniRead,TL, %IniFilePath1%, 0-totalLines, TotLines
                if(A_Index < TL or A_Index = TL)
                {
                  x++
                  IniRead,KV, %IniFilePath1%, ProjectCodes, Key%x%
                  arr.Push(KV)
                  ProjectCodes .= arr.Pop(KV)"|"
                }
              }

              ;--------This is GUI for filling in Form

              Gui, Add, Text, x12 y12 w25 h21 +Left, Hrs
              Gui, Add, Edit, x40 y10 w40 h21 +Center vUseTime, 1
              Gui, Add, Edit, x100 y10 w80 h21 +Center vStartTime, Edit
              Gui, Add, Edit, x190 y10 w70 h21 +Center vStartDate, Edit
              Gui, Add, Text, x270 y12 w90 h21 +Left , UserName

              Gui, Add, Text, x12 y40 w200 h21 +Left, Project Name (Select from list)
              Gui, Add, DropDownList, x12 y55 w290 r10 vProj,%ProjectCodes% ;h21 vProj,   also the "% List" is the same as"%List%" 
              ;Gui, font,bold cDA4F49
              Gui, Add, Text, x12 y80 w290 h21 +Left, Don't use COMMAS "," below or Text goes to next cell
              Gui, Add, Edit, x12 y100 w290 r5 vActivity,
              Gui, Add, Button, x222 y190 w80 h30 , OK

              GuiControl, , UserName , %A_UserName%
              GuiControl, , StartTime , %A_Hour%:%A_Min%:%A_Sec%
              GuiControl, , StartDate ,%A_DD%-%A_MM%-%A_YYYY%

              SettingForm_x:=Round((A_ScreenWidth-315)/2)

              Gui, Show, x%SettingForm_x% y320 h230 w315, Time Capture ;y320 h158 w315,

              Return

              GuiClose:
                Gui, Destroy
              Return

              ButtonOK:
                {

                  Gui, Submit, NoHide
                  GuiControlGet, UserName
                  GuiControlGet, StartTime1
                  GuiControlGet, UseTime
                  GuiControlGet, Activity
                  StringReplace, Activity, Activity,`n,<br>, ALL ; this seems to suffice 
                  GuiControlGet, Proj

                  ; -----This does Text to Speech on infoSpeek---------since been removed 20210331
                  ; infoSpeak= "Project" %Proj%, "Date" %StartDate% , "Hours" %UseTime%,"Activity"%Activity%
                  ; s.Speak(infoSpeak)
                  ;MsgBox,%info%
                  ; -----This Writes info to file ---------
                  infoToTrayTip=Time= %UseTime%, %Proj%, %Activity%`r`n
                  info= %Proj%, %StartDate%, %UseTime%, %Activity%`r`n
                  FileAppend,%info%,%RecordFile% ;write file
                  ; -----This Writes Backup file with  user and time added ---------
                  infoBackup =%Proj%,%StartDate%,%UseTime%,%Activity% ,%UserName%,%StartTime%`r`n
                  FileAppend,%infoBackup%,%RecordBackupFile% ;write backup  file with user and time
                  TrayTip,%infoToTrayTip%,file= %RecordFile% ,50 ;traytip hint/toast

                  Gui, Destroy
                  Return
                }
              }
              !8:: 
                Exit()
              Return
              Exit() {
                ;MsgBox, You clicked the Exit entry The script will close itself now.
              ExitApp
            }
            Return

