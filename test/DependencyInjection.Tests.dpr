program DependencyInjection.Tests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options 
  to use the console test runner.  Otherwise the GUI test runner will be used by 
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  UDependencyInjection.Tests in 'UDependencyInjection.Tests.pas',
  DependencyInjection.Tests.Fakes.ITestService in 'fakes\DependencyInjection.Tests.Fakes.ITestService.pas',
  DependencyInjection.Tests.Fakes.TestService in 'fakes\DependencyInjection.Tests.Fakes.TestService.pas',
  ServiceContainer in '..\src\ServiceContainer.pas',
  ServiceDescriptor in '..\src\ServiceDescriptor.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.


