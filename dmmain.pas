unit dmMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, IBConnection, SQLite3Conn;

type

  { TDataModuleMain }

  TDataModuleMain = class(TDataModule)
    mainSQLConnector: TSQLConnector;
    mailSQLTransaction: TSQLTransaction;
  private

  public

  end;

var
  DataModuleMain: TDataModuleMain;

implementation

{$R *.lfm}

end.

