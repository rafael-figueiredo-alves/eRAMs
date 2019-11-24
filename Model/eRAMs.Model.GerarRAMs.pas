unit eRAMs.Model.GerarRAMs;

interface

uses
  eRAMs.Model.Interfaces, System.Classes;

Type
  TModelRAMs = Class(TInterfacedObject, iModelRAMs)
    Private
      Fdias      : string;
      Fturma     : string;
      Fmedia     : string;
      Fprofessor : string;
      Fhorario   : string;
      Fmeses     : string;
      Fperiodo   : string;
      Finicio    : integer;
      FFim       : integer;
      Flicoes    : string;
      Falunos    : tstrings;
      Funidade   : string;
      Ftelefones : string;
      Femail     : string;
      FFacebook  : string;
      FInstagram : String;
      FParcial   : string;
      FFinal     : string;
      FOral      : string;
      FMes1      : string;
      FMes2      : string;
      FMes3      : string;
      FMes4      : string;
      FMes5      : string;
      FMes6      : string;
      FFeriados  : string;
      Fpasta     : string;
    Public
      Constructor Create;
      Destructor Destroy; Override;
      Class function New: iModelRAMs;
      Function Dias (Value : string) : iModelRAMs;
      Function Turma (Value : String) : iModelRAMs;
      Function Media (Value : string) : iModelRAMs;
      Function Professor (Value : string) : iModelRAMs;
      Function Horario (Value : string) : iModelRAMs;
      Function Meses (Value : string) : iModelRAMs;
      Function Periodo (Value : string) : iModelRAMs;
      Function Inicio (Value : Integer) : iModelRAMs;
      Function Fim (value : integer) : iModelRAMs;
      Function licoes (Value : string) : iModelRAMs;
      Function Alunos (Alunos : tstrings) : iModelRAMs;
      Function Gerar : iModelRAMs;
  End;

implementation

{ TModelRAMs }

function TModelRAMs.Alunos(Alunos: tstrings): iModelRAMs;
begin
   Falunos := Alunos;
end;

constructor TModelRAMs.Create;
begin

end;

destructor TModelRAMs.Destroy;
begin

  inherited;
end;

function TModelRAMs.Dias(Value: string): iModelRAMs;
begin
   Fdias := Value;
end;

function TModelRAMs.Fim(value: integer): iModelRAMs;
begin
   Ffim := Value;
end;

function TModelRAMs.Gerar: iModelRAMs;
begin

end;

function TModelRAMs.Horario(Value: string): iModelRAMs;
begin
   Fhorario := Value;
end;

function TModelRAMs.Inicio(Value: integer): iModelRAMs;
begin
   Finicio := Value;
end;

function TModelRAMs.licoes(Value: string): iModelRAMs;
begin
   Flicoes := Value;
end;

function TModelRAMs.Media(Value: string): iModelRAMs;
begin
   Fmedia := Value;
end;

function TModelRAMs.Meses(Value: string): iModelRAMs;
begin
   Fmeses := Value;
end;

class function TModelRAMs.New: iModelRAMs;
begin
   Result := self.create;
end;

function TModelRAMs.Periodo(Value: string): iModelRAMs;
begin
   Fperiodo := Value;
end;

function TModelRAMs.Professor(Value: string): iModelRAMs;
begin
   Fprofessor := Value;
end;

function TModelRAMs.Turma(Value: String): iModelRAMs;
begin
   Fturma := Value;
end;

end.
