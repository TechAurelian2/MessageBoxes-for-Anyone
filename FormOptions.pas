{
  MessageBoxes for Anyone
  Copyright (C) 2003-2023 TechAurelian
  https://techaurelian.com

  Use of this source code is governed by the MIT license that can be found
  in the LICENSE file.
}

unit FormOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, CheckLst;

type
  TfrmOptions = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    chklistAdvanced: TCheckListBox;
    chklistStandard: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbClickedButton: TComboBox;
    Label4: TLabel;
    ediExecute: TEdit;
    cmdBrowseExecute: TButton;
    dlgExecute: TOpenDialog;
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdHelp: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cmdBrowseExecuteClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

uses Globals;

{$R *.dfm}

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  with chklistStandard.Items do
  begin
    Add('On top of all programs');
    Add('Add a help button');
    Add('Right-justify text');
    Add('Service notification');
  end;

  with chklistAdvanced.Items do
  begin
    Add('MB_APPLMODAL');
    Add('MB_TASKMODAL');
    Add('MB_DEFAULT_DESKTOP_ONLY');
    Add('MB_RTLREADING');
    Add('MB_SETFOREGROUND');
    Add('MB_TOPMOST');
    Add('MB_SERVICE_NOTIFICATION_NT3X');
  end;
end;

procedure TfrmOptions.cmdBrowseExecuteClick(Sender: TObject);
begin
  dlgExecute.FileName := ediExecute.Text;
  if dlgExecute.Execute then
    ediExecute.Text := dlgExecute.FileName;
end;

procedure TfrmOptions.cmdCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOptions.cmdOKClick(Sender: TObject);
begin
  CurMsgBoxUType := 0;

  if chklistStandard.Checked[0] then CurMsgBoxUType := CurMsgBoxUType or MB_SYSTEMMODAL;
  if chklistStandard.Checked[1] then CurMsgBoxUType := CurMsgBoxUType or MB_HELP;
  if chklistStandard.Checked[2] then CurMsgBoxUType := CurMsgBoxUType or MB_RIGHT;
  if chklistStandard.Checked[3] then CurMsgBoxUType := CurMsgBoxUType or MB_SERVICE_NOTIFICATION;
  if chklistAdvanced.Checked[0] then CurMsgBoxUType := CurMsgBoxUType or MB_APPLMODAL;
  if chklistAdvanced.Checked[1] then CurMsgBoxUType := CurMsgBoxUType or MB_TASKMODAL;
  if chklistAdvanced.Checked[2] then CurMsgBoxUType := CurMsgBoxUType or MB_DEFAULT_DESKTOP_ONLY;
  if chklistAdvanced.Checked[3] then CurMsgBoxUType := CurMsgBoxUType or MB_RTLREADING;
  if chklistAdvanced.Checked[4] then CurMsgBoxUType := CurMsgBoxUType or MB_SETFOREGROUND;
  if chklistAdvanced.Checked[5] then CurMsgBoxUType := CurMsgBoxUType or MB_TOPMOST;
  if chklistAdvanced.Checked[6] then CurMsgBoxUType := CurMsgBoxUType or MB_SERVICE_NOTIFICATION_NT3X;

  Application.MessageBox(Pchar(inttostr(CurMsgBoxUType)), '', 0);
  Close;
end;

end.
