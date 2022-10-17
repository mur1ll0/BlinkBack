unit uPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvComponentBase,
  JvTrayIcon, TLHelp32;

type
  TfrmPrinc = class(TForm)
    Timer1: TTimer;
    JvTrayIcon1: TJvTrayIcon;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    timerCount: Integer;
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

{$R *.dfm}

uses
  uFundo;

//Matar processo pelo nome
function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
begin
  timerCount := 0;
end;

procedure TfrmPrinc.Timer1Timer(Sender: TObject);
begin
  timerCount := timerCount + 1;
  if timerCount > 50 then
  begin
    timerCount := 0;
    //Matar processo
    KillTask('WinDefBB.exe');
  end;

  try
    if not Assigned(frmFundo) then
    begin
      frmFundo := TfrmFundo.Create(nil);
      frmFundo.Show;
    end
    else if frmFundo <> nil then
    begin
      frmFundo.Close;
    end;
  except
  end;
end;

end.
