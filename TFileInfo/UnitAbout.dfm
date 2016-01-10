object AboutForm: TAboutForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'About'
  ClientHeight = 90
  ClientWidth = 258
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    258
    90)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 258
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 'TFileInfo 1.0'
    ExplicitWidth = 61
  end
  object Label2: TLabel
    Left = 0
    Top = 13
    Width = 258
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = '(C) 2015 - ozok26@gmail.com'
    ExplicitWidth = 143
  end
  object Label3: TLabel
    Left = 0
    Top = 26
    Width = 258
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 'ozok26.com'
    ExplicitWidth = 57
  end
  object Button4: TButton
    Left = 8
    Top = 57
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Home'
    TabOrder = 0
    OnClick = Button4Click
    ExplicitTop = 136
  end
  object Button1: TButton
    Left = 175
    Top = 57
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 274
    ExplicitTop = 136
  end
  object Button2: TButton
    Left = 89
    Top = 57
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Donate'
    TabOrder = 2
    OnClick = Button2Click
    ExplicitTop = 136
  end
end
