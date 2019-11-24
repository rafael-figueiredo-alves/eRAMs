unit eRAMs.Model.ConexaoSOP;

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
  FireDAC.Phys.MSSQL,
  FireDAC.Comp.UI,
  FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client;

Type
  TModelConexaoSOP = Class(TInterfacedObject, iModelConexaoSOP)
    Private
      FConexao : tfdconnection;
      Class var FConn : iModelConexaoSOP;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelConexaoSOP;
     Function Periodos: tfdmemtable;
     Function Turmas  (Periodo: string) : tfdmemtable;
     Function Turma   (Periodo, Turma: string) : tfdmemtable;
     Function Alunos  (periodo, Cod_cur, Num_niv, num_tur: string) : tfdmemtable;
  End;

implementation

uses
  eRAMs.Model.Configuracao, System.SysUtils, eRAMs.Model.Consts,
  FireDAC.Stan.Param;

{ TModelConexaoSOP }

function TModelConexaoSOP.Alunos(periodo, Cod_cur, Num_niv, num_tur: string): tfdmemtable;
Var
   SQL_ALUNOS1, SQL_ALUNOS2 : string;
begin

    //tentar achar outra solução para fazer a busca de alunos melhorar
    SQL_ALUNOS1 := 'SELECT DISTINCT Alu.Nom_alu from tbAlunos alu, tbMatricula Mat WHERE (Mat.Cod_cur = '+cod_cur+') and (mat.Num_niv = '+num_niv+') and (mat.num_tur = '+num_tur+') and (Mat.num_per = '+quotedstr(periodo)+') ';
    SQL_ALUNOS2 := 'and ((Mat.flg_Mat = ''MP'') or (Mat.flg_mat = ''PM'')) and (Alu.cod_alu = mat.cod_alu) and (datediff(day, alu.dat_nas, getdate()) < 6574) ORDER BY Alu.Nom_alu';
    FConexao.ExecSQL(SQL_ALUNOS1+SQL_ALUNOS2, tdataset(Result));

end;

constructor TModelConexaoSOP.Create;
var Config: iModelConfiguracao;
begin
   FConexao := TFDConnection.Create(nil);
   Config := TModelConfiguracao.New;
   if (Config.Servidor <> '') and (config.UID <> '') and (Config.PWD <> '') then
    begin
      FConexao.DriverName := 'MSSQL';
      FConexao.Params.Database := 'SopGruPrd';
      FConexao.Params.UserName := Config.UID;
      FConexao.Params.Password := Config.PWD;
      FConexao.Params.Add('Server='+config.Servidor);
    end;
   FConexao.Connected := True;
end;

destructor TModelConexaoSOP.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

class function TModelConexaoSOP.New: iModelConexaoSOP;
begin
   if not Assigned(FConn) then
    Fconn := Self.Create;
   Result := FConn;
end;

function TModelConexaoSOP.Periodos: tfdmemtable;
begin
    FConexao.ExecSQl(SQL_PERIODOS, tdataset(Result));
end;

function TModelConexaoSOP.Turma(Periodo, Turma: string): tfdmemtable;
var
   Parametros : tfdparams;
begin
   Parametros := TFDParams.Create;
   try
    parametros.Add('periodo', periodo);
    Parametros.Add('turma', turma);
    FConexao.ExecSQL(SQL_TURMAS1+SQL_TURMAS2, parametros, tdataset(Result));
   finally
    Parametros.DisposeOf;
   end;
end;

function TModelConexaoSOP.Turmas(periodo: string): tfdmemtable;
var
  Parametros : TFDParams;
begin
   Parametros := TFDParams.Create;
   try
    Parametros.Add('periodo', periodo);
    FConexao.ExecSQL(SQL_LISTA_TURMAS1+SQL_LISTA_TURMAS2, Parametros , tdataset(Result));
   finally
    Parametros.DisposeOf;
   end;
end;

end.
