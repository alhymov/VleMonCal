unit uGetVersion;

interface

function  GetVersionInfoText: String;


implementation
uses
  Winapi.Windows, System.SysUtils;

function  GetVersionInfoText: String;
//  const
//    viKeys: array [1..11] of String = ('CompanyName', 'FileDescription', 'FileVersion',
//    'SpecialBuild',
//    'InternalName', 'LegalCopyright', 'LegalTradeMark', 'OriginalFileName',
//    'ProductName', 'ProductVersion', 'Comments');
type
  TCharSet = array [0..1] of WORD;
var
  PCharSet  : ^TCharSet;
  PPCharSet : Pointer absolute PCharSet;
  dump      : Cardinal;
  FileName  : String;
  viKey     : String;
  viSize    : DWORD;
  viData    : Pointer;
  viValue   : Pointer;
begin

  FileName := ParamStr(0);
  viSize := GetFileVersionInfoSize( PWideChar( FileName ), dump );
  viData := AllocMem( viSize );
  try
    GetFileVersionInfo( PChar( FileName ), dump, viSize, viData);
    VerQueryValue( viData, '\VarFileInfo\Translation', PPCharSet, viSize);

//      for viKey in viKeys do begin
      viKey := 'FileVersion';
      VerQueryValue(viData,
        PChar(Format('\StringFileInfo\%.4x%.4x\%s',
          [PCharSet^[0], PCharSet^[1], viKey])),
        viValue, viSize);
      if viSize > 0 then
        Result := {Result + #13#10'        ' + }PChar( viValue );
//      end;

   finally
     FreeMem( viData );
   end;
end;

end.
