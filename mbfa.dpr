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
