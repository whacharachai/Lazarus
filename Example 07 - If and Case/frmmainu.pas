unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnCase1: TButton;
    btnCase2: TButton;
    btnCase: TButton;
    edtI: TLabeledEdit;
    edtC: TLabeledEdit;
    lblResult: TLabel;
    lblResultCase: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure btnCase1Click(Sender: TObject);
    procedure btnCase2Click(Sender: TObject);
    procedure btnCaseClick(Sender: TObject);
  private
    x : Variant;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnCase1Click(Sender: TObject);
var
  I : integer;

begin
  I := string(edtI.Text).ToInteger;
  lblResult.caption := '';

  If I >= 10 then
    if I < 15 then lblResult.Caption := '10 < I < 15'
  else
    lblResult.Caption := 'I < 10';
end;

procedure TfrmMain.btnCase2Click(Sender: TObject);
var
  I : integer;

begin
  I := string(edtI.Text).ToInteger;
  lblResult.caption := '';

  If I >= 10 then
  begin
    if I < 15 then lblResult.Caption := '10 < I < 15'
  end else
    lblResult.Caption := 'I < 10';
end;

procedure TfrmMain.btnCaseClick(Sender: TObject);
var
  C : Char;

begin
  C := LowerCase(edtC.Text[1]);
  Case C of
   'a','e','i','o','u' : lblResultCase.Caption := 'สระ';
   '0'..'9' : lblResultCase.Caption := 'ตัวเลข';
  else
    lblResultCase.Caption := 'วรรณยุกต์';
  end;end;

end.

