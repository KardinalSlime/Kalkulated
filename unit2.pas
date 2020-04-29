unit Unit2;

{$mode objfpc}{$H+}


interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, LCLType, ActnList, Clipbrd, Menus, LCLTranslator,
  EditBtn, Math;

type

  { TForm2 }

  TForm2 = class(TForm)
    About: TMenuItem;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    ButtonSin: TButton;
    ButtonTg: TButton;
    ButtonLog: TButton;
    ButtonCos: TButton;
    ButtonCtg: TButton;
    ButtonLn: TButton;
    ButtonFact: TButton;
    ButtonAbs: TButton;
    ButtonSys2: TButton;
    ButtonSys3: TButton;
    ButtonSys4: TButton;
    ButtonSys5: TButton;
    ButtonSys6: TButton;
    ButtonSys7: TButton;
    ButtonSys8: TButton;
    Copy1: TMenuItem;
    CopyAction: TAction;
    Edit: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    English: TMenuItem;
    Extended1: TMenuItem;
    Help: TMenuItem;
    Help1: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    History: TLabel;
    Languages: TMenuItem;
    MainMenu1: TMainMenu;
    MenuItemColorDefault: TMenuItem;
    MenuItemColorMG: TMenuItem;
    MenuItemColorSB: TMenuItem;
    MenuItemColorChild: TMenuItem;
    Mode: TMenuItem;
    Paste: TMenuItem;
    PasteAction: TAction;
    Russian: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Standart: TMenuItem;
    Themes: TMenuItem;

    procedure AboutClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ButtonSys2Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure MenuItemColorChildClick(Sender: TObject);
    procedure MenuItemColorDefaultClick(Sender: TObject);
    procedure MenuItemColorMGClick(Sender: TObject);
    procedure MenuItemColorSBClick(Sender: TObject);
    procedure NumButtonClick(Sender: TObject);
    procedure PasteClick(Sender: TObject);
    procedure RussianClick(Sender: TObject);
    procedure StandartClick(Sender: TObject);
    procedure Extended1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SystemClick(Sender: TObject);
  private
    chislo: extended;
    Shlo_ravno, Shlo_drugoe: boolean;
    PrevMathButton, MathOperationButton: string;
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}
uses
  Unit1, Unit3, unit4;

{ TForm2 }



procedure TForm2.NumButtonClick(Sender: TObject);
var
  button: string;
begin
  if (Shlo_ravno = true ) then  button22.click;
   button := TButton(Sender).Caption;
   if (button = ',') AND (pos(',',Edit1.Text) <> 0) THEN exit;
   if (Edit1.Text='0') AND (button <> ',') THEN
    Edit1.Text := FloatToStr(StrToFloat(Edit1.Text + button))
    else
    Edit1.Text := Edit1.Text + button;
end;

procedure TForm2.Extended1Click(Sender: TObject);
begin

end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  s: string;
begin
  s := Edit1.Text;
  if (length(s) = 1) OR ((length(s)=2) AND (s[1]='-')) THEN s := '0' else
    delete(s,length(s),1);
  Edit1.Text := s;
end;

procedure TForm2.Button12Click(Sender: TObject);
var
i,n: byte;
temp: double;
chislonew: extended;
begin
  PrevMathButton := '';
    chislonew:= StrToFloatDef(Edit1.Text,0);
  if (MathOperationButton <> '') THEN
  begin
      begin
        case MathOperationButton of
          '/':
            begin
                if (chislonew <> 0) THEN Edit1.Text := FloatToStr(chislo / chislonew)
                else
                  begin
                  Button22.Click;
                  end;
            end;
          '*': Edit1.Text := FloatToStr(chislo * chislonew);
          '-': Edit1.Text := FloatToStr(chislo - chislonew);
          '+': Edit1.Text := FloatToStr(chislo + chislonew);
          '%': Edit1.Text := FloatToStr((chislo/100)*chislonew);
          '^2': Edit1.Text := FloatToStr(sqr(chislo));
          'Sqrt':
            begin
                if (chislo > 0) THEN Edit1.Text := FloatToStr(sqrt(chislo))
                else
                  begin
                  Button22.Click;
                  end;
            end;
          'x^y': Edit1.Text:= FloatToStr(Power(chislo, chislonew));
          'sin':  Edit1.Text:= FloatToStr(sin((chislo)));
          'cos':  Edit1.Text:= FloatToStr(cos((chislo)));
          'tg':  Edit1.Text:= FloatToStr(sin((chislo))/cos((chislo)));
          'ctg': Edit1.Text:= FloatToStr(cos((chislo))/sin((chislo)));
          'log':  begin
                  if chislo < 0 then
                      Button22.Click
                  else
                      Edit1.Text:= FloatToStr(ln(chislo)/ln(chislonew));
                  end;
          'ln':   begin
                  if chislo < 0 then
                     Button22.Click
                  else
                     Edit1.Text:= FloatToStr(ln(chislo)/ln(2.71));
                  end;
          'abs':
            if chislo < 0 then Edit1.Text:= FloatToStr(-1*(chislo))
            else Edit1.Text := FloatToStr(chislo);
          'x!': begin
            if (Frac(chislo)=0) then
               begin
                 if (chislo>1) then
                   begin
                     temp:= 1;
                     n:= Trunc(chislo);
                     for i:=2 to n do
                       temp:= temp*i;
                   end
                 else
                     temp:= 1;
                 Edit1.Text:= FloatToStr(temp);
               end
          end;
        end;
        History.Caption := '';
        chislo := StrToFloatDef(Edit1.Text,0);
      end;
  end;
  Shlo_ravno := true;
  Shlo_drugoe := false;
