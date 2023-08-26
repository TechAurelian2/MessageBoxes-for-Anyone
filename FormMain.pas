{
  MessageBoxes for Anyone
  Copyright (C) 2003-2023 TechAurelian
  https://techaurelian.com

  Use of this source code is governed by the MIT license that can be found
  in the LICENSE file.
}

unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, ImgList, XPMan, Menus;

type
  TfrmMain = class(TForm)
    StatusBar1: TStatusBar;
    imglistMsgBoxIcons: TImageList;
    XPManifest1: TXPManifest;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    MessageBox1: TMenuItem;
    Help1: TMenuItem;
    HelpTopics1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    est1: TMenuItem;
    Make1: TMenuItem;
    Exit1: TMenuItem;
    Image1: TImage;
    panClient: TPanel;
    Panel1: TPanel;
    Label6: TLabel;
    ediTitle: TEdit;
    Panel2: TPanel;
    Label7: TLabel;
    memoMessage: TMemo;
    Panel3: TPanel;
    Label8: TLabel;
    Label5: TLabel;
    cbButtons: TComboBox;
    cbDefaultButton: TComboBox;
    Panel4: TPanel;
    Label9: TLabel;
    cbIcons: TComboBoxEx;
    Panel5: TPanel;
    Label10: TLabel;
    Button1: TButton;
    panBottom: TPanel;
    Label11: TLabel;
    cmdTest: TButton;
    Button2: TButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    procedure cbButtonsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdTestClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses FormOptions, Globals;

{$R *.dfm}

const
  MB_CANCELTRYCONTINUE = $00000006;

procedure TfrmMain.cbButtonsChange(Sender: TObject);
begin
  with cbDefaultButton.Items do
  begin
    Clear;
    case cbButtons.ItemIndex of
      0: begin Add('OK'); end;
      1: begin Add('OK'); Add('Cancel'); end;
      2: begin Add('Yes'); Add('No'); Add('Cancel'); end;
      3: begin Add('Yes'); Add('No'); end;
      4: begin Add('Retry'); Add('Cancel'); end;
      5: begin Add('Abort'); Add('Retry'); Add('Ignore'); end;
      6: begin Add('Cancel'); Add('Try'); Add('Continue'); end;
    end;
  end;
  cbDefaultButton.ItemIndex := 0;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  CurMsgBoxUType := 0;
  with cbButtons.Items do
  begin
    Add('OK');
    Add('OK, Cancel');
    Add('Yes, No, Cancel');
    Add('Yes, No');
    Add('Retry, Cancel');
    Add('Abort, Retry, Ignore');
    Add('Cancel, Try, Continue (XP/2000)');
  end;

  cbButtons.ItemIndex := 0; cbButtons.OnChange(cbButtons);
  cbIcons.ItemIndex := 1;
end;

procedure TfrmMain.cmdTestClick(Sender: TObject);
var
  uType : UINT;
begin
  uType := CurMsgBoxUType;

  case cbButtons.ItemIndex of
    0: uType := uType or MB_OK;
    1: uType := uType or MB_OKCANCEL;
    2: uType := uType or MB_YESNOCANCEL;
    3: uType := uType or MB_YESNO;
    4: uType := uType or MB_RETRYCANCEL;
    5: uType := uType or MB_ABORTRETRYIGNORE;
    6: uType := uType or MB_CANCELTRYCONTINUE;
  end;

  case cbDefaultButton.ItemIndex of
    0: uType := uType or MB_DEFBUTTON1;
    1: uType := uType or MB_DEFBUTTON2;
    2: uType := uType or MB_DEFBUTTON3;
    3: uType := uType or MB_DEFBUTTON4;
  end;

  case cbIcons.ItemIndex of
    1: uType := uType or MB_ICONINFORMATION;
    2: uType := uType or MB_ICONQUESTION;
    3: uType := uType or MB_ICONEXCLAMATION;
    4: uType := uType or MB_ICONERROR;
  end;

//  if chkShowOnTop.Checked then uType := uType or MB_SYSTEMMODAL;

  MessageBox(Handle, PChar(memoMessage.Text), PChar(ediTitle.Text), uType);
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  with frmOptions do
  begin
    cbClickedButton.Items.Clear;
    cbClickedButton.Items.AddStrings(cbDefaultButton.Items);
    if cbClickedButton.Items.Count > 0 then cbClickedButton.ItemIndex := 0;
    ShowModal;
  end;
end;

end.
