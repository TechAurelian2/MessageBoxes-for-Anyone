object frmOptions: TfrmOptions
  Left = 194
  Top = 110
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 288
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 15
    Top = 16
    Width = 417
    Height = 209
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Message Box Type'
      object Label1: TLabel
        Left = 176
        Top = 24
        Width = 166
        Height = 13
        Caption = 'Other options (for advanced users):'
      end
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 39
        Height = 13
        Caption = 'Options:'
      end
      object chklistAdvanced: TCheckListBox
        Left = 176
        Top = 40
        Width = 217
        Height = 113
        ItemHeight = 13
        TabOrder = 0
      end
      object chklistStandard: TCheckListBox
        Left = 16
        Top = 40
        Width = 145
        Height = 113
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Button Actions'
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 24
        Width = 77
        Height = 13
        Caption = 'If the user clicks'
      end
      object Label4: TLabel
        Left = 16
        Top = 88
        Width = 121
        Height = 13
        Caption = 'Then execute or open file'
      end
      object cbClickedButton: TComboBox
        Left = 16
        Top = 40
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object ediExecute: TEdit
        Left = 16
        Top = 104
        Width = 313
        Height = 21
        TabOrder = 1
      end
      object cmdBrowseExecute: TButton
        Left = 334
        Top = 102
        Width = 57
        Height = 25
        Caption = 'Browse...'
        TabOrder = 2
        OnClick = cmdBrowseExecuteClick
      end
    end
  end
  object cmdOK: TButton
    Left = 97
    Top = 248
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 185
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object cmdHelp: TButton
    Left = 274
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
  end
  object dlgExecute: TOpenDialog
    Filter = 'Programs|*.EXE, *.LNK, *.COM, *.BAT|All Files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 228
    Top = 88
  end
end
