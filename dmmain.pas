unit dmMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, SQLDB, eventlog, uGlobalVar;

type

  { TMainDataModule }

  TMainDataModule = class(TDataModule)
    mainSQLConnector: TSQLConnector;
    mailSQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  public

  end;

var
  MainDataModule: TMainDataModule;

implementation

{$R *.lfm}

{ TMainDataModule }

procedure TMainDataModule.DataModuleCreate(Sender: TObject);
begin
  //Log initialization
  lsEventLog := TEventLog.Create(Self);
  lsEventLog.LogType        := ltFile;
  lsEventLog.FileName       := ExtractFilePath(Application.ExeName)+ 'log\' + ChangeFileExt(ExtractFileName(Application.ExeName),'.log');
  lsEventLog.Identification := 'Little shop';
  lsEventLog.CustomLogType  := 1;
  lsEventLog.AppendContent  := True;
  lsEventLog.Active         := True;
  lsEventLog.Log('Program started');
end;

procedure TMainDataModule.DataModuleDestroy(Sender: TObject);
begin
  lsEventLog.Log('Program stoped');
  lsEventLog.Free;
end;

end.

