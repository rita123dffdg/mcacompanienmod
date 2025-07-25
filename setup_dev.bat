@echo off
echo =========================================
echo MCA Companion Mod Development Setup
echo =========================================
echo.

REM Check if we're in the right directory
if not exist "build.gradle" (
    echo ERROR: build.gradle not found!
    echo Make sure you're running this script from the mca_companion folder.
    pause
    exit /b 1
)

echo Setting up development environment...
echo.

REM Generate IDE files
echo Generating IDE configuration files...
call gradlew.bat genEclipseRuns genIntellijRuns

REM Setup workspace
echo Setting up Minecraft development workspace...
call gradlew.bat setupDecompWorkspace

if %ERRORLEVEL% == 0 (
    echo.
    echo =========================================
    echo DEVELOPMENT SETUP COMPLETE!
    echo =========================================
    echo.
    echo You can now:
    echo 1. Open the project in IntelliJ IDEA or Eclipse
    echo 2. Run 'gradlew.bat runClient' to test your mod
    echo 3. Start developing!
    echo.
    echo To test your mod:
    echo - Run: gradlew.bat runClient
    echo.
) else (
    echo.
    echo =========================================
    echo SETUP FAILED!
    echo =========================================
    echo.
    echo Check the error messages above.
    echo Make sure you have Java JDK 17+ installed.
    echo.
)

pause
