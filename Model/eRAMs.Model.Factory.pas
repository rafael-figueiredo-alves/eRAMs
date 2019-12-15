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
     Function Configuracao : iModelConfiguracao;
     Function Calendario   : iModelCalendario;
     Function RAMs         : iModelRAMs;
     Function Funcoes      : iModelFuncoes;
  End;

implementation

uses
  eRAMs.Model.Configuracao, eRAMs.Model.ConexaoBD, eRAMs.Model.ConexaoSOP,
  eRAMs.Model.Calendario, eRAMs.Model.GerarRAMs, eRAMs.Model.Funcoes;

{ TModelFactory }

function TModelFactory.Calendario: iModelCalendario;
begin
   Result := tmodelCalendario.New;
end;

function TModelFactory.Conexao : iModelConexaoSOP;
Var FTestes : Boolean;
begin
   FTestes := self.Configuracao.Testes;
   case FTestes of
    True  : Result := tModelConexaoBD.New;
    False : Result := tModelConexaoSOP.New;
   end;
end;

function TModelFactory.Configuracao: iModelConfiguracao;
begin
   Result := TModelConfiguracao.New;
end;

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

function TModelFactory.Funcoes: iModelFuncoes;
begin
   Result := tmodelfuncoes.New;
end;

class function TModelFactory.New: iModelFactory;
begin
   Result := Self.Create;
end;

function TModelFactory.RAMs: iModelRAMs;
begin
  Result := tmodelRams.New;
end;

end.
