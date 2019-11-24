unit eRAMs.Controller.GerarRAMs;

interface

uses
  eRAMs.Controller.interfaces, System.Classes;

Type
  TControllerRAMs = Class(TInterfacedObject, iControllerRAMs)
    Private
      FDias      : String;
      FTurma     : String;
      FMedia     : string;
      FProfessor : String;
      FHorario   : string;
      FMeses     : string;
      FPeriodo   : string;
      FInicio    : integer;
      FFim       : integer;
      FLicoes    : string;
      FAlunos    : tStrings;
    Public
      Constructor Create;
      Destructor Destroy; Override;
      Class function New: iControllerRAMs;
      Function Dias (Value : string) : iControllerRAMs;
      Function Turma (Value : String) : iControllerRAMs;
      Function Media (Value : string) : iControllerRAMs;
      Function Professor (Value : string) : iControllerRAMs;
      Function Horario (Value : string) : iControllerRAMs;
      Function Meses (Value : string) : iControllerRAMs;
      Function Periodo (Value : string) : iControllerRAMs;
      Function Inicio (Value : integer) : iControllerRAMs;
      Function Fim (value : integer) : iControllerRAMs;
      Function licoes (Value : string) : iControllerRAMs;
      Function Alunos (Alunos : tstrings) : iControllerRAMs;
      Function Gerar : iControllerRAMs;
  End;

implementation

uses
  eRAMs.view.principal;

{ TControllerRAMs }

function TControllerRAMs.Alunos(Alunos: tstrings): iControllerRAMs;
begin
    FAlunos := alunos;
end;

constructor TControllerRAMs.Create;
begin
   FAlunos := TStrings.Create;
end;

destructor TControllerRAMs.Destroy;
begin
  FAlunos.DisposeOf;
  inherited;
end;

function TControllerRAMs.Dias(Value: string): iControllerRAMs;
begin
    Fdias := Value;
end;

function TControllerRAMs.Fim(value: integer): iControllerRAMs;
begin
   Ffim := Value;
end;

function TControllerRAMs.Gerar: iControllerRAMs;
begin

end;

function TControllerRAMs.Horario(Value: string): iControllerRAMs;
begin
   Fhorario := Value;
end;

function TControllerRAMs.Inicio(Value: integer): iControllerRAMs;
begin
   Finicio := Value;
end;

function TControllerRAMs.licoes(Value: string): iControllerRAMs;
begin
   Flicoes := Value;
end;

function TControllerRAMs.Media(Value: string): iControllerRAMs;
begin
   Fmedia := Value;
end;

function TControllerRAMs.Meses(Value: string): iControllerRAMs;
begin
   Fmeses := Value;
end;

class function TControllerRAMs.New: iControllerRAMs;
begin
   Result := self.create;
end;

function TControllerRAMs.Periodo(Value: string): iControllerRAMs;
begin
   Fperiodo := Value;
end;

function TControllerRAMs.Professor(Value: string): iControllerRAMs;
begin
   Fprofessor := Value;
end;

function TControllerRAMs.Turma(Value: String): iControllerRAMs;
begin
   Fturma := Value;
end;

end.
