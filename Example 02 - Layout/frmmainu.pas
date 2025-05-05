unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnChangeFormBorser: TButton;
    btnLeftTop: TButton;
    btnLeftButtom: TButton;
    btnRightTop: TButton;
    btnRightButtom: TButton;
    edtLeftRightTop: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lstBorderStyle: TListBox;
    mmoLeftTopButtom: TMemo;
    mmoLeftRightTopButtom: TMemo;
    PageControl1: TPageControl;
    pnlClientLeft: TPanel;
    pnlClientClient: TPanel;
    pnlClient: TPanel;
    pnlTop: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btnChangeFormBorserClick(Sender: TObject);
    procedure pnlClientClientMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlClientLeftMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnChangeFormBorserClick(Sender: TObject);
begin
  case lstBorderStyle.ItemIndex of
    //bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow,
    //                  bsSizeToolWin
    0 : self.BorderStyle := bsDialog;
    1 : self.BorderStyle := bsNone;
    2 : self.BorderStyle := bsSingle;
    3 : self.BorderStyle := bsSizeable;
    4 : self.BorderStyle := bsSizeToolWin;
    5 : self.BorderStyle := bsToolWindow;
  end;
end;

procedure TfrmMain.pnlClientClientMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StatusBar.Panels[0].Text := TPanel(Sender).Name;
  StatusBar.Panels[1].Text := IntToStr(X)+'/'+IntToStr(Y);
end;

procedure TfrmMain.pnlClientLeftMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StatusBar.Panels[0].Text := TPanel(Sender).Name;
  StatusBar.Panels[1].Text := IntToStr(X)+'/'+IntToStr(Y);
end;

procedure TfrmMain.pnlTopMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar.Panels[0].Text := TPanel(Sender).Name;
  StatusBar.Panels[1].Text := IntToStr(X)+'/'+IntToStr(Y);
end;



end.

