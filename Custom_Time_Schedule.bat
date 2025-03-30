@echo off
set /A stp_pgm=0
set "start_hr=05"
set "start_min=00"
set "start_mode=PM"
set "end_hr=06"
set "end_min=00"
set "end_mode=AM"
set /A sz_time=1
set "setSM=body\Set_System_Mode.txt"
if exist %setSM% (
	call :setSystemMode
)
if %stp_pgm%==1 (
	set /A stp_pgm=0 & goto :setTimMod
)
:: Stop or, Continue
echo.
set /p tmp_stp="Want to STOP Windows-DARK [y/n] ? "
if "%tmp_stp%"=="y" (
	set "stp_pgm=1"
)
if "%tmp_stp%"=="Y" (
	set "stp_pgm=1"
)
if "%tmp_stp%"=="n" (
	set "stp_pgm=0"
)
if "%tmp_stp%"=="N" (
	set "stp_pgm=0"
)
set /A stp_pgm=%stp_pgm%
if %stp_pgm%==1 (goto :skipA)
:setTimMod
set "start_tim=%start_hr%:%start_min% %start_mode%"
echo.
set /p start_tim="Enter START TIME of Dark Mode [hh:mm AM/PM] : "
set "end_tim=%end_hr%:%end_min% %end_mode%"
echo.
set /p end_tim="Enter END TIME of Dark Mode [hh:mm AM/PM] : "
set "start_hr=%start_tim:~0,2%"
set "start_min=%start_tim:~3,3%"
set "start_mode=%start_tim:~-2%"
set "end_hr=%end_tim:~0,2%"
set "end_min=%end_tim:~3,3%"
set "end_mode=%end_tim:~-2%"
:setSzTime
set /A tmp_sz=%sz_time%
echo.
set /p tmp_sz="Enter SNOOZE TIME (in minute(s)) : "
set /A tmp_sz=%tmp_sz%
if %tmp_sz% LEQ 0 (goto :setSzTime)
set /A sz_time=%tmp_sz%
:skipA
set /A choice=0
echo.
set /p choice="Enter 1 to CONFIRM INITIALIZATION : "
set /A choice=%choice%
if %choice% EQU 1 (goto :confirm) else (goto :end)
:confirm
set /A sz_time=%sz_time% * 60
echo %start_hr%> %setSM%
echo %start_min%>> %setSM%
echo %start_mode%>> %setSM%
echo %end_hr%>> %setSM%
echo %end_min%>> %setSM%
echo %end_mode%>> %setSM%
echo %sz_time%>> %setSM%
echo %stp_pgm% >> %setSM%
echo.
echo Values have been saved SUCCESSFULLY !
echo.
pause
:end
exit /b %errorlevel%
:: End of Main Function
:setSystemMode
set /A count=0
for /f "tokens=*" %%a in (%setSM%) do (
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
	set /A sz_time=%~1 & call :convMin
)
if %count%==8 (
	set /A stp_pgm=%~1
)
exit /b 0
:convMin
set /A sz_time=%sz_time% / 60
exit /b 0
