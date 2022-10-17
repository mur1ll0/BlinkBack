program WinDefBB;

uses
  Vcl.Forms,
  uPrinc in 'uPrinc.pas' {frmPrinc},
  uFundo in 'uFundo.pas' {frmFundo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.ShowMainForm := False;
  Application.Run;
end.
