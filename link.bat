@echo off
setlocal

rem Get the directory of the currently executing script
set "scriptDir=%~dp0"

rem Get Blender version from user input
set /p version="Enter Blender version (e.g., 2.93): "

rem Set the source and destination directory paths
set "sourceDirectory=%scriptDir%"
echo sourceDirectory: %scriptDir%
set "destinationDirectory=%APPDATA%\Blender Foundation\Blender\%version%\scripts\addons\MeshDataTransfer\"
echo destinationDirectory: %destinationDirectory%

rem Create the symbolic link
mklink /D "%destinationDirectory%" "%sourceDirectory%"

rem Check if the symbolic link creation was successful
if errorlevel 1 (
    echo Symbolic link creation failed.
) else (
    echo Symbolic link created successfully.
)
pause
endlocal