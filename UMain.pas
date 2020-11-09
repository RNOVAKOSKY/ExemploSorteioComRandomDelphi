unit UMain;

//By Roberto Novakosky - Exemplo com Randon

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//este método vai sortando até encontrar um que ainda nao tenha sido sorteado
var
   arraySorteio : array of integer; //ordem dos sorteados
   arraySorteados : array of integer; //marca os que já foram sortados
   n, s :integer;
   position :integer;
   numSorteado :integer;
   minhasPessoas :array of string;
begin

  //quero sortear 20, entao vou usar 20 posicoes para a ordem que forem sorteados
  n := 20;
  SetLength(arraySorteio, n);
  SetLength(arraySorteados, n);

  //vou iniciar meu array, tudo com zero
  //lembrete, usei vetor dinamico, eles sção based 0 no Delphi
  for position := 0 to n -1 do
    begin
    arraySorteio[position] := 0;
    arraySorteados[position] := 0; //0 significa que nao foi sortado ainda, 1 já foi sorteado
    end;

  //uma lógica usando RANDOM
  Randomize; //Define seed para poder usar System.Ramdom
  position := 0;
  while position < 20 do
    begin

    repeat
      begin
      numSorteado := System.Random(n);  //se n=20, gera um random de 0 a 19
      end;
    until (arraySorteados[numSorteado] = 0); //se não foi sorteado ainda, está valendo, senao tenta outro
    arraySorteio[position] := numSorteado;
    arraySorteados[numSorteado] := 1;
    Inc(position);
    end;

 //uma lista fictícia com 20 pessoas
 SetLength(minhasPessoas, n);
 minhasPessoas[0] := 'João';
 minhasPessoas[1] := 'Maria';
 minhasPessoas[2] := 'Estevão';
 minhasPessoas[3] := 'Roberto';
 minhasPessoas[4] := 'Dionísio';
 minhasPessoas[5] := 'Henrique';
 minhasPessoas[6] := 'Sônia';
 minhasPessoas[7] := 'Helena';
 minhasPessoas[8] := 'Gisele';
 minhasPessoas[9] := 'Daniela';
 minhasPessoas[10] := 'Alfredo';
 minhasPessoas[11] := 'José';
 minhasPessoas[12] := 'Simão';
 minhasPessoas[13] := 'Justino';
 minhasPessoas[14] := 'Amarildo';
 minhasPessoas[15] := 'Jéssica';
 minhasPessoas[16] := 'Suelen';
 minhasPessoas[17] := 'Rute';
 minhasPessoas[18] := 'Osmar';
 minhasPessoas[19] := 'Teobaldo';


 //Impressao no Memo
 Memo1.Clear;
 for position := 0 to n-1 do
   begin
   Memo1.Lines.Add(IntToStr( arraySorteio[position] ) + ' ' + minhasPessoas[arraySorteio[position]]);
   end;

 //grupos de 4 por exemplo
 Memo1.Lines.Add('');
 Memo1.Lines.Add('- - - - - - - - - - - -');
 s:= 1;
 for position := 0 to n-1 do
   begin
   Memo1.Lines.Add(IntToStr(s) + ' ' + minhasPessoas[arraySorteio[position]]);
   Inc(s);
   if s > 4 then
     begin
     s := 1;
     Memo1.Lines.Add('- - - - - - - - - - - -');
     end;
   end;



end;

procedure TForm1.Button2Click(Sender: TObject);
//Este método vai eliminando os sorteados e sorteia somente os que sobram
var
   arraySorteio : array of integer; //ordem dos sorteados
   arrayASortear : array of integer; //somente fica no array na lista os que falta sortear
   n, s :integer;
   nSortear :integer;
   position :integer;
   numSorteado :integer;
   minhasPessoas :array of string;
begin
  //quero sortear 20, entao vou usar 20 posicoes para a ordem que forem sorteados
  n := 20;
  SetLength(arraySorteio, n);
  SetLength(arrayASortear, n);

  //vou iniciar meu array, arraySorteio tudo com zero
  //ASortear todos os que precisam de 0 a n-1
  for position := 0 to n -1 do
    begin
    arraySorteio[position] := 0;
    arrayASortear[position] := position; //0 a n-1
    end;

  //uma lógica usando RANDOM
  Randomize; //Define seed para poder usar System.Ramdom
  position := 0;
  nSortear := n;
  while position < 20 do
    begin

    numSorteado := System.Random(nSortear);

    //pega o soerteado
    arraySorteio[position] := arrayASortear[numSorteado];

    //mata o que foi sorteado
    for s := numSorteado to nSortear -2 do
      arrayASortear[s] := arrayASortear[s+1];
    Dec(nSortear);

    Inc(position);
    end;



 //uma lista fictícia com 20 pessoas
 SetLength(minhasPessoas, n);
 minhasPessoas[0] := 'João';
 minhasPessoas[1] := 'Maria';
 minhasPessoas[2] := 'Estevão';
 minhasPessoas[3] := 'Roberto';
 minhasPessoas[4] := 'Dionísio';
 minhasPessoas[5] := 'Henrique';
 minhasPessoas[6] := 'Sônia';
 minhasPessoas[7] := 'Helena';
 minhasPessoas[8] := 'Gisele';
 minhasPessoas[9] := 'Daniela';
 minhasPessoas[10] := 'Alfredo';
 minhasPessoas[11] := 'José';
 minhasPessoas[12] := 'Simão';
 minhasPessoas[13] := 'Justino';
 minhasPessoas[14] := 'Amarildo';
 minhasPessoas[15] := 'Jéssica';
 minhasPessoas[16] := 'Suelen';
 minhasPessoas[17] := 'Rute';
 minhasPessoas[18] := 'Osmar';
 minhasPessoas[19] := 'Teobaldo';


 //Impressao no Memo
 Memo1.Clear;
 for position := 0 to n-1 do
   begin
   Memo1.Lines.Add(IntToStr( arraySorteio[position] ) + ' ' + minhasPessoas[arraySorteio[position]]);
   end;

 //grupos de 4 por exemplo
 Memo1.Lines.Add('');
 Memo1.Lines.Add('- - - - - - - - - - - -');
 s:= 1;
 for position := 0 to n-1 do
   begin
   Memo1.Lines.Add(IntToStr(s) + ' ' + minhasPessoas[arraySorteio[position]]);
   Inc(s);
   if s > 4 then
     begin
     s := 1;
     Memo1.Lines.Add('- - - - - - - - - - - -');
     end;
   end;


end;

end.
