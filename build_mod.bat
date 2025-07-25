@echo off
echo =========================================
echo MCA Companion Mod Build Script
echo =========================================
echo.

REM Check if we're in the right directory
if not exist "build.gradle" (
    echo ERROR: build.gradle not found!
    echo Make sure you're running this script from the mca_companion folder.
    pause
    exit /b 1
)

echo Setting up Gradle wrapper...
if not exist "gradlew.bat" (
    echo Downloading Gradle Wrapper...
    curl -o gradle-wrapper.jar https://github.com/gradle/gradle/raw/master/gradle/wrapper/gradle-wrapper.jar
    echo @echo off > gradlew.bat
    echo set DIRNAME=%%~dp0 >> gradlew.bat
    echo if "%%DIRNAME%%" == "" set DIRNAME=. >> gradlew.bat
    echo set APP_BASE_NAME=%%~n0 >> gradlew.bat
    echo set APP_HOME=%%DIRNAME%% >> gradlew.bat
    echo java -jar "%%APP_HOME%%gradle-wrapper.jar" %%* >> gradlew.bat
)

echo.
echo =========================================
echo Building MCA Companion Mod...
echo =========================================
echo.

REM Clean previous builds
echo Cleaning previous builds...
if exist "build" rmdir /s /q build
if exist "run" rmdir /s /q run

REM Run Gradle build
echo Starting Gradle build...
call gradlew.bat build

if %ERRORLEVEL% == 0 (
    echo.
    echo =========================================
    echo BUILD SUCCESSFUL!
    echo =========================================
    echo.
    echo Your mod JAR file is located at:
    echo build\libs\mca_companion-1.0.jar
    echo.
    echo You can now:
    echo 1. Copy the JAR file to your Minecraft mods folder
    echo 2. Upload it to GitHub releases
    echo 3. Share it with others
    echo.
) else (
    echo.
    echo =========================================
    echo BUILD FAILED!
    echo =========================================
    echo.
    echo Check the error messages above.
    echo Make sure you have Java JDK 17+ installed.
    echo.
)

pause
