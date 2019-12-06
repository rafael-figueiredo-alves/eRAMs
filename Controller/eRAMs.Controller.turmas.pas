unit eRAMs.Controller.turmas;

interface

uses
  eRAMs.Controller.interfaces, FireDAC.Comp.Client, eRAMs.Model.Interfaces,
  FMX.ListBox;

Type
  TControllerTurmas = Class(TInterfacedObject, iControllerTurmas)
    Private
     FConexaoSOP : imodelconexaoSop;
     FPeriodo    : string;
     FTurma      : string;
     FCod_cur    : string;
     FNum_niv    : string;
     FNum_tur    : string;
     FMedia      : string;
     FDias       : string;
     FHorario    : string;
     FProfessor  : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerTurmas;
     Function Listar (periodo: string; Lista: Tlistbox) : iControllerTurmas;
     Function Buscar (periodo, Turma : String) : iControllerTurmas;
     Function Cod_cur : string;
     Function Num_Niv : string;
     Function Num_Tur : string;
     Function Media : string;
     Function Dias : string;
     Function Horario : string;
     Function Turma : string;
     Function Periodo : string;
     Function Professor : string;
     Function DiasApresentar : string;
     Function ConverteDias(valor: string): string;
     Function DiadaSemana(valor: integer): string;
  End;

implementation

uses
  System.SysUtils,
  eRAMs.Model.Factory;

{ TControllerTurmas }

Function TControllerTurmas.Buscar(periodo, Turma : String) : iControllerTurmas;
var
    FDados      :  TFDMemTable;
begin
    Result     := self;
    FTurma     := Turma;
    FPeriodo   := periodo;
    FDados     := FConexaoSOP.Turma(fperiodo, turma);
    FCod_cur   := FDados.FieldByName('Cod_cur').AsString;
    Fnum_niv   := FDados.FieldByName('Num_Niv').AsString;
    FNum_Tur   := FDados.FieldByName('Num_Tur').AsString;
    FProfessor := FDados.FieldByName('Nom_cop').AsString;
    Fmedia     := FDados.FieldByName('Not_apr').AsString;
    Fhorario   :=  FormatDateTime('hh:mm', FDados.FieldByName('hor_ini').AsDateTime) + ' às ' + FormatDateTime('hh:mm', FDados.FieldByName('hor_fim').AsDateTime);
    Fmedia     := FDados.FieldByName('Not_apr').AsString;
    Fdias      := FDados.FieldByName('flg_diaAul').AsString;
    FDados.DisposeOf;
end;

function TControllerTurmas.Cod_cur: string;
begin
    Result := FCod_cur;
end;

function TControllerTurmas.ConverteDias(valor: string): string;
var i: integer;
begin
    if valor.Length > 1 then
     begin
      for I := Low(valor) to High(valor) do
       begin
        if i = High(valor) then
         begin
          Result := Result + ' e ' + DiadaSemana(strtoint(valor[i]));
          exit
         end;
        if i = Low(valor) then
         Result := DiadaSemana(strtoint(valor[i]))
        else
         Result := Result + ', ' + DiadaSemana(strtoint(valor[i]));
       end;
     end
    else
     Result := DiadaSemana(StrtoInt(valor[1]));
end;

constructor TControllerTurmas.Create;
begin
   FConexaoSOP := tModelFactory.New.Conexao;
end;

destructor TControllerTurmas.Destroy;
begin

  inherited;
end;

function TControllerTurmas.DiadaSemana(valor: integer): string;
begin
    case valor of
     2: Result := 'Segundas';
     3: Result := 'Terças'  ;
     4: Result := 'Quartas' ;
     5: Result := 'Quintas' ;
     6: Result := 'Sextas'  ;
     7: Result := 'Sábados' ;
    end;
end;

function TControllerTurmas.Dias: string;
begin
   Result := FDias;
end;

function TControllerTurmas.DiasApresentar: string;
begin
   Result := ConverteDias(FDias);
end;

function TControllerTurmas.Horario: string;
begin
   Result := FHorario;
end;

function TControllerTurmas.Listar(periodo: string;
  Lista: Tlistbox): iControllerTurmas;
var
    Item        : TListBoxItem;
    FDados      :  TFDMemTable;
begin
    Result := self;
    FPeriodo := periodo;
    lista.Items.Clear;
    FDados := FConexaoSOP.Turmas(fperiodo);
    FDados.First;
    while not Fdados.eof do
     begin
       Item := TListBoxItem.Create(lista);
       item.Text := FDados.FieldByName('Turma').AsString;
       Item.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
       lista.AddObject(item);
       FDados.Next;
     end;
    FDados.DisposeOf;
end;

function TControllerTurmas.Media: string;
begin
   Result := FMedia;
end;

class function TControllerTurmas.New: iControllerTurmas;
begin
    Result := Self.Create;
end;

function TControllerTurmas.Num_Niv: string;
begin
   Result := FNum_niv;
end;

function TControllerTurmas.Num_Tur: string;
begin
   Result := FNum_tur;
end;

function TControllerTurmas.Periodo: string;
begin
  Result := FPeriodo;
end;

function TControllerTurmas.Professor: string;
begin
 Result := FProfessor;
end;

function TControllerTurmas.Turma: string;
begin
   Result := FTurma;
end;

end.
