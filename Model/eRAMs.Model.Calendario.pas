unit eRAMs.Model.Calendario;

interface

uses
  eRAMs.Model.Interfaces,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSAccDef,
  FireDAC.Phys.MSAcc,
  FireDAC.Comp.UI,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.Client;

Type
  TModelCalendario = Class(TInterfacedObject, iModelCalendario)
    Private
      Fdias     : string;
      FMes1     : string;
      FMes2     : string;
      FMes3     : string;
      FMes4     : string;
      FMes5     : string;
      FMes6     : string;
      FFeriados : string;
      FParcial  : string;
      FFinal    : string;
      FOral     : string;
      FConexao : tfdconnection;
    Public
      Constructor Create;
      Destructor Destroy; Override;
      Class function New: iModelCalendario;
      Function Busca (Dias: string): iModelCalendario;
      Function Listar : TFDMemTable;
      Function Salvar : Boolean;
      Function Dias : string; Overload;
      Function Dias (Value : string) : iModelCalendario; Overload;
      Function Mes1 : string; Overload;
      Function Mes1 (Value : string) : iModelCalendario; Overload;
      Function Mes2 : string; Overload;
      Function Mes2 (Value : string) : iModelCalendario; Overload;
      Function Mes3 : string; Overload;
      Function Mes3 (Value : string) : iModelCalendario; Overload;
      Function Mes4 : string; Overload;
      Function Mes4 (Value : string) : iModelCalendario; Overload;
      Function Mes5 : string; Overload;
      Function Mes5 (Value : string) : iModelCalendario; Overload;
      Function Mes6 : string; Overload;
      Function Mes6 (Value : string) : iModelCalendario; Overload;
      Function Feriados : string; Overload;
      Function Feriados (Value : string) : iModelCalendario; Overload;
      Function Parcial : string; Overload;
      Function Parcial (Value : string) : iModelCalendario; Overload;
      Function ProvaFinal : string; Overload;
      Function ProvaFinal (Value : string) : iModelCalendario; Overload;
      Function Oral : string; Overload;
      Function Oral (Value : string) : iModelCalendario; Overload;
  End;

implementation

uses
  eRAMs.Model.Configuracao, System.SysUtils;

{ TModelCalendario }

function TModelCalendario.Busca(Dias: string): iModelCalendario;
var SQL : string;
    FDados : TFDMemTable;
begin
   Result := self;
   SQL := 'Select Mes1, Mes2, Mes3, Mes4, Mes5, Mes6, Feriados, Parcial, Final, Oral from tbCalendario Where (Dias = '+quotedstr(Dias)+')';
   Fconexao.ExecSQL(sql, tdataset(fdados));
   FDados.First;
   Fdias := Dias;
   FMes1 := FDados.FieldByName('Mes1').AsString;
   FMes2 := FDados.FieldByName('Mes2').AsString;
   FMes3 := FDados.FieldByName('Mes3').AsString;
   FMes4 := FDados.FieldByName('Mes4').AsString;
   FMes5 := FDados.FieldByName('Mes5').AsString;
   FMes6 := FDados.FieldByName('Mes6').AsString;
   FFeriados := FDados.FieldByName('Feriados').AsString;
   FParcial := FDados.FieldByName('Parcial').AsString;
   FFinal := FDados.FieldByName('Final').AsString;
   FOral := FDados.FieldByName('Oral').AsString;
   FDados.DisposeOf;
end;

constructor TModelCalendario.Create;
var Config: iModelConfiguracao;
begin
   FConexao := TFDConnection.Create(nil);
   Config := TModelConfiguracao.New;
   FConexao.DriverName := 'MSAcc';
   FConexao.Params.Database := Config.Banco + 'eRAMs.Calendario.mdb';
   FConexao.LoginPrompt := false;
end;

destructor TModelCalendario.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

function TModelCalendario.Dias: string;
begin
    Result := Fdias;
end;

function TModelCalendario.Dias(Value: string): iModelCalendario;
begin
   Result := self;
   Fdias := Value;
end;

function TModelCalendario.Feriados(Value: string): iModelCalendario;
begin
  Result := self;
  FFeriados := Value;
end;

