unit eRAMs.Model.ConexaoBD;

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
  TModelConexaoBD = Class(TInterfacedObject, iModelConexaoSOP)
    Private
      FConexao : tfdconnection;
      Class var FConn : iModelConexaoSOP;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelConexaoSOP;
     Function Periodos : tfdmemtable;
     Function Turmas  (Periodo: string) : tfdmemtable;
     Function Turma   (Periodo, Turma: string) : tfdmemtable;
     Function Alunos  (periodo, Cod_cur, Num_niv, num_tur: string) : tfdmemtable;
  End;

implementation

uses
  eRAMs.Model.Configuracao, System.SysUtils, eRAMs.Model.Consts2,
  FireDAC.Stan.Param, FMX.Dialogs;

{ TModelConexaoSOP }

function TModelConexaoBD.Alunos(periodo, Cod_cur, Num_niv, num_tur: string): tfdmemtable;
var
   teste1: string;
   teste2: string;
begin

    //tentar achar outra solução para fazer a busca de alunos melhorar
    Teste1 := 'SELECT DISTINCT Alu.Nom_alu from tbAlunos alu, tbMatricula Mat WHERE (Mat.Cod_cur = '+cod_cur+') and (mat.Num_niv = '+num_niv+') and (mat.num_tur = '+Num_tur+') and (Mat.num_per = '+quotedstr(periodo)+') ';
    teste2 := 'and ((Mat.flg_Mat = ''MP'') or (Mat.flg_mat = ''PM'')) and (Alu.cod_alu = mat.cod_alu) and (datediff(''d'', alu.dat_nas, now()) < 6574) ORDER BY Alu.Nom_alu';
    FConexao.ExecSQL(teste1+teste2, tdataset(Result));

end;

constructor TModelConexaoBD.Create;
var Config: iModelConfiguracao;
begin
   FConexao := TFDConnection.Create(nil);
   Config := TModelConfiguracao.New;
   if (Config.Servidor <> '') and (config.UID <> '') and (Config.PWD <> '') then
    begin
      FConexao.DriverName := 'MSAcc';
      FConexao.Params.Database := 'C:\JRD soluções\eRAMs\BD\sop.mdb';
    end;
   FConexao.LoginPrompt := false;
end;

destructor TModelConexaoBD.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

class function TModelConexaoBd.New: iModelConexaoSOP;
begin
   if not Assigned(FConn) then
    Fconn := Self.Create;
   Result := FConn;
end;

function TModelConexaoBd.Periodos: tfdmemtable;
begin
   FConexao.ExecSQl(SQL_PERIODOS, tdataset(Result));
end;

function TModelConexaoBD.Turma(Periodo, Turma: string): tfdmemtable;
var
   Parametros : tfdparams;
begin
   Parametros := TFDParams.Create;
   try
    parametros.Add('periodo', periodo);
    Parametros.Add('turma', Turma, ptInput);
    FConexao.ExecSQL(SQL_TURMAS1+SQL_TURMAS2, parametros, tdataset(Result));
   finally
    Parametros.DisposeOf;
   end;
end;

function TModelConexaoBD.Turmas(periodo: string): tfdmemtable;
var
  Parametros : TFDParams;
begin
   Parametros := TFDParams.Create;
   try
    Parametros.Add('periodo', periodo);
    FConexao.ExecSQL(SQL_Lista_TURMAS1+SQL_Lista_TURMAS2, Parametros , TDataSet(Result));
   finally
    Parametros.DisposeOf;
   end;
end;

end.
