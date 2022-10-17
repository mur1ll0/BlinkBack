object frmFundo: TfrmFundo
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderStyle = bsNone
  Caption = 'frmFundo'
  ClientHeight = 338
  ClientWidth = 651
  Color = cl3DDkShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 40
    Top = 24
  end
end
