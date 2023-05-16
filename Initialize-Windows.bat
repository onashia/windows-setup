@echo off

:: Description  > Perform setup tasks for new Windows computers
:: Updated On   > 2023-05-11


:: Self elevate script if not run as administrator
:-------------------------------------
:: Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


:: Disable common Windows settings which cause suggested content, apps, tips, and advertisements
PowerShell.exe -ExecutionPolicy Bypass -File ""%~dp0\dependencies\Disable-Settings.ps1""

:: Enable location services and allow location for Weather app.
PowerShell.exe -ExecutionPolicy Bypass -File ""%~dp0\dependencies\Enable-Location.ps1""

:: Enable automatic date and time detection.
PowerShell.exe -ExecutionPolicy Bypass -File ""%~dp0\dependencies\Enable-Time.ps1""

:: Enable automatic date and time detection.
PowerShell.exe -ExecutionPolicy Bypass -File ""%~dp0\dependencies\Enable-Icons.ps1""

pause