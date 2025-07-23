@echo off
echo ========================================
echo Navisworks 2025 Clash Data Exporter Deployment
echo ========================================
echo.

REM Check if build output exists
if not exist "ClashData\bin\Release\ClashData.dll" (
    if not exist "ClashData\bin\Debug\ClashData.dll" (
        echo ERROR: ClashData.dll not found in bin\Release or bin\Debug
        echo Please build the project first in Visual Studio
        pause
        exit /b 1
    )
    set BUILD_DIR=ClashData\bin\Debug
    echo Using Debug build...
) else (
    set BUILD_DIR=ClashData\bin\Release
    echo Using Release build...
)

REM Set target directory
set TARGET_DIR=C:\Program Files\Autodesk\Navisworks Manage 2025\Plugins\ClashData

echo.
echo Source: %BUILD_DIR%
echo Target: %TARGET_DIR%
echo.

REM Check if Navisworks 2025 is installed
if not exist "C:\Program Files\Autodesk\Navisworks Manage 2025\" (
    echo ERROR: Navisworks Manage 2025 not found at expected location
    echo Please verify Navisworks 2025 is installed
    pause
    exit /b 1
)

REM Create target directory
echo Creating plugin directory...
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
    if errorlevel 1 (
        echo ERROR: Failed to create directory. Run as Administrator.
        pause
        exit /b 1
    )
)

REM Copy files
echo Copying plugin files...
copy "%BUILD_DIR%\ClashData.dll" "%TARGET_DIR%\" >nul
if errorlevel 1 (
    echo ERROR: Failed to copy ClashData.dll. Check permissions.
    pause
    exit /b 1
)

REM Copy directories
if exist "%BUILD_DIR%\en-US" (
    xcopy "%BUILD_DIR%\en-US" "%TARGET_DIR%\en-US\" /E /I /Y >nul
    echo - Copied en-US folder
)

if exist "%BUILD_DIR%\Images" (
    xcopy "%BUILD_DIR%\Images" "%TARGET_DIR%\Images\" /E /I /Y >nul
    echo - Copied Images folder
)

if exist "%BUILD_DIR%\Resources" (
    xcopy "%BUILD_DIR%\Resources" "%TARGET_DIR%\Resources\" /E /I /Y >nul
    echo - Copied Resources folder
)

echo - Copied ClashData.dll

echo.
echo ========================================
echo DEPLOYMENT SUCCESSFUL!
echo ========================================
echo.
echo The plugin has been deployed to:
echo %TARGET_DIR%
echo.
echo Next steps:
echo 1. Restart Navisworks Manage 2025
echo 2. Look for 'Export Clash Data' in the VDC Add-ins ribbon tab
echo.
echo If the plugin doesn't appear:
echo - Check that .NET Framework 4.8 is installed
echo - Verify all required DLLs are in References\2025\
echo - Run Navisworks as Administrator if needed
echo.
pause 