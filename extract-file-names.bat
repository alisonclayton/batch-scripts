rem @echo off
color 0a
cls

cd > vartemp1.txt
set /p homedir=<vartemp1.txt
del vartemp1.txt

:menu
cls
Title NAMES EXTRACTOR
echo.
echo =====================================================================
echo. Please, enter the absolute directory path to extract name files!
echo =====================================================================
echo.
set /p opdir=Directory:
if not defined opdir goto menu

cd %opdir% 

cd > vartemp2.txt
set /p atualdir=<vartemp2.txt
del vartemp2.txt

if %atualdir% NEQ %homedir% goto choseoutput

echo.
echo Invalid option, press any key to try again. . .
pause>nul
goto menu

rem echo %atualdir%
rem pause>nul

:choseoutput
cls
set /p opoutput=0
%opoutput%
echo.
echo =====================================================================
echo. What output type do you prefere?
echo. 
echo. 1 The output in a .txt text file.
echo. 2 The output in the console.
echo. 3 Both output types.
echo =====================================================================
echo.
set /p opoutput=Output type:
echo.
%opoutput%
pause>nul
if not defined opoutput goto choseoutput
if %opoutput%==1 goto 1
if %opoutput%==2 goto 2
if %opoutput%==3 goto 3 else goto backchoseoutput

:backchoseoutput
echo.
echo Invalid option, press any key to try again. . .
pause>nul
goto choseoutput

:1
dir /b > %homedir%\names-docs.txt
cls
echo.
echo Your output is in a file named names-docs.txt located in this directory.
echo.
goto continue

:2
cls
echo.
echo Your output:
echo.
dir /b
goto continue

:3
dir /b > %homedir%\names-docs.txt
cls
echo.
echo This output is in a file named names-docs.txt located in this directory.
echo.
dir /b
echo.
goto continue

:continue
echo.
echo Press any key to continue. . .
pause>nul

:chosecontinue
cls
echo.
set /p repeat="Do you want to do another extract? [y/n]: "
echo.
if not defined repeat goto chosecontinue
if %repeat%==y goto menu
if %repeat%==n goto end else goto bkchosecontinue

:bkchosecontinue
echo. 
echo Invalid option, press any key to try again. . .
pause>nul
goto chosecontinue

:end
echo.
echo Press any key to end. . .
pause>nul