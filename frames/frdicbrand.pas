unit frDicBrand;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, ComCtrls, DBGrids;

type

  { TDicBrandFrame }

  TDicBrandFrame = class(TFrame)
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    ilNavigatorButton: TImageList;
    tbNavigator: TToolBar;
    tbtSelect: TToolButton;
    tbtSeparator1: TToolButton;
    tbtAdd: TToolButton;
    tbtCopy: TToolButton;
    tbtEdit: TToolButton;
    ToolButton1: TToolButton;
  private

  public

  end;

implementation

{$R *.lfm}

end.

