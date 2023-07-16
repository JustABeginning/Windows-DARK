@echo off
setlocal enabledelayedexpansion
:: START TIME of Dark Mode
set "start_hr=05"
set "start_min=00"
set "start_mode=pm"
:: END TIME of Dark Mode
set "end_hr=06"
set "end_min=00"
set "end_mode=am"
set /A sz_time=60
set /A start_minN=0
set /A end_minN=0
:loop
if exist Set_System_Mode.txt (
	call :setSystemMode
)
call :strLength %start_hr% len
if !len! EQU 2 (
	if %start_hr:~0,1% EQU 0 (
		set "start_hr=%start_hr:~-1%"
	)
) else (
	goto :continue
)
call :strLength %start_min% len
if !len! GEQ 2 (
	if %start_min:~0,1% EQU 0 (
		set "start_min=%start_min:~1,2%"
	)
)
call :strLength %end_hr% len
if !len! EQU 2 (
	if %end_hr:~0,1% EQU 0 (
		set "end_hr=%end_hr:~-1%"
	)
)
call :strLength %end_min% len
if !len! GEQ 2 (
	if %end_min:~0,1% EQU 0 (
		set "end_min=%end_min:~1,2%"
	)
)
set /A start_hrN=%start_hr%
set /A start_minN=%start_min%
set /A end_hrN=%end_hr%
set /A end_minN=%end_min%
:: Make the necessary conversion A
if /I %start_mode% EQU PM (
	if %start_hrN% LSS 12 (
		set /A start_hrN=%start_hrN% + 12
	)
)
if /I %start_mode% EQU AM (
	if %start_hrN% EQU 12 (
		set /A start_hrN=%start_hrN% - 12
	)
)
if /I %end_mode% EQU PM (
	if %end_hrN% LSS 12 (
		set /A end_hrN=%end_hrN% + 12
	)
)
if /I %end_mode% EQU AM (
	if %end_hrN% EQU 12 (
		set /A end_hrN=%end_hrN% - 12
	)
)
set /A start_minN=%start_hrN% * 60 + %start_minN%
set /A end_minN=%end_hrN% * 60 + %end_minN%
:continue
powershell Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme | find /I "system"> tmp_val.txt
set /p sys_mode=< tmp_val.txt
powershell Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme | find /I "app"> tmp_val.txt
set /p app_mode=< tmp_val.txt
set "sys_mode=%sys_mode:~-1%"
set "app_mode=%app_mode:~-1%"
set /A sys_mode=%sys_mode%
set /A app_mode=%app_mode%
if %sys_mode% EQU 1 (
	powershell "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force" > nul
)
time /t> tmp_val.txt
set /p tim=< tmp_val.txt
del tmp_val.txt
set "hr=%tim:~0,2%"
set "min=%tim:~3,3%"
set "mod=%tim:~-2%"
call :strLength %hr% len
if !len! EQU 2 (
	if %hr:~0,1% EQU 0 (
		set "hr=%hr:~-1%"
	)
)
call :strLength %min% len
if !len! GEQ 2 (
	if %min:~0,1% EQU 0 (
		set "min=%min:~1,2%"
	)
)
set /A hrN=%hr%
set /A minN=%min%
:: Make the necessary conversion B
if /I %mod% EQU PM (
	if %hrN% LSS 12 (
		set /A hrN=%hrN% + 12
	)
)
if /I %mod% EQU AM (
	if %hrN% EQU 12 (
		set /A hrN=%hrN% - 12
	)
)
set /A minN=%hrN% * 60 + %minN%
if %start_minN% LSS %end_minN% (goto :forward_range)
if %start_minN% GTR %end_minN% (goto :reverse_range)
goto :end
:forward_range
if %minN% GEQ %end_minN% (
	call :startLightMode & goto :end
)
if %minN% GEQ %start_minN% (
	call :startDarkMode
)
goto :end
:reverse_range
if %minN% GEQ %start_minN% (
	call :startDarkMode & goto :end
)
if %minN% GEQ %end_minN% (
	call :startLightMode
)
:end
ping 127.0.0.1 -n %sz_time% > nul
goto :loop
exit /b %errorlevel%
:: End of Main Function
:startDarkMode
if %app_mode% EQU 1 (
	powershell "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force" > nul
)
exit /b 0
:startLightMode
if %app_mode% EQU 0 (
	powershell "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force" > nul
)
exit /b 0
:setSystemMode
set /A count=0
for /f "tokens=*" %%a in (Set_System_Mode.txt) do (
	call :setValue %%a
)
exit /b 0
:setValue
set /A count=%count% + 1
if %count%==1 (
	set "start_hr=%~1"
)
if %count%==2 (
	set "start_min=%~1"
)
if %count%==3 (
	set "start_mode=%~1"
)
if %count%==4 (
	set "end_hr=%~1"
)
if %count%==5 (
	set "end_min=%~1"
)
if %count%==6 (
	set "end_mode=%~1"
)
if %count%==7 (
	set /A sz_time=%~1
)
exit /b 0
:strLength
set "str=%~1"
set /A init=0
:loopL
set "ch=!str:~%init%!"
set /A init+=1
if not "%ch%" EQU "" (goto :loopL)
set /A %~2=%init% - 1
exit /b 0
