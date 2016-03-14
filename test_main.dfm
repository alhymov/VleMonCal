object gsm2gd_main: Tgsm2gd_main
  Left = 0
  Top = 0
  Caption = 'gsm2gd_main'
  ClientHeight = 293
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object vle: TValueListEditor
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 510
    Height = 152
    Align = alClient
    DefaultColWidth = 250
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    FixedCols = 1
    Options = [goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ParentShowHint = False
    ShowHint = False
    Strings.Strings = (
      #1055#1091#1090#1100' '#1076#1086' '#1082#1072#1090#1072#1083#1086#1075#1086#1074' YYYY\MM\DD=\\srvfs\granit\Call_Records\'
      
        #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072#1084'=q-10-=O'#1057'-80-,q-11-=O'#1057'-80-,q-13' +
        '-=O'#1057'-81-'
      #1057#1077#1088#1074#1077#1088' '#1041#1044'=10.49.21.110'
      #1055#1088#1077#1092#1080#1082#1089' '#1041#1044'=gri'
      #1055#1072#1091#1079#1072' '#1084#1077#1078#1076#1091' '#1087#1088#1086#1074#1077#1088#1082#1072#1084#1080' ('#1089#1077#1082')=60'
      #1054#1076#1085#1086#1082#1088#1072#1090#1085#1086', '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1091#1102' '#1076#1072#1090#1091'='#1085#1077#1090
      #1059#1082#1072#1079#1072#1085#1085#1072#1103' '#1076#1072#1090#1072'=17.09.2014'
      #1055#1077#1088#1077#1079#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1089#1083#1077'  '#1089#1073#1086#1103' '#1095#1077#1088#1077#1079' ('#1084#1080#1085#1091#1090#1099')=2')
    TabOrder = 0
    TitleCaptions.Strings = (
      'Key'
      'Value'
      'x')
    OnEditButtonClick = vleEditButtonClick
    OnGetPickList = vleGetPickList
    ColWidths = (
      250
      254)
    RowHeights = (
      18
      18
      18
      17
      18
      18
      16
      18)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 97
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 189
      Top = 37
      Width = 316
      Height = 49
      AutoSize = False
      Caption = 
        #1060#1086#1088#1084#1072#1090' '#1087#1086#1083#1103' "'#1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072#1084'":'#13'  <'#1087#1088#1077#1092#1080#1082#1089' '#1092#1072#1081#1083 +
        #1072'>=<'#1087#1088#1077#1092#1080#1082#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'>,...'#13', '#1075#1076#1077' <'#1087#1088#1077#1092#1080#1082#1089' '#1092#1072#1081#1083#1072'> - '#1085#1077#1087#1086#1074#1090#1086#1088#1103#1102#1097#1077#1077 +
        #1089#1103' '#1079#1085#1072#1095#1077#1085#1080#1077'.'
      WordWrap = True
    end
    object Image1: TImage
      Left = 51
      Top = 17
      Width = 48
      Height = 48
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        00300804000000FD0B310C00000002624B474400FF878FCCBF00000009704859
        7300000B1300000B1301009A9C18000000F54944415478DA632C65A02D601C4C
        169833B401C94A8653B4B0409BA1852100CADEC050C370959A16283234324433
        302189FC6358CA50CF709F1A164830D432A432B06291F9C5301BE8AB17945820
        C850C690C7C08547F73786490C5D0CEFC9B1809B219FA19441808830F800B462
        22D02A122C6063480346A3381186C3C00B86568659C04023C202268658860606
        05120C8781FB407D4B80D18FD7824060B4699161380C5C03FA7C3D2E0B9C81D9
        C88C02C361E0144315C35E6C16FCA782E17053472D20CB021A81510BC8B00039
        B21929101FB560D482510B462D18D91650198C5A40820543BF5D346AC1C05B40
        23306A01410000BB726D216DF0690B0000000049454E44AE426082}
      Transparent = True
    end
    object Label2: TLabel
      Left = 189
      Top = 17
      Width = 65
      Height = 14
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object laVersion: TLabel
      Left = 3
      Top = 71
      Width = 150
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'laVersion'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 255
    Width = 516
    Height = 38
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 11
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1091#1089#1082
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
