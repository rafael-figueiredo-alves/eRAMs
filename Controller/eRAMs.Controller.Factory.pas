unit eRAMs.Controller.Factory;

interface

uses
  eRAMs.Controller.interfaces;

Type
  TControllerFactory = Class(TInterfacedObject, iControllerFactory)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerFactory;
     Function Configuracao : iControllerConfiguracao;
     Function Periodos     : iControllerPeriodos;
     Function turmas       : iControllerTurmas;
     Function alunos       : iControllerAlunos;
     Function Calendario   : iControllerCalendario;
     Function RAMs         : iControllerRAMs;
     Function Funcoes      : iControllerFuncoes;
  End;

implementation

uses
  eRAMs.Controller.Alunos, eRAMs.Controller.Calendario,
  eRAMs.Controller.configuracao, eRAMs.Controller.periodos,
  eRAMs.Controller.GerarRAMs, eRAMs.Controller.turmas,
  eRAMs.Controller.Funcoes;

{ TControllerFactory }

function TControllerFactory.alunos: iControllerAlunos;
begin
    Result := tControllerAlunos.New;
end;

function TControllerFactory.Calendario: iControllerCalendario;
begin
   Result := tControllerCalendario.New;
end;

function TControllerFactory.Configuracao: iControllerConfiguracao;
begin
   Result := tControllerConfiguracao.New;
end;

constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin

  inherited;
end;

function TControllerFactory.Funcoes: iControllerFuncoes;
begin
    Result := tControllerFuncoes.New;
end;

class function TControllerFactory.New: iControllerFactory;
begin
    Result := Self.Create;
end;

function TControllerFactory.Periodos: iControllerPeriodos;
begin
   Result := tcontrollerPeriodos.New;
end;

function TControllerFactory.RAMs: iControllerRAMs;
begin
   Result := tControllerRAMs.New;
end;

function TControllerFactory.turmas: iControllerTurmas;
begin
   Result := tControllerTurmas.New;
end;

end.
