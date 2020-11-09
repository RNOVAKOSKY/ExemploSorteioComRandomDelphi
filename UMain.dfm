object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Exemplos de Sorteio dom Random'
  ClientHeight = 467
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 56
    Width = 145
    Height = 25
    Caption = 'Sorteio M'#233'dodo 1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 32
    Top = 96
    Width = 521
    Height = 337
    Lines.Strings = (
      'Utilizados somente array nesses exemplos'
      'mas podem ser modificados para TList'
      'ClientDataSet, etc ....')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button2: TButton
    Left = 183
    Top = 56
    Width = 145
    Height = 25
    Caption = 'Sorteio M'#233'dodo 2'
    TabOrder = 2
    OnClick = Button2Click
  end
end
