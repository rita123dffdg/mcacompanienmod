@echo off
echo Fixing Gradle Wrapper...

REM Create gradle wrapper directory
mkdir gradle\wrapper

REM Create gradle-wrapper.properties
(
echo distributionBase=GRADLE_USER_HOME
echo distributionPath=wrapper/dists
echo distributionUrl=https\://services.gradle.org/distributions/gradle-8.1.1-bin.zip
echo zipStoreBase=GRADLE_USER_HOME
echo zipStorePath=wrapper/dists
) > gradle\wrapper\gradle-wrapper.properties

REM Create gradlew.bat
(
echo @rem
echo @rem Copyright 2015 the original author or authors.
echo @rem
echo @if "%%DEBUG%%" == "" @echo off
echo @rem ##########################################################################
echo @rem
echo @rem  Gradle startup script for Windows
echo @rem
echo @rem ##########################################################################
echo.
echo @rem Set local scope for the variables with windows NT shell
echo if "%%OS%%"=="Windows_NT" setlocal
echo.
echo set DIRNAME=%%~dp0
echo if "%%DIRNAME%%" == "" set DIRNAME=.
echo set APP_BASE_NAME=%%~n0
echo set APP_HOME=%%DIRNAME%%
echo.
echo @rem Resolve any "." and ".." in APP_HOME to make it shorter.
echo for %%%%i in ^("%%APP_HOME%%"^) do set APP_HOME=%%%%~fi
echo.
echo @rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
echo set DEFAULT_JVM_OPTS=
echo.
echo @rem Find java.exe
echo if defined JAVA_HOME goto findJavaFromJavaHome
echo.
echo set JAVA_EXE=java.exe
echo %%JAVA_EXE%% -version ^>NUL 2^>^&1
echo if "%%ERRORLEVEL%%" == "0" goto execute
echo.
echo echo.
echo echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo echo.
echo echo Please set the JAVA_HOME variable in your environment to match the
echo echo location of your Java installation.
echo.
echo goto fail
echo.
echo :findJavaFromJavaHome
echo set JAVA_HOME=%%JAVA_HOME:"=%%
echo set JAVA_EXE=%%JAVA_HOME%%/bin/java.exe
echo.
echo if exist "%%JAVA_EXE%%" goto execute
echo.
echo echo.
echo echo ERROR: JAVA_HOME is set to an invalid directory: %%JAVA_HOME%%
echo echo.
echo echo Please set the JAVA_HOME variable in your environment to match the
echo echo location of your Java installation.
echo echo.
echo goto fail
echo.
echo :execute
echo @rem Setup the command line
echo.
echo set CLASSPATH=%%APP_HOME%%\gradle\wrapper\gradle-wrapper.jar
echo.
echo @rem Execute Gradle
echo "%%JAVA_EXE%%" %%DEFAULT_JVM_OPTS%% %%JAVA_OPTS%% %%GRADLE_OPTS%% -classpath "%%CLASSPATH%%" org.gradle.wrapper.GradleWrapperMain %%*
echo.
echo :end
echo @rem End local scope for the variables with windows NT shell
echo if "%%OS%%"=="Windows_NT" endlocal
echo.
echo :fail
echo rem Set variable GRADLE_EXIT_CONSOLE if you need the _script_ return code instead of
echo rem the _cmd_ return code
echo if not "" == "%%GRADLE_EXIT_CONSOLE%%" exit 1
echo exit /b 1
) > gradlew.bat

echo Gradle wrapper created successfully!
echo Now you can run your build scripts.
pause
