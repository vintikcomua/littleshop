unit frDicBrand;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, DBGrids;

type

  { TDicBrandFrame }

  TDicBrandFrame = class(TFrame)
    DBGrid: TDBGrid;
    NavigatorToolBar: TToolBar;
  private

  public

  end;

implementation

{$R *.lfm}

end.

