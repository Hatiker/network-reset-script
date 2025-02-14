@echo off
:: Проверяем, запущен ли скрипт с правами администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Запуск от имени администратора...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit
)

echo Сброс сетевых настроек...
netsh winsock reset
netsh int ip reset all
netsh winhttp reset proxy
ipconfig /flushdns

echo Перезагрузите компьютер для завершения.
pause