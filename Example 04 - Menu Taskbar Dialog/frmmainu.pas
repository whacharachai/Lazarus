unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ShellCtrls,
  ExtCtrls, StdCtrls, SynEdit, SynHighlighterHTML;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    ComboBox1: TComboBox;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    pmnShow: TMenuItem;
    mnuFileExit: TMenuItem;
    mnuEditCopy: TMenuItem;
    mnuEditPaste: TMenuItem;
    MenuItem2: TMenuItem;
    pmnSaveAs: TMenuItem;
    mnuFileOpen: TMenuItem;
    mnuFileSaveAs: TMenuItem;
    MenuItem7: TMenuItem;
    mnuEditCut: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    SaveDialog1: TSaveDialog;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    SynEdit1: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    TrayIcon1: TTrayIcon;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure mnuEditCopyClick(Sender: TObject);
    procedure mnuEditCutClick(Sender: TObject);
    procedure mnuEditPasteClick(Sender: TObject);
    procedure mnuFileExitClick(Sender: TObject);
    procedure mnuFileOpenClick(Sender: TObject);
    procedure mnuFileSaveAsClick(Sender: TObject);
    procedure pmnSaveAsClick(Sender: TObject);
    procedure pmnShowClick(Sender: TObject);
    procedure ShellListView1Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
  private
    pathname : string;
    AppPath : string;

    Quit : boolean;
  public

  end;

var
  frmMain: TfrmMain;

implementation
uses
  ComCtrls;

{$R *.lfm}

{ TfrmMain }


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  AppPath := ExtractFilePath(Application.ExeName);
  ShellTreeView1.Path := AppPath+'data';

  Quit := false;
  TrayIcon1.Show;
end;

procedure TfrmMain.mnuEditCopyClick(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
end;

procedure TfrmMain.mnuEditCutClick(Sender: TObject);
begin
  SynEdit1.CutToClipboard;
end;

procedure TfrmMain.mnuEditPasteClick(Sender: TObject);
begin
  SynEdit1.PasteFromClipboard(false);
end;

procedure TfrmMain.mnuFileExitClick(Sender: TObject);
begin
  Quit := true;
  close;
end;

procedure TfrmMain.mnuFileOpenClick(Sender: TObject);
var
  ext : string;

begin
  OpenDialog1.InitialDir := ShellTreeView1.Path;

  if OpenDialog1.Execute then
  begin
    pathname := OpenDialog1.FileName;
    ext := LowerCase(ExtractFileExt(pathname));
    if ((ext = '.html') or
        (ext = '.txt')) then
      SynEdit1.Lines.LoadFromFile(pathname);

    if ((ext = '.jpg') or
        (ext = '.jpeg') or
        (ext = '.png')) then
      Image1.Picture.LoadFromFile(pathname);
  end;
end;

procedure TfrmMain.mnuFileSaveAsClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    SynEdit1.Lines.SaveToFile(SaveDialog1.FileName);
    ShellTreeView1.Path := ExtractFilePath(SaveDialog1.FileName);
  end;
end;

procedure TfrmMain.pmnSaveAsClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    Image1.Picture.SaveToFile(SaveDialog1.FileName);
    ShellTreeView1.Path := ExtractFilePath(SaveDialog1.FileName);
  end;
end;

procedure TfrmMain.pmnShowClick(Sender: TObject);
begin
  frmMain.Show;
end;

procedure TfrmMain.ComboBox1Change(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = 0 then
    ShellListView1.ViewStyle := TViewStyle.vsIcon
  else
    ShellListView1.ViewStyle := TViewStyle.vsReport;

  ShellListView1.Column[0].Width := 200;
  ShellListView1.Column[1].Width := 100;
  ShellListView1.Column[2].Width := 100;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if quit then
    CanClose := true
  else
  begin
    CanClose := false;
    frmMain.Hide;
  end;
end;

procedure TfrmMain.ShellListView1Click(Sender: TObject);
var
  filename, ext : string;

begin
  try
    filename := ShellListView1.Root + '\' + ShellListView1.Selected.Caption;
  except
    filename := ShellListView1.Root;
  end;

  pathname := filename;
  ext := LowerCase(ExtractFileExt(pathname));
  if ((ext = '.html') or
      (ext = '.txt')) then
    SynEdit1.Lines.LoadFromFile(pathname);

  if ((ext = '.jpg') or
      (ext = '.jpeg') or
      (ext = '.png')) then
    Image1.Picture.LoadFromFile(pathname);

end;

procedure TfrmMain.TrayIcon1Click(Sender: TObject);
begin
  frmMain.Show;
end;

end.

