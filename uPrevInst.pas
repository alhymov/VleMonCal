unit uPrevInst;

interface

function PreviousInstanceFound: Boolean;

implementation
uses
  Winapi.Windows, Vcl.Forms, System.SysUtils;

function PreviousInstanceFound: Boolean;
var
  TheHWnd : THandle;
  WinClass: array [0..255] of Char;
begin
  Result := False;
  TheHWnd := GetWindow(Application.Handle, gw_HWndFirst);
  while TheHWnd <> 0 do begin
    if ( TheHWnd <> Application.MainFormHandle ) and
       ( GetWindow( TheHWnd, gw_Owner) = 0 )
    then begin
      GetClassName(TheHWnd, WinClass, 255);
      if SameText( WinClass, Application.MainForm.ClassName ) then begin
        ShowWindow( TheHWnd, SW_SHOWNORMAL );
        SetForegroundWindow( TheHWnd );
        Application.Terminate;
        Result := True;
      end;
    end;
    theHWnd := GetWindow(TheHWnd, gw_hWndNext);
  end;
end;

end.