end;

procedure TForm2.Button13Click(Sender: TObject);
begin
  if (PrevMathButton <> TButton(Sender).Caption) OR (Edit1.Text <> '') then
  begin
    if (Shlo_drugoe = true) AND (Edit1.Text <> '') THEN Button12.Click;
    MathOperationButton := TButton(Sender).Caption;
    PrevMathButton:= TButton(Sender).Caption;
    if (Shlo_drugoe = false) THEN
      chislo := StrToFloatDef(Edit1.Text,0);
      if (MathOperationButton = '+/-')  THEN
         begin
            chislo:= -chislo;
            History.Caption := FloatToStr(chislo);
         end
      else
         if (MathOperationButton = 'Sqrt') THEN
            begin
                 History.Caption := 'Sqrt(' + FloatToStr(chislo) + ') ' ;
                 //Edit1.Text := FloatToStr(sqrt(chislo));
            end
         else
          History.Caption := FloatToStr(chislo) + ' ' + MathOperationButton + ' ';

    Edit1.Text := '';
    Shlo_ravno := false;
    Shlo_drugoe := true;
  end;
end;

procedure TForm2.Button21Click(Sender: TObject);
begin
  Edit1.Text := '0';
end;

procedure TForm2.Button22Click(Sender: TObject);
begin
  Chislo := 0;
  Edit1.Text := '0';
  History.Caption := '';
  MathOperationButton := '';
  Shlo_ravno := false;
  Shlo_drugoe := false;
  PrevMathButton := '';
end;

procedure TForm2.Help1Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm2.MenuItemColorMGClick(Sender: TObject);
begin
  Form1.color:=clMoneyGreen;
  Form2.color:=clMoneyGreen;
  Form3.color:=clMoneyGreen;
  Form4.color:=clMoneyGreen;
  Label1.Color := clnone;
  Image1.Picture:= nil;
  BitBtn1.Glyph:= nil;
  BitBtn1.Margin:= 13;
  BitBtn2.Glyph:= nil;
  BitBtn2.Margin:= 13;
  BitBtn3.Glyph:= nil;
  BitBtn3.Margin:= 13;
  BitBtn4.Glyph:= nil;
  BitBtn4.Margin:= 13;
  BitBtn5.Glyph:= nil;
  BitBtn5.Margin:= 13;
  BitBtn6.Glyph:= nil;
  BitBtn6.Margin:= 13;
  BitBtn7.Glyph:= nil;
  BitBtn7.Margin:= 13;
  BitBtn8.Glyph:= nil;
  BitBtn8.Margin:= 13;
  BitBtn9.Glyph:= nil;
  BitBtn9.Margin:= 13;
  BitBtn10.Glyph:= nil;
  BitBtn10.Margin:= 13;
end;

procedure TForm2.MenuItemColorSBClick(Sender: TObject);
begin
  Form1.color:=clSkyBlue;
  Form2.color:=clSkyBlue;
  Form3.color:=clSkyBlue;
  Form4.color:=clSkyBlue;
  Label1.Color := clnone;
  Image1.Picture:= nil;
  BitBtn1.Glyph:= nil;
  BitBtn1.Margin:= 13;
  BitBtn2.Glyph:= nil;
  BitBtn2.Margin:= 13;
  BitBtn3.Glyph:= nil;
  BitBtn3.Margin:= 13;
  BitBtn4.Glyph:= nil;
  BitBtn4.Margin:= 13;
  BitBtn5.Glyph:= nil;
  BitBtn5.Margin:= 13;
  BitBtn6.Glyph:= nil;
  BitBtn6.Margin:= 13;
  BitBtn7.Glyph:= nil;
  BitBtn7.Margin:= 13;
  BitBtn8.Glyph:= nil;
  BitBtn8.Margin:= 13;
  BitBtn9.Glyph:= nil;
  BitBtn9.Margin:= 13;
  BitBtn10.Glyph:= nil;
  BitBtn10.Margin:= 13;
