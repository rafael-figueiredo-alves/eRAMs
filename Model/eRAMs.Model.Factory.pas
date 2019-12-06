unit eRAMs.Model.Factory;

interface

uses
  eRAMs.Model.Interfaces;

Type
  TModelFactory = Class(TInterfacedObject, iModelFactory)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelFactory;
     Function Conexao : iModelConexaoSOP;
  End;

implementation

uses
  eRAMs.Model.Configuracao, eRAMs.Model.ConexaoBD, eRAMs.Model.ConexaoSOP;

{ TModelFactory }

function TModelFactory.Conexao : iModelConexaoSOP;
Var FTestes : Boolean;
begin
   FTestes := tModelConfiguracao.New.Testes;
   case FTestes of
    True  : Result := tModelConexaoBD.New;
    False : Result := tModelConexaoSOP.New;
   end;
end;

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

class function TModelFactory.New: iModelFactory;
begin
   Result := Self.Create;
end;

end.
