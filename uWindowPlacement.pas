unit uWindowPlacement;

interface
uses
  VCL.Forms;

procedure Store( F: TForm );
procedure Restore( F: TForm );

implementation

uses
  WinApi.Windows, System.Inifiles, System.SysUtils;

procedure Store( F: TForm );
var
  wp: TWindowPlacement;
begin
  with TIniFile.Create( ChangeFileExt( Application.ExeName, '.ini' ) ) do
  try
    wp.length := SizeOf( TWindowPlacement );
    GetWindowPlacement( F.Handle, @wp );
    with wp.rcNormalPosition do begin
      WriteInteger( F.ClassName, 'Left', Left );
      WriteInteger( F.ClassName, 'Top', Top );
      WriteInteger( F.ClassName, 'Width', Right - Left );
      WriteInteger( F.ClassName, 'Height', Bottom - Top );
    end;
    WriteBool(F.ClassName, 'Maximized', F.WindowState = wsMaximized );
  finally Free;
  end;
end;

procedure Restore( F: TForm );
begin
  with TIniFile.Create( ChangeFileExt( Application.ExeName, '.ini' ) ) do
  try
    F.Left   := ReadInteger( F.ClassName, 'Left'  , F.Left );
    F.Top    := ReadInteger( F.ClassName, 'Top'   , F.Top );
    F.Width  := ReadInteger( F.ClassName, 'Width' , F.Width );
    F.Height := ReadInteger( F.ClassName, 'Height', F.Height );
    if ReadBool(F.ClassName, 'Maximized', F.WindowState = wsMaximized ) then
      F.WindowState := wsMaximized;
  finally Free;
  end;
end;


end.