function TModelCalendario.Feriados: string;
begin
   Result := FFeriados;
end;

function TModelCalendario.Listar: tfdmemtable;
var SQL : string;
begin
    Sql := 'SELECT Dias From tbCalendario Order by Dias';
    FConexao.ExecSQL(sql, TDataSet(Result));
end;

function TModelCalendario.Mes1: string;
begin
   Result := FMes1;
end;

function TModelCalendario.Mes1(Value: string): iModelCalendario;
begin
   Result := self;
   FMes1 := Value;
end;

function TModelCalendario.Mes2(Value: string): iModelCalendario;
begin
  Result := self;
  FMes2 := Value;
end;

function TModelCalendario.Mes2: string;
begin
  Result := FMes2;
end;

function TModelCalendario.Mes3: string;
begin
   Result := FMes3;
end;

function TModelCalendario.Mes3(Value: string): iModelCalendario;
begin
  Result := self;
  FMes3 := Value;
end;

function TModelCalendario.Mes4: string;
begin
   Result := FMes4;
end;

function TModelCalendario.Mes4(Value: string): iModelCalendario;
begin
   Result := self;
   FMes4 := Value;
end;

function TModelCalendario.Mes5: string;
begin
   Result := FMes5;
end;

function TModelCalendario.Mes5(Value: string): iModelCalendario;
begin
   Result := self;
   FMes5 := Value;
end;

function TModelCalendario.Mes6: string;
begin
   Result := FMes6;
end;

function TModelCalendario.Mes6(Value: string): iModelCalendario;
begin
    Result := self;
    FMes6 := Value;
end;

class function TModelCalendario.New: iModelCalendario;
begin
    Result := Self.Create;
end;

function TModelCalendario.Oral(Value: string): iModelCalendario;
begin
   Result := self;
   FOral := Value;
end;

function TModelCalendario.Oral: string;
begin
   Result := FOral;
end;

function TModelCalendario.Parcial: string;
begin
    Result := FParcial;
end;

function TModelCalendario.Parcial(Value: string): iModelCalendario;
begin
   Result := self;
   FParcial := Value;
end;

function TModelCalendario.ProvaFinal: string;
begin
    Result := FFinal;
end;

function TModelCalendario.ProvaFinal(Value: string): iModelCalendario;
begin
   Result := self;
   FFinal := Value;
end;

function TModelCalendario.Salvar: boolean;
var Fdados : TFDMemTable;
    SQL    : String;
    SQL_alterar : string;
    SQL_inserir : string;
    Alterar : Boolean;
begin
   SQL := 'Select dias from tbCalendario Where (Dias = '+quotedstr(Fdias)+')';
   SQL_alterar := 'UPDATE tbCalendario SET Mes1 = '+quotedstr(FMes1)+', Mes2 = '+quotedstr(FMes2)+', mes3 = '+quotedstr(FMes3)+', mes4 = '+quotedstr(FMes4)+', mes5 = '+quotedstr(FMes5)+', mes6 = '+quotedstr(FMes6)+', Feriados = '+quotedstr(FFeriados)+', Parcial = '+quotedstr(FParcial)+', Final = '+quotedstr(FFinal)+', oral = '+quotedstr(FOral)+' where (dias = '+quotedstr(FDias)+')';
   SQL_inserir := 'INSERT INTO tbCalendario (dias, Mes1, mes2, mes3, mes4, mes5, mes6, Feriados, Parcial, Final, Oral) VALUES ('+quotedstr(Fdias)+', '+quotedstr(FMes1)+', '+quotedstr(FMes2)+', '+quotedstr(FMes3)+', '+quotedstr(FMes4)+', '+quotedstr(FMes5)+', '+quotedstr(FMes6)+', '+quotedstr(FFeriados)+', '+quotedstr(FParcial)+', '+quotedstr(FFinal)+', '+quotedstr(FORAL)+')';
   Alterar := FConexao.ExecSQL(sql, tdataset(fdados)) > 0;
   case alterar of
   True: Result := Fconexao.ExecSQL(SQL_alterar) > 0;
   False: Result := FConexao.ExecSQL(SQL_inserir) > 0;
   end;
   Fdados.DisposeOf;
end;

end.
