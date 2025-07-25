@echo off
echo =========================================
echo Testing MCA Companion Mod
echo =========================================
echo.

REM Check if we're in the right directory
if not exist "build.gradle" (
    echo ERROR: build.gradle not found!
    pause
    exit /b 1
)

echo Compiling and launching Minecraft with your mod...
echo This will take a few minutes the first time.
echo.

call gradlew.bat runClient

echo.
echo Minecraft closed. Check the console above for any errors.
pause
