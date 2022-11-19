unit frDicBrand;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, ComCtrls, DBGrids, ExtCtrls;

type

  { TDicBrandFrame }

  TDicBrandFrame = class(TFrame)
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    ilNavigatorButton: TImageList;
    ilNavigatorButton1: TImageList;
    pTop: TPanel;
    tbNavigator: TToolBar;
    tbtSelect: TToolButton;
    tbtSeparator1: TToolButton;
    tbtAdd: TToolButton;
    tbtCopy: TToolButton;
    tbtEdit: TToolButton;
    tbtDelete: TToolButton;
    tbtSeparator2: TToolButton;
    tbtRefresh: TToolButton;
    tbWindow: TToolBar;
    tbtClose: TToolButton;
    tbtHelp: TToolButton;
    procedure tbtCloseClick(Sender: TObject);
  private

  public

  end;

implementation

{$R *.lfm}

{ TDicBrandFrame }

procedure TDicBrandFrame.tbtCloseClick(Sender: TObject);
begin
  if DataSource.DataSet <> nil then
     DataSource.DataSet.Close;
  Parent.Free;
end;

end.

