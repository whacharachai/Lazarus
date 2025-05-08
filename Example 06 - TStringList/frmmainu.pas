unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  naturalsortunit;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnReadFile: TButton;
    btnSort: TButton;
    btnNaturalSort: TButton;
    edtLine: TEdit;
    lblST: TLabel;
    lblSS: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    SpinEdit1: TSpinEdit;
    procedure btnNaturalSortClick(Sender: TObject);
    procedure btnReadFileClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    DataFileName : string;
    st : TStringList;

    procedure ReadLine;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
var
  AppPath: string;

begin
  AppPath := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName));
  DataFileName := AppPath + 'data/data.txt';
  memo1.Lines.LoadFromFile(DataFileName);
  st := TStringList.Create;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  st.Free;
end;

procedure TfrmMain.SpinEdit1Change(Sender: TObject);
begin
  ReadLine;
end;

procedure TfrmMain.ReadLine;
var
  ss : TStringList;
  I : integer;

begin
  edtLine.Text := st[SpinEdit1.Value];
  ss := TStringList.Create;
  ss.Delimiter := ',';
  ss.DelimitedText := edtLine.Text;

  memo2.Clear;
  for I := 0 to ss.count-1 do
  begin
    memo2.Lines.Add(ss[I]);
  end;
  memo2.SelStart := 0;

  lblSS.Caption := 'SS [0-'+IntToStr(ss.Count-1)+'] ('+inttostr(ss.count)+' elements)';

  ss.free;
end;

procedure TfrmMain.btnReadFileClick(Sender: TObject);
begin
  st.LoadFromFile(DataFileName);
  SpinEdit1.MaxValue := st.Count-1;
  SpinEdit1.Value := 0;
  edtLine.Text := st[0];
  lblST.Caption := 'ST [0-'+IntToStr(st.Count-1)+'] ('+inttostr(st.count)+' elements)';
  ReadLine;
end;

procedure TfrmMain.btnNaturalSortClick(Sender: TObject);
var
  SortLine : TStringList;
begin
  SortLine := TStringList.Create;

  SortLine.Assign(Memo3.Lines);

  NaturalSort(SortLine, stNatural);

  memo4.lines.Assign(SortLine);
end;

procedure TfrmMain.btnSortClick(Sender: TObject);
var
  SortLine : TStringList;
begin
  SortLine := TStringList.Create;

  SortLine.Assign(Memo3.Lines);
  SortLine.Sort;

  memo4.lines.Assign(SortLine);
end;

end.

