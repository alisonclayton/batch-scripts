@echo off
color 0a
Title FAVORITE PAGES LAUNCHER
cls

:launch
cls
echo. 
echo. :: FAVORITE PAGES LAUNCHER ::
echo. - press space+enter to exit -
echo.
set /p dolaunch="Do you want to launch favorites and exit? [y/n]: "
echo.
if %dolaunch%==y (
    set globalfw=exit
    goto openURL)
if %dolaunch%==n goto startmenu 

set globalbk=launch
goto invalideop

:startmenu
cls
echo. 
echo. :: FAVORITE PAGES LAUNCHER ::
echo. - press space+enter to exit -
echo.
echo =====================================================================
echo. Please, chose an opition:
echo.
echo. 1 Save new URL
echo. 2 List URL
echo. 3 Delete URL
echo. 4 Open URLs
echo =====================================================================
echo.
set /p opmenu=Option:
if not defined opmenu goto startmenu
if %opmenu%==1 goto saveURL
if %opmenu%==2 goto listURL
if %opmenu%==3 goto deleteURL
if %opmenu%==4 (
    set globalfw=startmenu
    goto openURL)

set globalbk=startmenu
goto invalideop

:openURL
cls
for /f "delims=" %%i in ('type urls.txt') do (
    start "" "%%i"
    echo Opening "%%i")
echo.
echo All URLs was opened!

if %globalfw%==exit exit

goto forward

:saveURL
cls
echo. 
echo.       :: SAVING URL ::
echo. - press space+enter to exit -
echo. 
echo =====================================================================
echo. Please, enter the URL of a new favorite page to save. . .
echo =====================================================================
echo.
set /p url=URL:
if not defined url goto saveURL
echo %url% >> urls.txt

:savenewask
cls
echo.
echo. - press space+enter to exit -
echo. 
echo URL %url%
echo save successfully!
echo.
echo Do you want to save new URL? [y/n]
echo. 
set /p savenew="n go back to the menu: "
if not defined savenew goto savenewask
if %savenew%==y goto saveURL
if %savenew%==n goto startmenu 

set globalbk=savenewask
goto invalideop

:listURL
cls
echo.
echo "URLs LIST"
echo.
set /a numero=1
for /f "delims=" %%i in ('type urls.txt') do (echo %%i) 

set globalfw=startmenu
goto forward

:deleteURL

rem exit

:invalideop
echo. 
echo Invalid option, press any key to try again. . .
pause>nul
goto %globalbk%

:forward
echo. 
echo Press any key to continue. . .
pause>nul
goto %globalfw%