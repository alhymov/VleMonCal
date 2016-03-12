unit uSettings;

interface
uses
  System.Classes,
  Vcl.Grids;

type
  TKey = (
    Folder,
    WildCards,
    DBServer,
    DBFolder,
    Delay,
    OneDay,
    Date,
    RetryDelay);

const
  KeyDesc: array [ TKey ] of String = (
    'Путь до каталогов YYYY\MM\DD',
    'Соответствие файлов номенклатурам',
    'Сервер БД',
    'Префикс БД',
    'Пауза между проверками (сек)',
    'Однократно, за указанную дату',
    'Указанная дата',
    'Перезапустить после  сбоя через (минуты)');

  BoolStrs: array [Boolean] of String = (
    'Нет', 'Да');

var
  KeyName: array [ TKey ] of String;
  WildCardsArray: array of Record FilePrefix, NomenPrefix: String end;
  NDelay, NRetryDelay: Integer;
  ThisDate: TDateTime;


procedure CheckKeyValue( AKey: TKey; AValue: String );

implementation/////////////////////////////////////////////////
uses
  System.TypInfo, System.StrUtils, System.SysUtils, System.IOUtils, System.Math;

procedure Init;
var
  K: TKey;
begin
  for K := Low( TKey ) to High( TKey ) do
    KeyName[ K ] := GetEnumName( TypeInfo( TKey ), Ord( K ) );
end;


procedure ParseWildCards( AValue: String );
var
  I: Integer;
  J: Integer;
begin
  with TStringList.Create do
  try
    Delimiter := ',';
    QuoteChar := #0;

    try    DelimitedText := AValue;
    except
      raise Exception.Create( 'Общая ошибка формата.' );
    end;

    if Count < 1 then
      raise Exception.Create( 'Нет сопоставлений.' );

    for I := 0 to Count-1 do begin
      if Names[ I ].Trim.IsEmpty then
        raise Exception.Create( 'Пустое начало имени файла.' );

      if ValueFromIndex[ I ].Trim.IsEmpty  then
        raise Exception.Create( 'Пустой номенклатурный префикс.' );

      for J := I-1 downto 0 do
      if SameText( Names[ I ], Names[ J ] ) then
        raise Exception.Create( 'Повторение начала имени файла.' );
    end;

    SetLength( WildCardsArray, Count );
    for I := 0 to Count-1 do
    with WildCardsArray[ I ] do begin
      FilePrefix := Names[ I ];
      NomenPrefix := ValueFromIndex[ I ];
    end;

  finally Free;
  end;
end;

function ParseDelay( AValue: String; RangeMin, RangeMax: Integer; var N: Integer ): Boolean;
begin
  Result := TryStrToInt( AValue, N ) and InRange( N, RangeMin, RangeMax );
end;

// Warning: Check Date only when OneDay is True
procedure CheckKeyValue( AKey: TKey; AValue: String );
var
  K: TKey absolute AKey;
begin
//   K := TKey( IndexText( AKey, KeyName ) );
  if AValue.Trim.IsEmpty then
    raise EArgumentException.CreateFmtHelp( 'Не заполнено значение "%s"', [ KeyDesc[ K ] ], Integer( K ) );

  case K of
//    Folder:
//    if not TDirectory.Exists( AValue ) then
//      raise EPathNotFoundException.CreateFmtHelp( 'Указанный %s не существует!', [ KeyDesc[ K ] ], Integer( K ) );

    WildCards: try ParseWildCards( AValue )
    except on E: Exception do
      raise EArgumentException.CreateFmtHelp( '"%s" - %s!', [ KeyDesc[ K ], E.Message ], Integer( K ) );
    end;

//    DBServer: begin
//    end;
//    DBFolder: begin
//    end;

    Delay: if not ParseDelay( AValue, 0, 3600, NDelay )  then
      raise EArgumentException.CreateFmtHelp( '%s не попадает в [0..3600]!', [ KeyDesc[ K ] ], Integer( K ) );

//    OneDay: begin
//    end;

    Date: if not TryStrToDate( AValue, ThisDate ) then
      raise EArgumentException.CreateFmtHelp( '%s не действительна!', [ KeyDesc[ K ] ], Integer( K ) );

    RetryDelay: if not ParseDelay( AValue, 0, 120, NRetryDelay )  then
      raise EArgumentException.CreateFmtHelp( '"%s" не попадает в [0..120]!', [ KeyDesc[ K ] ], Integer( K ) );

//    else
//      raise ERangeError.CreateHelp('неизвестный параметр', Integer( K ) );
  end;
end;


initialization
  Init;

finalization

end.
