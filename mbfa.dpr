{
  MessageBoxes for Anyone
  Copyright (C) 2003-2023 TechAurelian
  https://techaurelian.com

  Use of this source code is governed by the MIT license that can be found
  in the LICENSE file.
}

program mbfa;

uses
  Forms,
  FormMain in 'FormMain.pas' {frmMain},
  FormOptions in 'FormOptions.pas' {frmOptions},
  Globals in 'Globals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
