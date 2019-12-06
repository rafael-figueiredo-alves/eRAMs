unit eRAMs.Controller.periodos;

interface

uses
  eRAMs.Controller.interfaces, eRAMs.Model.Interfaces;

Type
  TControllerPeriodos = Class(TInterfacedObject, iControllerPeriodos)
    Private
     FConexaoSOP : imodelconexaoSop;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerPeriodos;
     Function Listar (Lista: TObject) : iControllerPeriodos;
  End;

implementation

uses
  FMX.ListBox,
  Data.DB, FMX.Dialogs, FireDAC.Comp.Client,
  System.SysUtils, eRAMs.Model.Factory;

{ TControllerPeriodos }

constructor TControllerPeriodos.Create;
begin
   FConexaoSOP := tModelFactory.New.Conexao;
end;

destructor TControllerPeriodos.Destroy;
begin

  inherited;
end;

function TControllerPeriodos.Listar(Lista: TObject): iControllerPeriodos;
var MyList : TComboBox;
    Table  : Tfdmemtable;
    dia, mes, ano: word;
    periodoAtual : string;
begin
    Result := Self;
    MyList := tcombobox(lista);
    MyList.Items.Clear;
    table := fconexaosop.Periodos;
    Table.First;
    while not Table.eof do
     begin
       MyList.Items.Add(table.FieldByName('Num_per').AsString);
       table.Next;
     end;
    decodedate(now, ano, mes, dia);
    if mes <= 6 then
     periodoAtual := inttostr(ano)+'/2'
    else
     periodoAtual := inttostr(ano)+'/3';
    MyList.ItemIndex := MyList.Items.IndexOf(periodoAtual);
    table.DisposeOf;
end;

class function TControllerPeriodos.New: iControllerPeriodos;
begin
   Result := Self.Create;
end;

end.
