unit uFundo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmFundo = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFundo: TfrmFundo;

implementation

{$R *.dfm}

procedure TfrmFundo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmFundo := nil;
end;

procedure TfrmFundo.Timer1Timer(Sender: TObject);
begin
  if Self.AlphaBlendValue = 0 then
  begin
    Self.AlphaBlendValue := 100;
  end
  else
  begin
    Self.AlphaBlendValue := 0;
  end;
end;

end.
