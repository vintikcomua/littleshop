unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ComCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    ActionList: TActionList;
    ImageList: TImageList;
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

end.

