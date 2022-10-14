unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ComCtrls, uGlobalVar, dmMain;

type

  { TMainForm }

  TMainForm = class(TForm)
    ActionList: TActionList;
    ImageList: TImageList;
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StatusBar.SimpleText := 'program started';

  lsEventLog.Log('MainFom created');
end;

end.

