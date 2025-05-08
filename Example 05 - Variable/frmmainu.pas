unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Grids, TypInfo;

type
  TFullname = record
    FirstName, LastName : string;
  end;

  TPhone = (iOS, Android, HarmonyOS);

  person = record
    name : TFullname;
    age : integer;
    Phone : TPhone;
  end;



  { TfrmMain }
  TfrmMain = class(TForm)
    btnAddSingle: TButton;
    btnAddString: TButton;
    edtA: TLabeledEdit;
    edtB: TLabeledEdit;
    edtDelete: TButton;
    btnEdit: TButton;
    btnProcess: TButton;
    btnAdd: TButton;
    cmbOS: TComboBox;
    edit1: TLabeledEdit;
    edit2: TLabeledEdit;
    edtAge: TLabeledEdit;
    edtLastName: TEdit;
    Label1: TLabel;
    lblAsSingle: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtFirstName: TLabeledEdit;
    Label8: TLabel;
    Label9: TLabel;
    lblAsString: TLabel;
    StringGrid1: TStringGrid;
    procedure btnAddClick(Sender: TObject);
    procedure btnAddSingleClick(Sender: TObject);
    procedure btnAddStringClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
    procedure edtDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
  private
    people : array of person;
    A, B : Variant;

    procedure FillGrid(n : integer);
    procedure ExtractRow(n: integer);
    procedure FillEdit(n:integer);
    procedure FillPeople(n:integer);
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnProcessClick(Sender: TObject);
begin
  Label1.Caption := (string(edit1.Text).ToDouble + string(edit2.Text).ToDouble).ToString;
end;

procedure TfrmMain.edtDeleteClick(Sender: TObject);
var
  n : integer;
begin
  n := StringGrid1.Row;
  Delete(people, n-1,1);
  StringGrid1.DeleteRow(n);
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  n : integer;

begin
  n := length(people);
  n := n+1;
  SetLength(people,n);
  FillPeople(n-1);
  FillGrid(n);
end;

procedure TfrmMain.btnAddSingleClick(Sender: TObject);
begin
  A := string(edtA.Text).ToSingle;
  B := string(edtB.Text).ToSingle;
  lblAsSingle.Caption := single(A+B).ToString;
end;

procedure TfrmMain.btnAddStringClick(Sender: TObject);
begin
  A := edtA.Text;
  B := edtB.Text;
  lblAsString.Caption := A+B;
end;

procedure TfrmMain.btnEditClick(Sender: TObject);
var
n : integer;
begin
  n := StringGrid1.Row;
  FillPeople(n-1);
  FillGrid(n);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'ชื่อ';
  StringGrid1.Cells[1,0] := 'นามสกุล';
  StringGrid1.Cells[2,0] := 'อายุ';
  StringGrid1.Cells[3,0] := 'ระบบ';

end;

procedure TfrmMain.StringGrid1Click(Sender: TObject);
var
  n : integer;

begin
  n := TStringGrid(Sender).Row;
  ExtractRow(n);
  FillEdit(n);
end;



procedure TfrmMain.FillGrid(n: integer);
begin
  if StringGrid1.RowCount < n+1 then StringGrid1.RowCount := StringGrid1.RowCount+1;

  StringGrid1.Cells[0,n] := people[n-1].name.FirstName;
  StringGrid1.Cells[1,n] := people[n-1].name.LastName;
  StringGrid1.Cells[2,n] := people[n-1].age.ToString;
  StringGrid1.Cells[3,n] := GetEnumName(TypeInfo(TPhone),ord(people[n-1].Phone));
end;

procedure TfrmMain.ExtractRow(n: integer);
begin
  people[n-1].name.FirstName := StringGrid1.Cells[0,n];
  people[n-1].name.LastName := StringGrid1.Cells[1,n];
  people[n-1].age := StringGrid1.Cells[2,n].ToInteger;
  people[n-1].Phone := TPhone(GetEnumValue(TypeInfo(TPhone), StringGrid1.Cells[3,n]));


end;

procedure TfrmMain.FillEdit(n: integer);
begin
  edtFirstName.Text := people[n-1].name.FirstName;
  edtLastName.Text := people[n-1].name.LastName;
  edtAge.Text := people[n-1].age.ToString;
  cmbOS.ItemIndex := ord(people[n-1].Phone);

end;

procedure TfrmMain.FillPeople(n: integer);
begin
  people[n].name.FirstName := edtFirstName.Text;
  people[n].name.LastName := edtLastName.Text;
  try
    people[n].age := string(edtAge.Text).ToInteger;
  except
    people[n].age := 0;
  end;
  people[n].Phone := TPhone(cmbOS.ItemIndex);
end;

end.

