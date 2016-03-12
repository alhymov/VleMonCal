unit uCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Winapi.CommCtrl, Vcl.ValEdit;

type
  TMonthCalendar = class( Vcl.ComCtrls.TMonthCalendar )
    procedure CNNotify(var Message: TWMNotifyMC); message CN_NOTIFY;
  end;

  TfrmCalendar = class(TForm)
    MonthCalendar1: TMonthCalendar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FOK: Boolean;
    FCallBack: TProc<Boolean,TDateTime>;
    FVLE: TValueListEditor;
    procedure WMClose(var Message: TMessage); message WM_CLOSE;
    procedure SetDate( AValue: TDateTime );
    function GetDate: TDateTime;
    property Date: TDateTime read GetDate write SetDate;
  end;

procedure PopUp( AVLE: TValueListEditor; ACalBack: TProc<Boolean,TDateTime> = nil );
///Example:
///    uCalendar.PopUp( vle, procedure ( AOK:Boolean; ADate: TDateTime ) begin
///    Memo1.Lines.Insert( 0, DateTimeToStr( Now ) + '  I''m back! ' +BoolToStr( AOK, True ) + ' ' + DateToStr( ADate ));
///  end );



implementation

{$R *.dfm}


type
  //Access ToInplaceEditor
  TVLE = class(Vcl.ValEdit.TValueListEditor)  end;

procedure PopUp( AVLE: TValueListEditor; ACalBack: TProc<Boolean,TDateTime> );
var
  H: Integer;
  R: TRect;
begin
  with TfrmCalendar.Create( Application ) do begin
    FVLE := AVLE; //Save for FormClose
    FCallBack := ACalBack;
    Date := StrToDateDef( FVLE.Cells[ 1, FVLE.Row ], System.SysUtils.Date );
    BoundsRect := MonthCalendar1.BoundsRect; //No space around Calendar
    TVLE( FVLE ).InplaceEditor.Enabled := False; //No click on edit button
    R := AVLE.CellRect( AVLE.Col, AVLE.Row ); //Locstion of current editor
    H := R.Height;
    R.TopLeft := FVLE.{We are in other form}ClientToScreen( R.BottomRight );
    if R.Top + Height > Screen.Height
    then
      R.Top := R.Top - Height - H
    else
      R.Top := R.Top;
    Top := R.Top;
    Left := R.Left - Width;
    Show;
  end;
end;

procedure TfrmCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Tag := 1; //InClose
  Action := caFree;
  TVLE( FVLE ).InplaceEditor.Enabled := True;
  if FOK then
    FVLE.Cells[ 1, FVLE.Row ] := DateToStr( Date );
  if Assigned( FCallBack ) then
    FCallBack( FOK, Date );
end;

procedure TfrmCalendar.FormDeactivate(Sender: TObject);
begin
  if Tag = 0 then
    Close;
end;

procedure TfrmCalendar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
    Close;
end;

function TfrmCalendar.GetDate: TDateTime;
begin
  Result := MonthCalendar1.Date;
end;

procedure TfrmCalendar.SetDate(AValue: TDateTime);
begin
  MonthCalendar1.Date := AValue;
end;

procedure TfrmCalendar.WMClose(var Message: TMessage);
begin
  FOK := Message.WParam <> 0;
  inherited;
end;

function IsBlankSysTime(const ST: TSystemTime): Boolean;
type
  TFast = array [0..3] of DWORD;
begin
  Result := (TFast(ST)[0] or TFast(ST)[1] or TFast(ST)[2] or TFast(ST)[3]) = 0;
end;

{ TMonthCalendar }

procedure TMonthCalendar.CNNotify(var Message: TWMNotifyMC);
begin
  inherited;
  if ( Message.NMHdr^.code =  MCN_SELECT )
  and not IsBlankSysTime( Message.NMSelChange^.stSelStart )
  and Assigned( Parent )
  then
    PostMessage( Parent.Handle, WM_CLOSE, 1, 0 );
end;

end.
