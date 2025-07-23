@echo off
echo ========================================
echo Navisworks 2025 Reference DLL Checker
echo ========================================
echo.

set REF_DIR=References\2025
set ALL_PRESENT=1

echo Checking for required Navisworks 2025 DLLs...
echo Reference directory: %REF_DIR%
echo.

REM Check if reference directory exists
if not exist "%REF_DIR%" (
    echo ERROR: Reference directory not found: %REF_DIR%
    echo Please create this directory and copy the required DLLs
    set ALL_PRESENT=0
    goto :show_requirements
)

REM Check each required DLL
echo Checking required DLL files:

if exist "%REF_DIR%\Autodesk.Navisworks.Api.dll" (
    echo [✓] Autodesk.Navisworks.Api.dll
) else (
    echo [✗] Autodesk.Navisworks.Api.dll - MISSING
    set ALL_PRESENT=0
)

if exist "%REF_DIR%\Autodesk.Navisworks.Automation.dll" (
    echo [✓] Autodesk.Navisworks.Automation.dll
) else (
    echo [✗] Autodesk.Navisworks.Automation.dll - MISSING
    set ALL_PRESENT=0
)

if exist "%REF_DIR%\Autodesk.Navisworks.Clash.dll" (
    echo [✓] Autodesk.Navisworks.Clash.dll
) else (
    echo [✗] Autodesk.Navisworks.Clash.dll - MISSING
    set ALL_PRESENT=0
)

if exist "%REF_DIR%\navisworks.gui.roamer.dll" (
    echo [✓] navisworks.gui.roamer.dll
) else (
    echo [✗] navisworks.gui.roamer.dll - MISSING
    set ALL_PRESENT=0
)

if exist "%REF_DIR%\AdWindows.dll" (
    echo [✓] AdWindows.dll
) else (
    echo [✗] AdWindows.dll - MISSING
    set ALL_PRESENT=0
)

echo.

if %ALL_PRESENT%==1 (
    echo ========================================
    echo SUCCESS: All required DLLs are present!
    echo ========================================
    echo You can now build the project in Visual Studio.
    echo.
    goto :end
)

:show_requirements
echo ========================================
echo MISSING DLLS DETECTED
echo ========================================
echo.
echo Required actions:
echo 1. Install Navisworks Manage 2025
echo 2. Copy the missing DLLs from:
echo    C:\Program Files\Autodesk\Navisworks Manage 2025\
echo 3. Paste them into: %REF_DIR%\
echo.
echo Required DLL files:
echo - Autodesk.Navisworks.Api.dll
echo - Autodesk.Navisworks.Automation.dll
echo - Autodesk.Navisworks.Clash.dll
echo - navisworks.gui.roamer.dll
echo - AdWindows.dll
echo.

:end
pause 