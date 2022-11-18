unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ComCtrls, StdActns, uGlobalVar, dmMain, fabout, frDicBrand;

type

  { TMainForm }

  TMainForm = class(TForm)
    DictonaryBrandAction: TAction;
    ActionList: TActionList;
    FileExitAction: TFileExit;
    HelpAboutAction: THelpAction;
    ImageList: TImageList;
    MainMenu: TMainMenu;
    miDictonaryBrand: TMenuItem;
    miDictonary: TMenuItem;
    miFile: TMenuItem;
    MenuItem10: TMenuItem;
    miFileExit: TMenuItem;
    miHelpAction: TMenuItem;
    miHelp: TMenuItem;
    MenuItem9: TMenuItem;
    PageControl: TPageControl;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    procedure DictonaryBrandActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
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

  lsEventLog.Info('MainForm created');
end;

procedure TMainForm.DictonaryBrandActionExecute(Sender: TObject);
var
  Brand: TTabSheet;
  Frame: TFrame;
begin
  Brand := PageControl.AddTabSheet;
  Brand.Caption := 'Brand';

  Frame := TDicBrandFrame.Create(Brand);
  Frame.Parent := Brand;
end;

procedure TMainForm.HelpAboutActionExecute(Sender: TObject);
var
  helpForm: TForm;
begin
  helpForm := TfrmAbout.Create(self);
  helpForm.ShowModal;
  helpForm.Free;
end;

end.