end;

procedure TForm2.MenuItemColorChildClick(Sender: TObject);
begin
  Image1.Picture.LoadFromFile('img/1.png');
  BitBtn1.Margin:= 0;
  BitBtn1.Glyph:= Image1.Picture.Bitmap;
  BitBtn1.Caption;

  Image1.Picture.LoadFromFile('img/2.png');
  BitBtn2.Margin:= 0;
  BitBtn2.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/3.png');
  BitBtn3.Margin:= 0;
  BitBtn3.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/4.png');
  BitBtn4.Margin:= 0;
  BitBtn4.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/5.png');
  BitBtn5.Margin:= 0;
  BitBtn5.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/6.png');
  BitBtn6.Margin:= 0;
  BitBtn6.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/7.png');
  BitBtn7.Margin:= 0;
  BitBtn7.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/8.png');
  BitBtn8.Margin:= 0;
  BitBtn8.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/9.png');
  BitBtn9.Margin:= 0;
  BitBtn9.Glyph:= Image1.Picture.Bitmap;

  Image1.Picture.LoadFromFile('img/0.png');
  BitBtn10.Margin:= 0;
  BitBtn10.Glyph:= Image1.Picture.Bitmap;

 Image1.Picture.LoadFromFile('img/zad.jpg');
 Form2.color:=clwhite;
 Label1.Color := clwhite;
end;

procedure TForm2.MenuItemColorDefaultClick(Sender: TObject);
begin
  Form1.color:=clDefault;
  Form2.color:=clDefault;
  Form3.color:=clDefault;
  Form4.color:=clDefault;
  Label1.Color := clnone;
  Image1.Picture:= nil;
  BitBtn1.Glyph:= nil;
  BitBtn1.Margin:= 13;
  BitBtn2.Glyph:= nil;
  BitBtn2.Margin:= 13;
  BitBtn3.Glyph:= nil;
  BitBtn3.Margin:= 13;
  BitBtn4.Glyph:= nil;
  BitBtn4.Margin:= 13;
  BitBtn5.Glyph:= nil;
  BitBtn5.Margin:= 13;
  BitBtn6.Glyph:= nil;
  BitBtn6.Margin:= 13;
  BitBtn7.Glyph:= nil;
  BitBtn7.Margin:= 13;
  BitBtn8.Glyph:= nil;
  BitBtn8.Margin:= 13;
  BitBtn9.Glyph:= nil;
  BitBtn9.Margin:= 13;
  BitBtn10.Glyph:= nil;
  BitBtn10.Margin:= 13;
end;

procedure TForm2.AboutClick(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.ButtonSys2Click(Sender: TObject);
begin

end;

procedure TForm2.Copy1Click(Sender: TObject);
begin
  Clipboard.AsText := Edit1.Text;
end;

procedure TForm2.PasteClick(Sender: TObject);
var
  i: integer;
  s: string;
begin
  if (Clipboard.AsText <> '') THEN
    begin
      s := '';
      for i := 1 to Length(Clipboard.AsText) do
        if (ord(Clipboard.AsText[i])>=48) AND (ord(Clipboard.AsText[i])<=57) THEN s := s + Clipboard.AsText[i];
      if (s <> '') THEN Edit1.Text := s;
    end;
end;

procedure TForm2.RussianClick(Sender: TObject);
begin
  SetDefaultLang('ru');
end;

procedure TForm2.EnglishClick(Sender: TObject);
begin
  SetDefaultLang('en');
end;


procedure TForm2.StandartClick(Sender: TObject);
begin
  Form1.Show;
  Form2.Visible:=false;
end;


function Sym (n : integer) : char;
  begin
      case n of
      0..9:   Sym := chr(48+n);
      10..36: Sym := chr(55+n);
      end;
  end;
function Translation (n : longint; k : integer) : string;
var st : string;
begin
    st := '';
    if n = 0 then st := '0' else
    begin
        while n>=1 do
        begin
            st := Sym (n mod k) + st;
            n := n div k;
        end;
    end;
 Translation := st;
end;
procedure TForm2.SystemClick(Sender: TObject);
var n:longint;
k:integer;
temp: double;
begin
  temp:= Frac(StrToFloat(Edit1.Text));
  if temp = 0 then
    begin
    n:= StrToInt(Edit1.Text);
    k:= StrToInt(TButton(Sender).Caption);
    Edit2.Text:= Translation(N, k);

    end;
end;


end.

