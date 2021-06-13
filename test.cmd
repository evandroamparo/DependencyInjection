@echo off

setlocal

set DELPHI_ROOT=%ProgramFiles(x86)%\CodeGear\RAD Studio\5.0
call "%DELPHI_ROOT%\bin\rsvars.bat"

msbuild test\DependencyInjection.Tests.dproj /nologo /target:Build /verbosity:quiet
if %ERRORLEVEL% neq 0 exit /b 1

bin\DependencyInjection.Tests.exe

:: cd tests\coverage
:: call dcov_execute.cmd
