unit eRAMs.Model.Funcoes;

interface

uses
  eRAMs.Model.Interfaces;

Type
  TModelFuncoes = Class(TInterfacedObject, iModelFuncoes)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelFuncoes;
     Function RemoveAsterisco (Value : string) : string;
     Function TrocaBarra (Value : string) : string;
     Function RemoveParenteses (Value : string) : string;
     Function RemoveEspacosBrancos (Value : string) : string;
     Function Mes (Value : integer) : string;
     Function FormataNomeAluno (Value : string) : string;
     Function FormataNomeProfessor (Value : string) : string;
     Function FormataNomeTurma (Value : string) : string;
  End;

implementation

uses
  System.SysUtils;

{ TModelFuncoes }

constructor TModelFuncoes.Create;
begin

end;

destructor TModelFuncoes.Destroy;
begin

  inherited;
end;

function TModelFuncoes.FormataNomeAluno(Value: string): string;
begin
    Result := RemoveAsterisco(value);
    Result := RemoveParenteses(Result);
    Result := RemoveEspacosBrancos(Result);
end;

function TModelFuncoes.FormataNomeProfessor(Value: string): string;
begin
    Result := RemoveAsterisco(value);
    Result := RemoveParenteses(Result);
    Result := RemoveEspacosBrancos(Result);
end;

function TModelFuncoes.FormataNomeTurma(Value: string): string;
begin
    Result := RemoveAsterisco(value);
    Result := RemoveParenteses(Result);
    Result := RemoveEspacosBrancos(Result);
end;

function TModelFuncoes.Mes(Value: integer): string;
begin
   case value of
   1  :  Result := 'Janeiro';
   2  :  Result := 'Fevereiro';
   3  :  Result := 'Março';
   4  :  Result := 'Abril';
   5  :  Result := 'Maio';
   6  :  Result := 'Junho';
   7  :  Result := 'Julho';
   8  :  Result := 'Agosto';
   9  :  Result := 'Setembro';
   10 :  Result := 'Outubro';
   11 :  Result := 'Novembro';
   12 :  Result := 'Dezembro';
   end;
end;

class function TModelFuncoes.New: iModelFuncoes;
begin
    Result := Self.Create;
end;

function TModelFuncoes.RemoveAsterisco(Value: string): string;
var i : integer;
begin
   for I := Low(value) to High(value) do
    begin
      if value[i] = '*' then
       Result := Result
      else
       Result := Result + Value[i];
    end;
end;

function TModelFuncoes.RemoveEspacosBrancos(Value: string): string;
begin
   Result := TrimRight(Value);
end;

function TModelFuncoes.RemoveParenteses(Value: string): string;
begin
    if Pos('(', value) > 0 then
     begin
       Result := Copy(Value, 0, Pos('(', value)-1)
     end
    else
     Result := Value;
end;

function TModelFuncoes.TrocaBarra(Value: string): string;
var i : integer;
begin
   for I := Low(value) to High(value) do
    begin
      if (value[i] = '/') or (value[i] = '\') then
       Result := Result + '-'
      else
       Result := Result + Value[i];
    end;
end;

end.
