@echo off
REM Build script for FramerateVigilante

REM Check if PLUGIN_SDK_DIR is set
if not defined PLUGIN_SDK_DIR (
    echo ERROR: PLUGIN_SDK_DIR environment variable is not set!
    echo Please set it to your plugin-sdk installation directory.
    echo Example: set PLUGIN_SDK_DIR=C:\plugin-sdk
    pause
    exit /b 1
)

REM Find MSBuild
set MSBUILD_PATH=
for /f "delims=" %%i in ('"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe 2^>nul') do set MSBUILD_PATH=%%i

if not defined MSBUILD_PATH (
    echo ERROR: MSBuild not found! Please install Visual Studio 2019 or later.
    pause
    exit /b 1
)

echo Found MSBuild: %MSBUILD_PATH%
echo.

REM Build all configurations
echo Building GTA San Andreas...
"%MSBUILD_PATH%" FramerateVigilante.sln /p:Configuration="GTASA Release" /p:Platform=Win32 /v:minimal
if errorlevel 1 (echo Build failed! & pause & exit /b 1)

echo.
echo Building GTA Vice City...
"%MSBUILD_PATH%" FramerateVigilante.sln /p:Configuration="GTAVC Release" /p:Platform=Win32 /v:minimal
if errorlevel 1 (echo Build failed! & pause & exit /b 1)

echo.
echo Building GTA III...
"%MSBUILD_PATH%" FramerateVigilante.sln /p:Configuration="GTA3 Release" /p:Platform=Win32 /v:minimal
if errorlevel 1 (echo Build failed! & pause & exit /b 1)

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Output files:
echo - FramerateVigilante.SA.asi
echo - FramerateVigilante.VC.asi
echo - FramerateVigilante.III.asi
echo.
pause
