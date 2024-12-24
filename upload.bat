@echo off

rem Suppress command echoing
@echo off

rem Navigate to the directory of the script
cd /d "%~dp0"

rem Prompt the user to input the COM port
set /p comPort=Enter the COM port (e.g., COM11): 

rem Prompt the user to input the board name
set /p board=Enter the board name (press Enter for default "{board}"): 

rem Set default board name if not provided
if "%board%"=="" set board={board}

rem List .zip files matching the version pattern in the script's directory
setlocal enabledelayedexpansion
set versions=
for %%F in ("%~dp0v*.*.*.zip") do (
    set versions=!versions! %%~nxF
)

rem Check if no ZIP files were found
if "%versions%"=="" (
    echo Error: No version files found matching the pattern v*.*.*.zip.
    pause
    exit /b
)

rem Display available versions to the user
echo.
echo Available versions:
set count=1
for %%V in (%versions%) do (
    echo [!count!] %%V
    set "version[!count!]=%%V"
    set /a count+=1
)

rem Prompt the user to select a version
set /p versionChoice=Select the version number from the list above: 

rem Retrieve the selected version
set chosenVersion=
for /L %%I in (1,1,%count%) do (
    if "!versionChoice!"=="%%I" set chosenVersion=!version[%%I]!
)

rem Check if a valid version was selected
if "%chosenVersion%"=="" (
    echo Error: Invalid selection.
    pause
    exit /b
)

echo Selected version: %chosenVersion%

rem Define paths for the selected ZIP and extracted folder
set zipFile=%~dp0%chosenVersion%
set extractFolder=%~dp0extracted

rem Extract the selected ZIP file to the extract folder
if not exist "%zipFile%" (
    echo Error: Selected ZIP file does not exist.
    pause
    exit /b
)

echo Extracting %chosenVersion%...
powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%extractFolder%' -Force"

rem Check if extraction was successful
if not exist "%extractFolder%" (
    echo Error: Extraction failed.
    pause
    exit /b
)

rem Copy the executable to the extracted folder
copy "%~dp0upload_image_tool_windows.exe" "%extractFolder%"

rem Navigate to the extracted folder
cd "%extractFolder%"

rem Execute the upload_image_tool_windows.exe from the extracted folder
upload_image_tool_windows.exe "%extractFolder%" "%comPort%" "%board%" "Disable" "Disable" "1500000"

rem Navigate back to the original script directory and clean up
cd /d "%~dp0"
echo Cleaning up extracted folder...
rd /s /q "%extractFolder%"

rem Pause to view output
pause
