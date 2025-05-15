unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnForWithBreak: TButton;
    btnForWithContinue: TButton;
    btnForWithExit: TButton;
    lblShow: TLabel;
    mmoShow: TMemo;
    procedure btnForWithBreakClick(Sender: TObject);
    procedure btnForWithContinueClick(Sender: TObject);
    procedure btnForWithExitClick(Sender: TObject);
  private
    procedure ForWithBreak;
    procedure ForWithContinue;
    procedure ForWithExit;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnForWithBreakClick(Sender: TObject);
begin
  ForWithBreak;
end;

procedure TfrmMain.btnForWithContinueClick(Sender: TObject);
begin
  ForWithContinue;
end;

procedure TfrmMain.btnForWithExitClick(Sender: TObject);
begin
  ForWithExit;
end;

procedure TfrmMain.ForWithBreak;
var
  I : integer;

begin
  mmoShow.Clear;

  for I := 1 to 10 do
  begin
    if I = 5 then
      Break
    else
      mmoShow.Lines.Add(I.ToString);
  end;
  mmoShow.Lines.Add('finish');
end;

procedure TfrmMain.ForWithContinue;
var
  I : integer;

begin
  mmoShow.Clear;

  for I := 1 to 10 do
  begin
    if I = 5 then
      Continue
    else
      mmoShow.Lines.Add(I.ToString);
  end;
  mmoShow.Lines.Add('finish');
end;

procedure TfrmMain.ForWithExit;
var
  I : integer;

begin
  mmoShow.Clear;

  for I := 1 to 10 do
  begin
    if I = 5 then
      Exit
    else
      mmoShow.Lines.Add(I.ToString);
  end;
  mmoShow.Lines.Add('finish');
end;

end.

