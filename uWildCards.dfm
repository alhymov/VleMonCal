object WildCardsEditor: TWildCardsEditor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072#1084
  ClientHeight = 165
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    338
    165)
  PixelsPerInch = 96
  TextHeight = 13
  object ValueListEditor1: TValueListEditor
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 332
    Height = 118
    Margins.Bottom = 44
    Align = alClient
    DisplayOptions = [doColumnTitles, doAutoColResize]
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowMoving, goEditing, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 0
    TitleCaptions.Strings = (
      #1053#1072#1095#1072#1083#1086' '#1080#1084#1077#1085#1080' '#1092#1072#1081#1083#1072
      #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1099#1081' '#1087#1088#1077#1092#1080#1082#1089)
    ColWidths = (
      163
      163)
    RowHeights = (
      18
      18)
  end
  object Button1: TButton
    Left = 174
    Top = 132
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 255
    Top = 132
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
