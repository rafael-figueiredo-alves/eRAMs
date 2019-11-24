unit eRAMs.Model.Interfaces;

interface

uses
  FireDAC.Comp.Client, System.Classes;


Type

  iModelConexaoSOP = Interface
    ['{8F2718BD-31FA-452B-83C9-325F3D7D9153}']
     Function Periodos : tfdmemtable;
     Function Turmas  (Periodo: string) : tfdmemtable;
     Function Turma   (Periodo, Turma: string) : tfdmemtable;
     Function Alunos  (periodo, Cod_cur, Num_niv, num_tur: string) : tfdmemtable;
  End;

  iModelConfiguracao = Interface
    ['{DA649233-8D44-4B75-9036-67216DB10DDE}']
    Function GravaConfiguracoes : iModelConfiguracao;
    Function Servidor : String; Overload;
    Function Servidor (Servidor: String) : iModelConfiguracao; Overload;
    Function PastaRams : String; Overload;
    Function PastaRams (Pasta: String) : iModelConfiguracao; Overload;
    Function UID : String; Overload;
    Function UID (UID: String) : iModelConfiguracao; Overload;
    Function PWD : String; Overload;
    Function PWD (PWD: String) : iModelConfiguracao; Overload;
    Function Unidade : String; Overload;
    Function Unidade (Unidade: String) : iModelConfiguracao; Overload;
    Function Telefones : String; Overload;
    Function Telefones (Telefones: String) : iModelConfiguracao; Overload;
    Function Email : String; Overload;
    Function Email (Email: String) : iModelConfiguracao; Overload;
    Function Facebook : String; Overload;
    Function Facebook (Facebook: String) : iModelConfiguracao; Overload;
    Function Instagram : String; Overload;
    Function Instagram (Instagram: String) : iModelConfiguracao; Overload;
    Function Banco : string; Overload;
    Function Banco (Value: string) : iModelConfiguracao; overload;
  End;

  iModelCalendario = interface
    ['{503AE2C1-7C28-470A-85F2-D8526A321B07}']
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
  end;

  iModelRAMs = interface
    ['{3A92F349-9D44-450F-97E6-E80351027DA5}']
    Function Dias (Value : string) : iModelRAMs;
    Function Turma (Value : String) : iModelRAMs;
    Function Media (Value : string) : iModelRAMs;
    Function Professor (Value : string) : iModelRAMs;
    Function Horario (Value : string) : iModelRAMs;
    Function Meses (Value : string) : iModelRAMs;
    Function Periodo (Value : string) : iModelRAMs;
    Function Inicio (Value : integer) : iModelRAMs;
    Function Fim (value : integer) : iModelRAMs;
    Function licoes (Value : string) : iModelRAMs;
    Function Alunos (Alunos : tstrings) : iModelRAMs;
    Function Gerar : iModelRAMs;
  end;


implementation

end.
