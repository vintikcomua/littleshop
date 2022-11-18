unit dmMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, SQLDB, SQLite3Conn, PQConnection, eventlog,
  IniFiles, uGlobalVar;

type

  { TMainDataModule }

  TMainDataModule = class(TDataModule)
    mainSQLConnector: TSQLConnector;
    mainSQLTransaction: TSQLTransaction;
    qBrand: TSQLQuery;
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
var
  DataBaseName: String;
begin
  //Log initialization
  lsEventLog := TEventLog.Create(Self);
  lsEventLog.DefaultEventType := TEventType.etInfo;
  lsEventLog.LogType          := ltFile;
  lsEventLog.FileName         := ExtractFilePath(Application.ExeName)+ 'log/' + ChangeFileExt(ExtractFileName(Application.ExeName),'.log');
  lsEventLog.Identification   := 'Little shop';
  //lsEventLog.CustomLogType    := 1;
  lsEventLog.AppendContent    := True;
  lsEventLog.Active           := True;
  lsEventLog.Info('Program started');

  //Load saved properties init
  lsIniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));

  mainSQLConnector.ConnectorType := lsIniFile.ReadString('DataBase', 'ConnectorType', 'SQLite3');    // (Section, Key, Default)
  //DataBaseName := ExtractFilePath(Application.ExeName)+ 'db/' + ChangeFileExt(ExtractFileName(Application.ExeName),'.db');
  DataBaseName :=  'db/' + ChangeFileExt(ExtractFileName(Application.ExeName),'.db');
  mainSQLConnector.DatabaseName := lsIniFile.ReadString('DataBase', 'DatabaseName', DataBaseName);
  mainSQLConnector.UserName := lsIniFile.ReadString('DataBase', 'UserName', '');
  mainSQLConnector.Password := lsIniFile.ReadString('DataBase', 'Password', '');

  try
    mainSQLConnector.Open;
    lsEventLog.Info('Database open ok');
  except
    on E: Exception do
       lsEventLog.Error('Database error: '+ E.ClassName + #13#10 + E.Message );
  end;

  mainSQLTransaction.Active := True;
  lsEventLog.Info('Тransaction active');
end;

procedure TMainDataModule.DataModuleDestroy(Sender: TObject);
begin
  //Close log file
  lsEventLog.Info('Program stoped');
  lsEventLog.Free;

  //Save database setting on exit
  lsIniFile.WriteString('DataBase', 'ConnectorType', mainSQLConnector.ConnectorType);
  lsIniFile.WriteString('DataBase', 'DatabaseName', mainSQLConnector.DatabaseName);
  lsIniFile.WriteString('DataBase', 'UserName', mainSQLConnector.UserName);
  lsIniFile.WriteString('DataBase', 'Password', mainSQLConnector.Password);
  lsIniFile.Free;
end;

end.

