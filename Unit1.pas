unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TntStdCtrls, Menus;

type
  TForm1 = class(TForm)
    TntMemo1: TTntMemo;
    TntMemo2: TTntMemo;
    Button1: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Settings1: TMenuItem;
    Font1: TMenuItem;
    FontDialog1: TFontDialog;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
   var
         i, k, keykod : integer;
         s : WideString;
         str:array of WideChar;
         togh, p : String;


begin

TntMemo2.Text:='';
p:=TntMemo1.Text;
SetLength(str,(length(p)*4));

k:=1;
for i:=1 to (length(p)) do
        begin
           if (p[i] = '#') then
              begin
                 togh := Copy (p, (i+1), 4);
                 try
                 keykod := StrToInt (togh);

                 Str[k] := WideChar(keykod);
                 Inc(k);
                 except
//               ShowMessage('oshibka');
                 exit
                 end;
              end;

           if (p[i]<>';') and (p[i] <> '#') and (p[i]<>'&') and (p[i-1]<>'#') and (p[i-2]<>'#') and (p[i-3]<>'#') and (p[i-4]<>'#') then
                 begin
                    try
                    Str[k] := WideChar(ord(p[i]));
                    Inc(k);
                    except
                    exit
                    end;
                 end;



        end;


s:='';
for i:=1 to k do
begin
s:=s+Str[i];
end;
Str:=Nil;

TntMemo2.Text:=s;

end;


procedure TForm1.Font1Click(Sender: TObject);
begin
If FontDialog1.Execute then
   begin
   //TFontDialog1.Options = TFontDialog1.Options + fdApplyButton;
   //TFontDialog1.Execute;
   TntMemo2.Font := FontDialog1.Font;

   end;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
If OpenDialog1.Execute then
   begin
   TntMemo1.Lines.LoadFromFile(OpenDialog1.FileName);
   end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IFDEF WIN32}
  AddFontResource( PChar( 'arlamu.ttf' { AnsiString } ) );
  {$ELSE}
  var
    SS  : array [ 0..255 ] of Char;

  AddFontResource ( StrPCopy ( SS, 'arlamu.ttf' ));
  {$ENDIF}
  SendMessage ( HWND_BROADCAST, WM_FONTCHANGE, 0, 0 );
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IFDEF WIN32}
  RemoveFontResource ( PChar('arlamu.ttf') );
  {$ELSE}
  RemoveFontResource ( StrPCopy ( SS, 'arlamu.ttf' ));
  {$ENDIF}
  SendMessage ( HWND_BROADCAST, WM_FONTCHANGE, 0, 0 );
end;

end.
