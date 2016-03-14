program test;

uses
  Vcl.Forms,
  test_main in 'test_main.pas' {gsm2gd_main},
  uSettings in 'uSettings.pas',
  uCalendar in 'uCalendar.pas' {frmCalendar},
  uWildCards in 'uWildCards.pas' {WildCardsEditor},
  uGetVersion in 'uGetVersion.pas',
  uPrevInst in 'uPrevInst.pas',
  uWindowPlacement in 'uWindowPlacement.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tgsm2gd_main, gsm2gd_main);
  if PreviousInstanceFound then
    Exit;
  Application.Run;
end.
