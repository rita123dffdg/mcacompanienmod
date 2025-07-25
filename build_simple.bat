@echo off
echo Building MCA Companion Mod...

REM Check if we have gradlew.bat
if not exist "gradlew.bat" (
    echo Error: gradlew.bat not found!
    echo Please run fix_gradle.bat first.
    pause
    exit /b 1
)

REM Clean and build
echo Cleaning previous builds...
call gradlew.bat clean

echo Building mod...
call gradlew.bat build

if %ERRORLEVEL% == 0 (
    echo.
    echo SUCCESS! Your mod is built!
    echo Location: build\libs\mca_companion-1.0.jar
) else (
    echo.
    echo BUILD FAILED!
    echo Check errors above.
)

pause
