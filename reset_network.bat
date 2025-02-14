@echo off
:: Network Reset Script
:: Author: YourGitHubUsername
:: This script resets network settings in Windows

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Running as Administrator...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit
)

echo Resetting network settings...

netsh winsock reset
netsh int ip reset all
netsh winhttp reset proxy
ipconfig /flushdns

echo Network settings reset completed.
echo Please restart your computer to apply changes.
pause
