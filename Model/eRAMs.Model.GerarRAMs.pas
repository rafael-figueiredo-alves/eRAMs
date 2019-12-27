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
      FMes1Nome  : string;
      FMes2Nome  : string;
      FMes3Nome  : string;
      FMes4Nome  : string;
      FMes5Nome  : string;
      FMes6Nome  : string;
      FFeriados  : string;
      Fpasta     : string;
      FAvalia1   : string;
      FAvalia2   : string;
      FAvalia3   : string;
      FAvalia4   : string;
      FAvalia5   : string;
      FExcel : Variant;
      Procedure DefinePastaRAMs;
      Procedure CarregaCalendario;
      Function RAMexiste (Value : string) : boolean;
      Procedure CriaMesesAvalia;
      Procedure GerarRelatorio(Value : string);
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
      Function Gerar : Boolean;
  End;

implementation

{ TModelRAMs }

Uses ComObj, System.Variants, Winapi.ActiveX, eRAMs.Model.Factory, FMX.Dialogs,
  System.SysUtils;

function TModelRAMs.Alunos(Alunos: tstrings): iModelRAMs;
begin
   Result := Self;
   Falunos := Alunos;
end;

procedure TModelRAMs.CarregaCalendario;
var Calendario : iModelCalendario;
    Periodo : string;
begin
   Calendario := TModelFactory.New.Calendario;
   Calendario.Busca(Fdias);
   FMes1     := Calendario.Mes1;
   FMes2     := Calendario.Mes2;
   FMes3     := Calendario.Mes3;
   FMes4     := Calendario.Mes4;
   FMes5     := Calendario.Mes5;
   FMes6     := Calendario.Mes6;
   FFeriados := Calendario.Feriados;
   FParcial  := Calendario.Parcial;
   FFinal    := Calendario.ProvaFinal;
   FOral     := Calendario.Oral;
   Periodo   := Copy(Fperiodo, 6, 1);
   case Periodo.ToInteger of
   2: begin
         FMes1Nome := 'Fevereiro';
         FMes2Nome := 'Março';
         FMes3Nome := 'Abril';
         FMes4Nome := 'Maio';
         FMes5Nome := 'Junho';
         FMes6Nome := 'Julho';
      end;
   3: begin
         FMes1Nome := 'Julho';
         FMes2Nome := 'Agosto';
         FMes3Nome := 'Setembro';
         FMes4Nome := 'Outubro';
         FMes5Nome := 'Novembro';
         FMes6Nome := 'Dezembro';
      end;
   end;
end;

constructor TModelRAMs.Create;
var Config : iModelConfiguracao;
begin
   Config     := TModelFactory.New.Configuracao;
   Funidade   := Config.Unidade;
   Ftelefones := Config.Telefones;
   FFacebook  := Config.Facebook;
   Femail     := config.Email;
   FInstagram := Config.Instagram;
   Fpasta     := Config.PastaRams;
   CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
   FExcel :=  CreateOleObject('Excel.Application');
   FExcel.displayalerts:= false;
end;

procedure TModelRAMs.CriaMesesAvalia;
begin
  case Fmeses.ToInteger of
  4: begin
        FAvalia1 := TModelFactory.New.Funcoes.Mes(Finicio);
        FAvalia2 := TModelFactory.New.Funcoes.Mes(Finicio+1);
        FAvalia3 := TModelFactory.New.Funcoes.Mes(Finicio+2);
        FAvalia4 := TModelFactory.New.Funcoes.Mes(FFim);
        FAvalia5 := '';
     end;
  5: begin
        FAvalia1 := TModelFactory.New.Funcoes.Mes(Finicio);
        FAvalia2 := TModelFactory.New.Funcoes.Mes(Finicio+1);
        FAvalia3 := TModelFactory.New.Funcoes.Mes(Finicio+2);
        FAvalia4 := TModelFactory.New.Funcoes.Mes(Finicio+3);
        FAvalia5 := TModelFactory.New.Funcoes.Mes(FFim);
     end;
  end;
end;

