unit uWildCards;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ValEdit;

type
  TWildCardsEditor = class(TForm)
    ValueListEditor1: TValueListEditor;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PopUp( var AValue: String ): Boolean;

implementation

{$R *.dfm}

function PopUp( var AValue: String ): Boolean;
begin
  with TWildCardsEditor.Create( Application ) do
  try
    with ValueListEditor1.Strings do begin
      QuoteChar := #0;
      Delimiter := ',';
      try    DelimitedText := AValue;
      except //Silent. User can see everything with own eyes.
      end;
      Result := ShowModal = mrOk;

      if Result then
        AValue := DelimitedText;
    end;
  finally Free;
  end;
end;

end.
