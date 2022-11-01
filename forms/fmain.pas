unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ComCtrls, StdActns, uGlobalVar, dmMain;

type

  { TMainForm }

  TMainForm = class(TForm)
    ActionList: TActionList;
    HelpAboutAction: THelpAction;
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

