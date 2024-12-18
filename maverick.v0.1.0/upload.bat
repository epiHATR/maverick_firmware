@echo off
rem Prompt the user to input the COM port
set /p comPort=Enter the COM port (e.g., COM11): 

rem Prompt the user to input the board name
set /p board=Enter the board name (press Enter for default "{board}"): 

rem Set default board name if not provided
if "%board%"=="" set board={board}

rem Navigate to the 'build' folder
cd build

rem Execute the upload_image_tool_windows.exe with the provided inputs
upload_image_tool_windows.exe ./ "%comPort%" "%board%" "Disable" "Disable" "1500000"

rem Pause to view output
pause
