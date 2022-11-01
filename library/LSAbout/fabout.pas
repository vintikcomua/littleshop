unit fabout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LCLType, Buttons;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    bbtnClose: TBitBtn;
    BitBtn1: TBitBtn;
    imgLogo: TImage;
    lblLicense: TLabel;
    lblVersionText: TLabel;
    lblCopyrightText: TLabel;
    lblVersion: TLabel;
    lblCopyright: TLabel;
    lblDescription: TLabel;
    lblTitle: TLabel;
    lblLicenseText: TLabel;
  private

  public

  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.lfm}

{ TfrmAbout }






end.

