@echo off
color 0a
cls

cd > vartemp1.txt
set /p homedir=<vartemp1.txt
del vartemp1.txt

:menu
cls
echo. .: NAMES EXTRACTOR :.
echo.
echo =====================================================================
echo. Please, enter the absolute directory path to extract name files!
echo =====================================================================
echo.
set /p opdir=Directory:
cd %opdir%

cls
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
if %opoutput%==1 goto 1
if %opoutput%==2 goto 2
if %opoutput%==3 goto 3

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

cls
echo.
set /p repeat="Do you want to do another extract? [y/n]: "
echo.
if %repeat%==y goto menu
if %repeat%==n goto end

:end
echo.
echo Press any key to end. . .
pause>nul