@echo off
set "start_hr=05"
set "start_min=00"
set "start_mode=PM"
set "end_hr=06"
set "end_min=00"
set "end_mode=AM"
set /A sz_time=1
if exist Set_System_Mode.txt (
	call :setSystemMode
)
set "start_tim=%start_hr%:%start_min% %start_mode%"
echo.
set /p start_tim="Enter START TIME of Dark Mode [hh:mm AM/PM] : "
set "end_tim=%end_hr%:%end_min% %end_mode%"
echo.
set /p end_tim="Enter END TIME of Dark Mode [hh:mm AM/PM] : "
:setSzTime
set /A tmp_sz=%sz_time%
echo.
set /p tmp_sz="Enter SNOOZE TIME (in minute(s)) : "
set /A tmp_sz=%tmp_sz%
if %tmp_sz% LEQ 0 (goto :setSzTime) 
set /A choice=0
echo.
set /p choice="Enter 1 to CONFIRM INITIALIZATION : "
set /A choice=%choice%
if %choice% EQU 1 (goto :confirm) else (goto :end)
:confirm
set "start_hr=%start_tim:~0,2%"
set "start_min=%start_tim:~3,3%"
set "start_mode=%start_tim:~-2%"
set "end_hr=%end_tim:~0,2%"
set "end_min=%end_tim:~3,3%"
set "end_mode=%end_tim:~-2%"
set /A sz_time=%tmp_sz% * 60
echo %start_hr%> Set_System_Mode.txt
echo %start_min%>> Set_System_Mode.txt
echo %start_mode%>> Set_System_Mode.txt
echo %end_hr%>> Set_System_Mode.txt
echo %end_min%>> Set_System_Mode.txt
echo %end_mode%>> Set_System_Mode.txt
echo %sz_time%>> Set_System_Mode.txt
echo.
echo Values have been saved SUCCESSFULLY !
echo.
pause
:end
exit /b %errorlevel%
:: End of Main Function
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
	set /A sz_time=%~1 & call :convMin
)
exit /b 0
:convMin
set /A sz_time=%sz_time% / 60
exit /b 0
