unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnProcess: TButton;
    chkSport: TCheckBox;
    chkMovie: TCheckBox;
    chkCraft: TCheckBox;
    cmbAge: TComboBox;
    edtName: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lstWork: TListBox;
    mmoData: TMemo;
    rdoMale: TRadioButton;
    rdoFemale: TRadioButton;
    procedure btnProcessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
var
  I : integer;

begin
  //Fill Age Combo
  for I := 20 to 60 do
  begin
    cmbAge.Items.Add(IntToStr(I));
  end;
  cmbAge.ItemIndex := 0;
end;

procedure TfrmMain.btnProcessClick(Sender: TObject);
var
  data : string;
  gender : string;
  play : string;
  l : integer;

begin
  data := 'ชื่อ ' + trim(edtName.Text);
  data := data + ' , อายุ ' + cmbAge.Items[cmbAge.ItemIndex];;
  data := data + ', อาชีพ ' + lstWork.Items[lstWork.ItemIndex];
  if rdoMale.Checked then
    gender := 'ชาย'
  else
    gender := 'หญิง';
  data := data + ', เพศ ' + gender;
  if chkSport.Checked then play := chkSport.Caption+'/';
  if chkMovie.Checked then play := play + chkMovie.Caption+'/';
  if chkCraft.Checked then play := play + chkCraft.Caption;
  if play <> '' then
    if play[length(play)] = '/' then setlength(play,length(play)-1)
  else
    play := 'ไม่มี';
  data := data + ', งานอดิเรก ' + play;
  mmoData.Lines.Add(data);
end;

end.

