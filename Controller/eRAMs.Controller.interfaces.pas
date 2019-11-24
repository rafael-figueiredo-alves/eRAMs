unit eRAMs.Controller.interfaces;

interface

uses
  eRAMs.Model.Interfaces, FMX.ListBox,
  System.Classes;

Type

  iControllerConfiguracao = interface
    ['{D57BC02A-63D7-441C-9706-9A2CD5782BAA}']
    Function Servidor(Value: String): iControllerConfiguracao; Overload;
    Function Servidor(Value: TObject): iControllerConfiguracao; Overload;
    Function UID(Value: String): iControllerConfiguracao; Overload;
    Function UID(Value: tobject): iControllerConfiguracao; Overload;
    Function PWD(Value: String): iControllerConfiguracao; Overload;
    Function PWD(Value: tobject): iControllerConfiguracao; Overload;
    Function Pasta(Value: String): iControllerConfiguracao; Overload;
    Function Pasta(Value: tobject): iControllerConfiguracao; Overload;
    Function Unidade(Value: String): iControllerConfiguracao; Overload;
    Function Unidade(Value: tobject): iControllerConfiguracao; Overload;
    Function Telefones(Value: String): iControllerConfiguracao; Overload;
    Function Telefones(Value: tobject): iControllerConfiguracao; Overload;
    Function Email(Value: String): iControllerConfiguracao; Overload;
    Function Email(Value: tobject): iControllerConfiguracao; Overload;
    Function Facebook(Value: String): iControllerConfiguracao; Overload;
    Function Facebook(Value: tobject): iControllerConfiguracao; Overload;
    Function Instagram(Value: String): iControllerConfiguracao; Overload;
    Function Instagram(Value: tobject): iControllerConfiguracao; Overload;
    Function Banco(Value: String): iControllerConfiguracao; Overload;
    Function Banco(Value: tobject): iControllerConfiguracao; Overload;
    Function Gravar : iControllerConfiguracao;
  end;

 iControllerPeriodos = interface
    ['{D02EEFC3-BEBE-44AD-A4A6-21295090E847}']
    Function Listar (Lista: TObject) : iControllerPeriodos;
  end;

 iControllerTurmas = interface
    ['{E06D8F19-363C-4A73-BB44-F36947371507}']
    Function Listar (periodo: string; Lista: Tlistbox) : iControllerTurmas;
    Function Buscar (periodo, Turma : String) : iControllerTurmas;
    Function Cod_cur : string;
    Function Num_Niv : string;
    Function Num_Tur : string;
    Function Media : string;
    Function Dias : string;
    Function Horario : string;
    Function Turma : string;
    Function Periodo : string;
    Function Professor : string;
    Function DiasApresentar : string;
  end;

  iControllerAlunos = interface
    ['{11FF69F6-70F4-418D-9C54-644C2CDD0486}']
    Function Listar (periodo, Cod_cur, num_niv, num_tur: string;Lista : TListBox) : iControllerAlunos;
  end;

  iControllerFuncoes = interface
    ['{21A1E88A-EF9E-47A3-8379-9B9C9EBDFA77}']
    Function MontarMeses (Periodo, Meses: integer): iControllerFuncoes;
    Function LimpaTela : iControllerFuncoes;
    Function DeterminarNumeroLicoes (Turma : string) : iControllerFuncoes;
  end;

  iControllerCalendario = interface
    ['{A71869D7-5655-4FEB-B1CB-2BE819DF9215}']
    Function Busca (Dias: string): iControllerCalendario;
    Function Listar (Value: TListBox): iControllerCalendario;
    Function Salvar : Boolean;
    Function Dias : string; Overload;
    Function Dias (Value : string) : iControllerCalendario; Overload;
    Function Mes1 : string; Overload;
    Function Mes1 (Value : string) : iControllerCalendario; Overload;
    Function Mes2 : string; Overload;
    Function Mes2 (Value : string) : iControllerCalendario; Overload;
    Function Mes3 : string; Overload;
    Function Mes3 (Value : string) : iControllerCalendario; Overload;
    Function Mes4 : string; Overload;
    Function Mes4 (Value : string) : iControllerCalendario; Overload;
    Function Mes5 : string; Overload;
    Function Mes5 (Value : string) : iControllerCalendario; Overload;
    Function Mes6 : string; Overload;
    Function Mes6 (Value : string) : iControllerCalendario; Overload;
    Function Feriados : string; Overload;
    Function Feriados (Value : string) : iControllerCalendario; Overload;
    Function Parcial : string; Overload;
    Function Parcial (Value : string) : iControllerCalendario; Overload;
    Function ProvaFinal : string; Overload;
    Function ProvaFinal (Value : string) : iControllerCalendario; Overload;
    Function Oral : string; Overload;
    Function Oral (Value : string) : iControllerCalendario; Overload;
  end;

  iControllerRAMs = interface
    ['{D666D61F-157D-44A3-8FB8-F5A2336E0C0E}']
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
  end;

implementation

end.
