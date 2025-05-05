unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Types;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnTest: TButton;
    edtTest: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblRandom: TLabel;
    Memo1: TMemo;
    procedure btnTestClick(Sender: TObject);
    procedure btnTestMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnTestMouseEnter(Sender: TObject);
    procedure btnTestMouseLeave(Sender: TObject);
    procedure btnTestMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtTestKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edtTestKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTestMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtTestMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure edtTestMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnTestClick(Sender: TObject);
begin
  lblRandom.Caption := FloatToStr(Random);
end;

procedure TfrmMain.btnTestMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lblRandom.Font.Color := clRed;
end;

procedure TfrmMain.btnTestMouseEnter(Sender: TObject);
begin
  lblRandom.Font.Color := clGreen;
end;

procedure TfrmMain.btnTestMouseLeave(Sender: TObject);
begin
  lblRandom.Font.Color := clBlack;
end;

procedure TfrmMain.btnTestMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lblRandom.Font.Color := clBlue;
end;

procedure TfrmMain.edtTestKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtTest.Font.Color := clRed;
end;

procedure TfrmMain.edtTestKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtTest.Font.Color := clBlue;
end;

procedure TfrmMain.edtTestMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BeginDrag(true);
end;

procedure TfrmMain.edtTestMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  num : integer;

begin
  num := StrToInt(edtTest.Text);
  if ssCtrl in Shift then
    num := num - 5
  else
    num := num - 1;

  if num < 0 then num := 0;
  edtTest.Text := IntToStr(num);

end;

procedure TfrmMain.edtTestMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  num : integer;

begin
  num := StrToInt(edtTest.Text);
  if ssCtrl in Shift then
    num := num + 5
  else
    num := num + 1;

  edtTest.Text := IntToStr(num);

end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if edtTest.Text = '0' then
    CanClose := true
  else
  begin
    CanClose := False;
    ShowMessage('ป้อนค่าเป็น 0 ก่อนปิดโปรแกรม');
  end;
end;

procedure TfrmMain.Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  Memo1.Lines.Add(edtTest.Text);
end;

procedure TfrmMain.Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

end.

