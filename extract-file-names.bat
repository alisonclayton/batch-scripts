@echo off
color 0a
cls

cd > vartemp1.txt
set /p homedir=<vartemp1.txt
del vartemp1.txt

echo. .: NAMES EXTRACTOR :.
echo.
echo =====================================================================
echo. Please, enter the absolute directory path to extract name files!
echo =====================================================================
echo.
set /p opdir=Directory:
echo.
cd %opdir%

dir /b > %homedir%\names-docs.txt

echo.
echo Your output is in a file named names-docs.txt located in this directory.
echo.
echo Press any key to end. . .
pause>nul