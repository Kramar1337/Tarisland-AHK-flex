/*
Esc - Прервать все потоки
F5 - Асептер
F6 - Фарм сундуков
F7 - Спам "F" (+ControlSend)
F8 - Спам Атаки (+ControlSend)
Space - Бхоп
Ё - Макрос Loop, спам 1 5 6 7





Рыбалка
塔瑞斯世界  
ahk_class UnrealWindow
ahk_exe Demo-Win64-Shipping.exe
*/




key_Acept = F5
key_ChestFarm = F6
key_FFarm = F7
key_AtkFarm = F8
key_Bhop = Space
key_Macro = vkC0
ControlSendMode = 1
DelayBhop = 150
WindowFocus = ahk_class UnrealWindow
WindowFocusExe = ahk_exe Demo-Win64-Shipping.exe




#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On
CoordMode Mouse, Screen
CoordMode Pixel, Screen
CoordMode ToolTip, Screen
SetTitleMatchMode, 2
Process, Priority,, High
Setbatchlines,-1
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1

CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) 
{
	Try 
	{
		If (A_IsCompiled) 
			Run *RunAs "%A_ScriptFullPath%" /restart
		Else 
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}
Hotkey, *~$%key_Bhop%, Label_Bhop, on
Hotkey, *~$%key_Macro%, Label_Macro, on
Hotkey, *~$%key_Acept%, Label_Acept, on
Hotkey, *~$%key_ChestFarm%, Label_ChestFarm, on
Hotkey, *~$%key_FFarm%, Label_FFarm, on
Hotkey, *~$%key_AtkFarm%, Label_AtkFarm, on


Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Reload, MetkaMenu4
Menu,Tray, Icon, Reload, shell32.dll, 239, 16
Menu,Tray, Default, Reload
Menu,Tray, add
Menu,Tray, add, Exit, MetkaMenu1
Menu,Tray, Icon, Exit, shell32.dll,28, 16
Menu,Tray, Icon, imageres.dll, 80
Return



; F1::
; ControlSend,ahk_parent, {vk57 down}, %WindowFocusExe%
; SoundBeep
; Return

; F1::
; WinGet, hwndVar, ID, %WindowFocusExe%
; ControlClick, x1880 y1384, %WindowFocusExe%
; ControlClick,, %WindowFocusExe%, , Left, 1, x1880 y1384
; Click 670 850
; FuncRandomSleep()
; Click 1280 980
; FuncRandomSleep()
; ControlClick, x1880 y1384, %WindowFocusExe%,,,, NA
; SoundBeep
; Return
; SetTitleMatchMode, 2



;============================Спам "1", для фермерства в свернутом режиме
Label_AtkFarm:
SetTimer, LabelAtkFarm, % (ToggleR5:=!ToggleR5) ? 50 : "Off"
ToolTip,,,0,2
Return
LabelAtkFarm:
Tooltip, Afk Atk`nPres %key_AtkFarm%,round(A_ScreenWidth * .5 - 50),0,2
Sleep 500
FuncRandomSleep()
if ControlSendMode
ControlSend,ahk_parent, {vk31}, %WindowFocusExe%
Else
SendInput {vk31}
FuncRandomSleep()
Return


;============================Спам "F", для фермерства в свернутом режиме
Label_FFarm:
SetTimer, LabelFFarm, % (ToggleR4:=!ToggleR4) ? 50 : "Off"
ToolTip,,,0,2
Return
LabelFFarm:
Tooltip, Afk Farm Spam "F"`nPres %key_FFarm%,round(A_ScreenWidth * .5 - 50),0,2
FuncRandomSleep()
Sleep 300
if ControlSendMode
ControlSend,ahk_parent, {vk46}, %WindowFocusExe%
Else
SendInput {vk46}
Return


;============================Спам ЛКМ в месте появления донатного сундука
Label_ChestFarm:
SetTimer, LabelChestFarm, % (ToggleR3:=!ToggleR3) ? 50 : "Off"
ToolTip,,,0,2
Return
LabelChestFarm:
Tooltip, Chest Farm Loop`nPres %key_ChestFarm%,round(A_ScreenWidth * .5 - 50),0,2
FuncRandomSleep()
x1l:=round(A_ScreenWidth * (670 / 2560))
y1l:=round(A_ScreenHeight * (850 / 1440))
x2l:=round(A_ScreenWidth * (1280 / 2560))
y2l:=round(A_ScreenHeight * (980 / 1440))
Click %x1l% %y1l%
FuncRandomSleep()
Click %x2l% %y2l%
FuncRandomSleep()
Return


;============================Автоасептер
Label_Acept:
IfWinNotActive, %WindowFocus%
	Return
SetTimer, LabelAcept, % (ToggleR2:=!ToggleR2) ? 50 : "Off"
ToolTip,,,0,2
Return
LabelAcept:
Tooltip, Acept`nPres %key_Acept%,round(A_ScreenWidth * .5 - 50),0,2
IfWinNotActive, %WindowFocus%
	{
	SetTimer, LabelAcept, % (ToggleR2:=!ToggleR2) ? 50 : "Off"
	ToolTip,,,0,2
	Return
	}
Sleep 500
FuncRandomSleep()
x1asept:=round(A_ScreenWidth * (1420 / 2560))
y1asept:=round(A_ScreenHeight * (940 / 1440))
Click %x1asept% %y1asept%
Return


;============================Комбо
Label_Macro:
IfWinNotActive, %WindowFocus%
	Return
SetTimer, LabelTimer, % (ToggleR1:=!ToggleR1) ? 50 : "Off"
ToolTip,,,0,2
Return
LabelTimer:
Tooltip, AAttack,round(A_ScreenWidth * .5 - 50),0,2
SendInput {vk34}
IfWinNotActive, %WindowFocus%
	{
	SetTimer, LabelTimer, % (ToggleR1:=!ToggleR1) ? 50 : "Off"
	ToolTip,,,0,2
	Return
	}
FuncRandomSleep()
SendInput {vk36}
FuncRandomSleep()
SendInput {vk37}
FuncRandomSleep()
SendInput {vk35}
IfWinNotActive, %WindowFocus%
	{
	SetTimer, LabelTimer, % (ToggleR1:=!ToggleR1) ? 50 : "Off"
	ToolTip,,,0,2
	Return
	}
FuncRandomSleep()
SendInput {vk31}
FuncRandomSleep()
Return


;============================Банихоп Bhop
Label_Bhop:
Sleep %DelayBhop%
IfWinNotActive, %WindowFocus%
	Return
Loop
{
	SendInput {vk20}
	FuncRandomSleep()
    GetKeyState, StateA, %key_bhop%, P
    If StateA = U
        break
	FuncRandomSleep()
}
Return










;============================Функция: есть курсор мышки - 1, нет курсора - 0
FuncCursorVisible()
{
	StructSize1337 := A_PtrSize + 16
	VarSetCapacity(InfoStruct1337, StructSize1337)
	NumPut(StructSize1337, InfoStruct1337)
	DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	Result1337 := NumGet(InfoStruct1337, 8)
	if (Result1337 <> 0)
		CursorVisible := 1
	Else
		CursorVisible := 0
	Return CursorVisible
}
;============================Функция рандома Sleep
FuncRandomSleep()
{
	Random, ScRandomSleep, 15, 40
	Sleep %ScRandomSleep%
}

;============================Функция рандома
gen_password(length = 8)																;начало фукции длина пароля по дефолту 8
{																						
	possible = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890			;переменная с символами
	StringLen, max, possible															;сколько символов в переменной
	if length > %max%																	;если длина пароля больше переменной то выйти
	{																					
		MsgBox, Длина должна быть меньше количества возможных символов.				
		Exit, 40																		
	}																					
	Loop																				;начало петли
	{																					
		Random, rand, 1, max															;зарандомить от 1 до %число символов в переменной %possible%%
		StringMid, char, possible, rand, 1												;извлеч из %possible%(наши символы), номер символа %rand%, кол-во 1, в %char%
		IfNotInString, password, %char%													;повторился ли символ %password% и %char%
		{																				
			password = %password%%char%													;склеить то что было и новый символ
			if StrLen(password) >= length												;если длина строки %password% больше или равна длине %length%
				break																	;выйти из петли
		}																				
	}																					
	return password																		;вернуть сгенерированое значение в переменную
}


*~$Esc::
Keywait Esc
SetTimer, LabelTimer, Off
SetTimer, LabelAcept, Off
SetTimer, LabelChestFarm, Off
SetTimer, LabelFFarm, Off
SetTimer, LabelAtkFarm, Off
ToolTip,,,0,2
Exit
Return

*~$End::
Keywait End
MetkaMenu1:
Exitapp
Return

MetkaMenu4:
Reload