procedure TModelRAMs.DefinePastaRAMs;
var pastaprofessor, pastaperiodo, pastaturma : string;
begin
   //prepara pasta periodo
   pastaperiodo := Fperiodo;
   pastaperiodo := TModelFactory.New.Funcoes.TrocaBarra(pastaperiodo);
   pastaperiodo := pastaperiodo + '\';

   //prepara pasta professor
   pastaprofessor := Fprofessor;
   PastaProfessor := TModelFactory.New.Funcoes.RemoveAsterisco(PastaProfessor);
   PastaProfessor := TModelFactory.New.Funcoes.RemoveParenteses(PastaProfessor);
   PastaProfessor := TModelFactory.New.Funcoes.RemoveEspacosBrancos(PastaProfessor);
   PastaProfessor := pastaprofessor + '\';

   //prepara pasta turma
   pastaturma := Fturma;
   Pastaturma := TModelFactory.New.Funcoes.TrocaBarra(pastaturma);
   Pastaturma := TModelFactory.New.Funcoes.RemoveAsterisco(pastaturma);
   Pastaturma := TModelFactory.New.Funcoes.RemoveParenteses(pastaturma);
   Pastaturma := TModelFactory.New.Funcoes.RemoveEspacosBrancos(pastaturma);
   Pastaturma := Pastaturma + '\';

   //pasta final
   Fpasta := Fpasta + pastaperiodo + pastaprofessor + pastaturma;

   //Criar pastas se necessário
   ForceDirectories(Fpasta);

end;

destructor TModelRAMs.Destroy;
begin
  FExcel.quit;
  FExcel := Unassigned;
  inherited;
end;

function TModelRAMs.Dias(Value: string): iModelRAMs;
begin
   Result := Self;
   Fdias := Value;
end;

function TModelRAMs.Fim(value: integer): iModelRAMs;
begin
   Result := Self;
   Ffim := Value;
end;

function GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

function TModelRAMs.Gerar: Boolean;
Var
    Aluno        : string;
begin

   //Realiza últimas associações de valores necessários
   DefinePastaRAMs;
   CarregaCalendario;
   CriaMesesAvalia;

   //Processo Principal
   //CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
   for aluno in Falunos do
    begin
     GerarRelatorio(Aluno);
    end;
   Result := True;
end;

procedure TModelRAMs.GerarRelatorio(Value: string);
Var
    VersaoExcel  : string;
    ArquivoFinal : string;
