@echo off

set "installerURL=https://github.com/cloudunicorn-cupl/sophos/raw/main/SophosSetup.exe"
set "installDirectory=C:\Program Files\Sophos"

echo Downloading Sophos installer...
powershell -command "& {Invoke-WebRequest -Uri '%installerURL%' -OutFile 'SophosSetup.exe'}"

echo Installing Sophos silently...
start /wait SophosSetup.exe 

REM Check if installation was successful
if %errorlevel% equ 0 (
    echo Sophos installation successful.
) else (
    echo An error occurred during Sophos installation.
)

echo Installation process completed.

REM Clean up - delete the installer
del SophosSetup.exe
