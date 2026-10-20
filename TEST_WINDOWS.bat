@echo off
cd /d "%~dp0"
powershell.exe -NoProfile -File "%~dp0TEST_WINDOWS.ps1"
echo.
pause