begin
     ArquivoFinal := '';
     ArquivoFinal := Fpasta + TModelFactory.New.Funcoes.FormataNomeAluno(Value) + '.xlsm';
     if not RAMexiste(ArquivoFinal) then
      begin



       //Abre Modelo do Relatório
       FExcel.workbooks.open(extractfilepath(paramstr(0))+'modelo\eRAMs.Modelo.xlsm');

       //Cabeçalho do Relatório
       FExcel.workbooks[1].sheets[1].unprotect('ccaa');
       FExcel.workbooks[1].sheets[1].cells[4,18]:= Funidade; //Nome da Unidade
       FExcel.workbooks[1].sheets[1].cells[5,18]:= Ftelefones; //Telefones das unidades
       FExcel.workbooks[1].sheets[1].cells[6,18]:= Femail; //Email da unidade
       FExcel.workbooks[1].sheets[1].cells[97,18]:= FFacebook; //Facebook da Unidade
       FExcel.workbooks[1].sheets[1].cells[97,4]:= FInstagram; //Instagram da Unidade
       FExcel.workbooks[1].sheets[1].protect('ccaa');

       //Dados do Aluno
       FExcel.workbooks[1].sheets[1].cells[8,2]:= TModelFactory.New.Funcoes.FormataNomeAluno(Value); //Nome do Aluno
       FExcel.workbooks[1].sheets[1].cells[10,3]:= Fturma; //Turma do Aluno
       FExcel.workbooks[1].sheets[1].cells[10,8]:= Fhorario; //Horário da turma
       FExcel.workbooks[1].sheets[1].cells[10,13]:= TModelFactory.New.Funcoes.FormataNomeProfessor(Fprofessor); //Professor da Turma

       //Dados das Provas
       FExcel.workbooks[1].sheets[1].cells[16,4]:= FParcial;
       FExcel.workbooks[1].sheets[1].cells[17,4]:= FFinal;
       FExcel.workbooks[1].sheets[1].cells[18,4]:= FOral;
       FExcel.workbooks[1].sheets[1].cells[19,5]:= Fmedia;

       //Dados do Calendário Letivo *cabeçalho
       FExcel.workbooks[1].sheets[1].cells[14,7]:= FMes1Nome;
       FExcel.workbooks[1].sheets[1].cells[14,9]:= FMes2Nome;
       FExcel.workbooks[1].sheets[1].cells[14,11]:= FMes3Nome;
       FExcel.workbooks[1].sheets[1].cells[14,13]:= FMes4Nome;
       FExcel.workbooks[1].sheets[1].cells[14,15]:= FMes5Nome;
       FExcel.workbooks[1].sheets[1].cells[14,17]:= FMes6Nome;
       //Dados do Calendário Letivo *datas
       FExcel.workbooks[1].sheets[1].cells[15,7]:= FMes1;
       FExcel.workbooks[1].sheets[1].cells[15,9]:= FMes2;
       FExcel.workbooks[1].sheets[1].cells[15,11]:= FMes3;
       FExcel.workbooks[1].sheets[1].cells[15,13]:= FMes4;
       FExcel.workbooks[1].sheets[1].cells[15,15]:= FMes5;
       FExcel.workbooks[1].sheets[1].cells[15,17]:= FMes6;
       FExcel.workbooks[1].sheets[1].cells[15,19]:= FFeriados;

       //Meses de Avaliações
       FExcel.workbooks[1].sheets[1].cells[23,5]:= FAvalia1;
       FExcel.workbooks[1].sheets[1].cells[23,7]:= FAvalia2;
       FExcel.workbooks[1].sheets[1].cells[23,9]:= FAvalia3;
       FExcel.workbooks[1].sheets[1].cells[23,11]:= FAvalia4;
       FExcel.workbooks[1].sheets[1].cells[23,13]:= FAvalia5;

       //Formata lições
       case Flicoes.ToInteger of
       10:
        begin
          FExcel.workbooks[1].sheets[1].cells[55,12]:= '9';
          FExcel.workbooks[1].sheets[1].cells[56,12]:= '10';
        end;
       12:
        begin
          FExcel.workbooks[1].sheets[1].cells[55,12]:= '9';
          FExcel.workbooks[1].sheets[1].cells[56,12]:= '10';
          FExcel.workbooks[1].sheets[1].cells[57,12]:= '11';
          FExcel.workbooks[1].sheets[1].cells[58,12]:= '12';
        end;
       14:
        begin
          FExcel.workbooks[1].sheets[1].cells[55,12]:= '9';
          FExcel.workbooks[1].sheets[1].cells[56,12]:= '10';
          FExcel.workbooks[1].sheets[1].cells[57,12]:= '11';
          FExcel.workbooks[1].sheets[1].cells[58,12]:= '12';
          FExcel.workbooks[1].sheets[1].cells[59,12]:= '13';
          FExcel.workbooks[1].sheets[1].cells[60,12]:= '14';
        end;
       end;

       //Testa versão do Excel para salvar arquivo corretamente
       VersaoExcel:= GetStrNumber(FExcel.version);
       if VersaoExcel.ToInteger < 120 then
        FExcel.workbooks[1].saveas(Fpasta + TModelFactory.New.Funcoes.FormataNomeAluno(Value) + '.xlsm')
       Else
        FExcel.workbooks[1].saveas(Fpasta + TModelFactory.New.Funcoes.FormataNomeAluno(Value) + '.xlsm', 52);

       //Fecha Modelo Excel para reabrir
       Fexcel.workbooks[1].close(False);
end;
end;

function TModelRAMs.Horario(Value: string): iModelRAMs;
begin
   Result := Self;
   Fhorario := Value;
end;

function TModelRAMs.Inicio(Value: integer): iModelRAMs;
begin
   Result := Self;
   Finicio := Value;
end;

function TModelRAMs.licoes(Value: string): iModelRAMs;
begin
   Result := Self;
   Flicoes := Value;
end;

function TModelRAMs.Media(Value: string): iModelRAMs;
begin
   Result := Self;
   Fmedia := Value;
end;

function TModelRAMs.Meses(Value: string): iModelRAMs;
begin
   Result := Self;
   Fmeses := Value;
end;

class function TModelRAMs.New: iModelRAMs;
begin
   Result := self.create;
end;

function TModelRAMs.Periodo(Value: string): iModelRAMs;
begin
   Result := Self;
   Fperiodo := Value;
end;

function TModelRAMs.Professor(Value: string): iModelRAMs;
begin
   Result := Self;
   Fprofessor := Value;
end;

function TModelRAMs.RAMexiste(Value: string): boolean;
begin
  Result := FileExists(value);
end;

function TModelRAMs.Turma(Value: String): iModelRAMs;
begin
   Result := Self;
   Fturma := Value;
end;

end.
