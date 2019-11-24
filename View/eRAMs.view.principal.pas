unit eRAMs.view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.ListBox,
  FMX.Edit, FMX.SearchBox, FMX.Effects, FMX.MultiView, FMX.DateTimeCtrls,
  FMX.ComboEdit, FMX.Filter.Effects, FMX.TabControl, FMX.Ani;

type
  TFormPrincipal = class(TForm)
    Estilos: TStyleBook;
    LayPrincipal: TLayout;
    Barra: TToolBar;
    BtMenu: TButton;
    ImgMenu: TPath;
    ImgPrincipal: TImage;
    LayTitulo: TLayout;
    TituloMain: TLabel;
    VersaoTitulo: TLabel;
    BtGerarRams: TButton;
    ImgGerarRams: TPath;
    ComboPeriodo: TComboBox;
    ListaTurmasLayout: TRectangle;
    SombraTurmas: TShadowEffect;
    LayListaTurmas: TLayout;
    BarraTurmas: TLayout;
    ListaTurmas: TListBox;
    BuscaTurmas: TSearchBox;
    BtRefreshTurmas: TButton;
    ImgRefresh: TPath;
    LabelListaTurmas: TLabel;
    SombraBarra: TShadowEffect;
    LayAlunosInfo: TLayout;
    LayAlunos1: TLayout;
    LayAlunos2: TLayout;
    LayAlunos3: TLayout;
    LayAlunos4: TLayout;
    LayAlunos5: TLayout;
    ListaAlunos: TListBox;
    SombraListaAlunos: TShadowEffect;
    CabecalhoAlunos: TListBoxHeader;
    LabelListaAlunos: TLabel;
    BtRefreshAlunos: TButton;
    img_refreshAlunos: TPath;
    LabelTurma: TLabel;
    Turma: TLabel;
    LabelHorario: TLabel;
    Horario: TLabel;
    LabelDias: TLabel;
    Dias: TLabel;
    Labelmeses: TLabel;
    Meses4: TRadioButton;
    Meses5: TRadioButton;
    Labelde: TLabel;
    RecCombo1: TRectangle;
    De: TComboBox;
    Labela: TLabel;
    RecCombo2: TRectangle;
    ate: TComboBox;
    Labellicoes: TLabel;
    Licoes8: TRadioButton;
    Licoes10: TRadioButton;
    Licoes14: TRadioButton;
    Labelmedia: TLabel;
    RecCombo3: TRectangle;
    media: TComboBox;
    BtRefreshPeriodos: TButton;
    Img_refresfperiodos: TPath;
    LabelProf: TLabel;
    Professor: TLabel;
    MenuPrincipal: TMultiView;
    Config_title: TLayout;
    Img_setup: TPath;
    LabelConfigTitle: TLabel;
    LinhaDiv: TLine;
    LayoutConfig1: TLayout;
    LabelCFG1: TLabel;
    EdCFGServidor: TEdit;
    LayoutConfig2: TLayout;
    LabelCFG2: TLabel;
    EdCFGUID: TEdit;
    LayoutConfig3: TLayout;
    LabelCFG3: TLabel;
    EdCFGPWD: TEdit;
    LayoutConfig4: TLayout;
    LabelCFG4: TLabel;
    EdCFGPasta: TEdit;
    LayoutConfig5: TLayout;
    LabelCFG5: TLabel;
    EdCFGUnidade: TEdit;
    LayoutConfig6: TLayout;
    LabelCFG6: TLabel;
    EdCFGTelefones: TEdit;
    LayoutConfig7: TLayout;
    LabelCFG7: TLabel;
    EdCFGEmail: TEdit;
    LayoutConfig8: TLayout;
    LabelCFG8: TLabel;
    EdCFGFacebook: TEdit;
    LayoutConfig9: TLayout;
    LabelCFG9: TLabel;
    EdCFGInstagram: TEdit;
    LayoutConfig10: TLayout;
    LabelCFG10: TLabel;
    EdCFGBanco: TEdit;
    BtSalvaConfig: TButton;
    PasswordEditButton1: TPasswordEditButton;
    ClearEditButton1: TClearEditButton;
    LayoutHorario: TLayout;
    Licoes12: TRadioButton;
    BtCalendario: TButton;
    imgCalendario: TPath;
    BtFechar: TButton;
    imgFechar: TPath;
    Line2: TLine;
    FillRGBEffect1: TFillRGBEffect;
    CaixaSobre: TMultiView;
    LaySobre1: TLayout;
    LaySobre2: TLayout;
    ImgSobre: TImage;
    LaySobre3: TLayout;
    LabelSobre1: TLabel;
    LabelSobre2: TLabel;
    LabelSobre3: TLabel;
    LaySobre4: TLayout;
    LabelSobre4: TLabel;
    LineSobre: TLine;
    LabelSobre5: TLabel;
    MenuCalendario: TMultiView;
    TabCalendarios: TTabControl;
    TabCalMain: TTabItem;
    TabCalEdit: TTabItem;
    LayCalendario1: TLayout;
    LabelCalendarioTitulo: TLabel;
    BtAddCalendario: TButton;
    LayCalendario2: TLayout;
    Labelcalendario2: TLabel;
    BtCalOK: TButton;
    BtCalCancelar: TButton;
    ListaDatasCalendario: TListBox;
    pesquisadatacalendario: TSearchBox;
    ListaCalendarioDetalhes: TVertScrollBox;
    LayDias: TLayout;
    LbDias: TLabel;
    EdDias: TEdit;
    LayProvas: TLayout;
    LbHeadProvas: TLabel;
    LinhaProvas: TLine;
    LayParcial: TLayout;
    LabelParcial: TLabel;
    EdParcial: TEdit;
    LayFinal: TLayout;
    LabelFinal: TLabel;
    EdFinal: TEdit;
    LayOral: TLayout;
    LabelOral: TLabel;
    EdOral: TEdit;
    LayMesesEFeriados: TLayout;
    LbHeadMeseseFeriados: TLabel;
    LinhaMeseseFeriados: TLine;
    LayMes1: TLayout;
    LabelMes1: TLabel;
    EdMes1: TEdit;
    LayMes2: TLayout;
    LabelMes2: TLabel;
    EdMes2: TEdit;
    LayMes3: TLayout;
    LabelMes3: TLabel;
    EdMes3: TEdit;
    LayMes4: TLayout;
    LabelMes4: TLabel;
    EdMes4: TEdit;
    LayMes5: TLayout;
    LabelMes5: TLabel;
    EdMes5: TEdit;
    LayMes6: TLayout;
    LabelMes6: TLabel;
    EdMes6: TEdit;
    LayFeriados: TLayout;
    LabelFeriados: TLabel;
    EdFeriado: TEdit;
    LayMsg: TLayout;
    Sombra: TRectangle;
    TabMensagem: TTabControl;
    TabProcessando: TTabItem;
    TabGerado: TTabItem;
    LayMsg2: TLayout;
    LabelMsg2: TLabel;
    LayMsg1: TLayout;
    LabelMsg1: TLabel;
    Indicador: TAniIndicator;
    ImgSucessoMsg: TRectangle;
    procedure MenuPrincipalStartShowing(Sender: TObject);
    procedure BtSalvaConfigClick(Sender: TObject);
    procedure BtRefreshPeriodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtRefreshTurmasClick(Sender: TObject);
    procedure ListaTurmasItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ComboPeriodoChange(Sender: TObject);
    procedure Meses4Click(Sender: TObject);
    procedure Meses5Click(Sender: TObject);
    procedure Licoes8Click(Sender: TObject);
    procedure Licoes10Click(Sender: TObject);
    procedure Licoes14Click(Sender: TObject);
    procedure BtRefreshAlunosClick(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
    procedure ImgPrincipalClick(Sender: TObject);
    procedure BtCalendarioClick(Sender: TObject);
    procedure BtCalCancelarClick(Sender: TObject);
    procedure BtAddCalendarioClick(Sender: TObject);
    procedure MenuCalendarioStartShowing(Sender: TObject);
    procedure ListaDatasCalendarioItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure BtCalOKClick(Sender: TObject);
    procedure BtGerarRamsClick(Sender: TObject);
  private
    { Private declarations }
    FMeses  : string;
    FLicoes : string;
    FPeriodo    : string;
    FTurma      : string;
    FCod_cur    : string;
    FNum_niv    : string;
    FNum_tur    : string;
    FMedia      : string;
    FDias       : string;
    FHorario    : string;
    FProfessor  : string;
    Procedure DefineMeses;
    Procedure ExibeSobre;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  eRAMs.Controller.configuracao, eRAMs.Controller.periodos,
  eRAMs.Controller.turmas, eRAMs.Controller.Alunos,
  eRAMs.Controller.interfaces, eRAMs.Controller.Funcoes,
  eRAMs.Controller.Calendario, eRAMs.Controller.GerarRAMs;

{$R *.fmx}

procedure TFormPrincipal.BtAddCalendarioClick(Sender: TObject);
begin
    TabCalendarios.Next();
    EdDias.Text := '';
    EdMes1.Text := '';
    EdMes2.Text := '';
    EdMes3.Text := '';
    EdMes4.Text := '';
    EdMes5.Text := '';
    EdMes6.Text := '';
    EdFeriado.Text := '';
    EdParcial.Text := '';
    EdFinal.Text := '';
    EdOral.Text := '';
    EdDias.SetFocus;
end;

procedure TFormPrincipal.BtCalCancelarClick(Sender: TObject);
begin
    TabCalendarios.Previous();
end;

procedure TFormPrincipal.BtCalendarioClick(Sender: TObject);
begin
    MenuPrincipal.HideMaster;
    MenuCalendario.ShowMaster;
    TabCalendarios.ActiveTab := tabCalMain;
end;

procedure TFormPrincipal.BtCalOKClick(Sender: TObject);
var teste : Boolean;
begin
   teste := TControllerCalendario.New
                                   .Dias(edDias.Text)
                                   .Mes1(edmes1.Text)
                                   .Mes2(edmes2.Text)
                                   .Mes3(edmes3.Text)
                                   .Mes4(edmes4.Text)
                                   .Mes5(edmes5.Text)
                                   .Mes6(edmes6.Text)
                                   .Feriados(EdFeriado.Text)
                                   .Parcial(EdParcial.Text)
                                   .ProvaFinal(EdFinal.Text)
                                   .Oral(EdOral.Text)
                                   .Salvar;
  case Teste of
   True: begin
          ShowMessage('Informações salvas com sucesso!');
          TabCalendarios.Previous();
          TControllerCalendario.New.Listar(ListaDatasCalendario);
         end;
   False: begin
           ShowMessage('Informações não conseguiram ser salvas com sucesso!');
           TabCalendarios.Previous();
           TControllerCalendario.New.Listar(ListaDatasCalendario);
          end;
  end;
end;

procedure TFormPrincipal.BtFecharClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFormPrincipal.BtGerarRamsClick(Sender: TObject);
begin
   formprincipal.LayMsg.Visible := true;
   FormPrincipal.TabMensagem.ActiveTab := formprincipal.TabProcessando;
   formprincipal.Indicador.Enabled := True;
    tcontrollerRAMs.New
                       .Dias(FDias)
                       .Turma(FTurma)
                       .Media(media.Selected.Text)
                       .Professor(FProfessor)
                       .Horario(FHorario)
                       .Meses(FMeses)
                       .Periodo(FPeriodo)
                       .Inicio(De.ItemIndex+1)
                       .Fim(ate.ItemIndex+1)
                       .licoes(FLicoes)
                       .Alunos(ListaAlunos.Items)
                       .Gerar;
end;

procedure TFormPrincipal.BtRefreshAlunosClick(Sender: TObject);
begin
    tcontrollerAlunos.New.Listar(Fperiodo, FCod_cur, fNum_Niv, FNum_Tur, ListaAlunos);
end;

procedure TFormPrincipal.BtRefreshPeriodosClick(Sender: TObject);
begin
    tcontrollerPeriodos.New.Listar(ComboPeriodo);
end;

procedure TFormPrincipal.BtRefreshTurmasClick(Sender: TObject);
begin
    TControllerTurmas.New.Listar(ComboPeriodo.Selected.Text, listaturmas);
    TControllerFuncoes.New.LimpaTela;
    BtRefreshTurmas.Enabled := True;
end;

procedure TFormPrincipal.BtSalvaConfigClick(Sender: TObject);
begin
    tControllerConfiguracao.New
     .Servidor(EdCFGServidor.Text)
     .UID(EdCFGUID.Text)
     .PWD(EdCFGPWD.Text)
     .Pasta(EdCFGPasta.Text)
     .Unidade(EdCFGUnidade.Text)
     .Telefones(EdCFGTelefones.Text)
     .Email(EdCFGEmail.Text)
     .Facebook(EdCFGFacebook.Text)
     .Instagram(EdCFGInstagram.Text)
     .Banco(EdCFGBanco.Text)
     .Gravar;
    MenuPrincipal.HideMaster;
    ShowMessage('Configurações salvas com sucesso!');
end;

procedure TFormPrincipal.ComboPeriodoChange(Sender: TObject);
begin
    if ComboPeriodo.ItemIndex <> -1 then
     begin
      TControllerTurmas.New.Listar(ComboPeriodo.Selected.Text, listaturmas);
      FPeriodo := ComboPeriodo.Selected.Text;
      if FPeriodo[6] = '2' then
       begin
        FMeses := '5';
        Meses5.IsChecked := true;
       end
      else
       begin
        FMeses := '4';
        Meses4.IsChecked := true;
       end;
      BtRefreshTurmas.Enabled := True;
      TControllerFuncoes.New.LimpaTela;
      BtGerarRams.Enabled := (ListaAlunos.Items.Count > 0);
     end;
end;

procedure TFormPrincipal.DefineMeses;
var
   periodo : integer;
begin
   periodo := StrToInt(Fperiodo[6]);
   tcontrollerfuncoes.New.MontarMeses(periodo, strtoint(FMeses));
end;

procedure TFormPrincipal.ExibeSobre;
begin
    CaixaSobre.ShowMaster;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
    formprincipal.BtRefreshAlunos.Enabled := false;
    formprincipal.BtRefreshTurmas.Enabled := False;
    TControllerFuncoes.New.LimpaTela;
    FMeses  := '4';
    FLicoes := '8';
    Meses4.IsChecked  := true;
    Licoes8.IsChecked := True;
    ReportMemoryLeaksOnShutdown := true;
    TControllerPeriodos.New.Listar(ComboPeriodo);
end;

procedure TFormPrincipal.ImgPrincipalClick(Sender: TObject);
begin
     ExibeSobre;
end;

procedure TFormPrincipal.Licoes10Click(Sender: TObject);
begin
     FLicoes := TRadioButton(sender).Text;
end;

procedure TFormPrincipal.Licoes14Click(Sender: TObject);
begin
   FLicoes := TRadioButton(sender).Text;
end;

procedure TFormPrincipal.Licoes8Click(Sender: TObject);
begin
     FLicoes := TRadioButton(sender).Text;
end;


procedure TFormPrincipal.ListaDatasCalendarioItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
var Cal: iControllerCalendario;
begin
    TabCalendarios.Next();
    Cal := tcontrollercalendario.New;
    cal.Busca(Item.Text);
    EdDias.Text := Cal.Dias;
    EdMes1.Text := Cal.Mes1;
    EdMes2.Text := cal.Mes2;
    EdMes3.Text := cal.Mes3;
    EdMes4.Text := Cal.Mes4;
    EdMes5.Text := Cal.Mes5;
    EdMes6.Text := cal.Mes6;
    EdFeriado.Text := Cal.Feriados;
    EdParcial.Text := cal.Parcial;
    EdFinal.Text := Cal.ProvaFinal;
    EdOral.Text := Cal.Oral;
    EdDias.SetFocus;
end;

procedure TFormPrincipal.ListaTurmasItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var Fturmas : icontrollerturmas;
begin
    Fturmas              := TControllerTurmas.New.Buscar(FPeriodo, item.Text);
    FTurma               :=  FTurmas.Turma;
    FCod_cur             :=  Fturmas.Cod_cur;
    FNum_niv             :=  Fturmas.Num_Niv;
    FNum_tur             :=  Fturmas.Num_Tur;
    FMedia               :=  Fturmas.Media;
    FDias                :=  Fturmas.Dias;
    FHorario             :=  Fturmas.Horario;
    FProfessor           :=  Fturmas.Professor;
    Turma.Text           := FTurmas.Turma;
    Horario.Text         := FTurmas.Horario;
    Professor.Text       := FTurmas.Professor;
    Dias.Text            := FTurmas.DiasApresentar;
    media.ItemIndex      := media.Items.IndexOf(FTurmas.Media);
    DefineMeses;
    BtRefreshAlunos.Enabled := true;
    Meses4.Enabled    := true;
    Meses5.Enabled    := true;
    Licoes8.Enabled   := true;
    Licoes10.Enabled  := true;
    Licoes12.Enabled  := true;
    Licoes14.Enabled  := true;
    De.Enabled        := true;
    ate.Enabled       := true;
    media.Enabled     := true;
    TControllerFuncoes.New.DeterminarNumeroLicoes(FTurma);
    TControllerAlunos.New.Listar(fperiodo, fcod_cur, fnum_niv, fnum_tur, ListaAlunos);
    BtGerarRams.Enabled := (ListaAlunos.Items.Count > 0);
end;

procedure TFormPrincipal.MenuCalendarioStartShowing(Sender: TObject);
begin
    tControllerCalendario.New.Listar(ListaDatasCalendario);
end;

procedure TFormPrincipal.MenuPrincipalStartShowing(Sender: TObject);
begin
    tControllerConfiguracao.New
     .Servidor(EdCFGServidor)
     .UID(EdCFGUID)
     .PWD(EdCFGPWD)
     .Pasta(EdCFGPasta)
     .Unidade(EdCFGUnidade)
     .Telefones(EdCFGTelefones)
     .Email(EdCFGEmail)
     .Facebook(EdCFGFacebook)
     .Instagram(EdCFGInstagram)
     .Banco(EdCFGBanco);
end;

procedure TFormPrincipal.Meses4Click(Sender: TObject);
begin
     FMeses := TRadioButton(sender).Text;
     DefineMeses;
end;

procedure TFormPrincipal.Meses5Click(Sender: TObject);
begin
     FMeses := TRadioButton(sender).Text;
     DefineMeses;
end;


end.
