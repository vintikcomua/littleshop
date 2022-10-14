unit uGlobalVar;
{
  This module is intended for storage global varibles
  This unit uses in all modules
}

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, eventlog, IniFiles;

var
  //This component using for loggin events
  //varible initialize in TMainDataModule.DataModuleCreate
  lsEventLog: TEventLog;


  //This component using for saving properties
  lsIniFile: TIniFile;

implementation


end.

