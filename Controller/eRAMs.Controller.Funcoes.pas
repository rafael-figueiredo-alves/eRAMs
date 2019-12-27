unit eRAMs.Controller.Funcoes;

interface

uses
  eRAMs.Controller.interfaces;

Type
  TControllerFuncoes = Class(TInterfacedObject, iControllerFuncoes)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerFuncoes;
     Function MontarMeses (Periodo, Meses: integer): iControllerFuncoes;
     Function LimpaTela : iControllerFuncoes;
     Function DeterminarNumeroLicoes (Turma : string) : iControllerFuncoes;
     Function NumLicoes (Turma : string) : string;
  End;

implementation

{ TControllerFuncoes }

Uses eRAMs.View.principal, FMX.ListBox, System.SysUtils;

constructor TControllerFuncoes.Create;
begin

end;

destructor TControllerFuncoes.Destroy;
begin

  inherited;
end;

function TControllerFuncoes.DeterminarNumeroLicoes(
  Turma: string): iControllerFuncoes;
begin
    if Pos('ENGLISH 1-2', uppercase(Turma)) > 0 then
      FormPrincipal.Licoes14.IsChecked := true
    else
    if Pos('ENGLISH', uppercase(Turma)) > 0 then
     FormPrincipal.Licoes10.IsChecked := true
    else
    if Pos('TEEN 5', uppercase(Turma)) > 0 then
     FormPrincipal.Licoes12.IsChecked := true
    else
    if Pos('TEEN 6', uppercase(Turma)) > 0 then
     FormPrincipal.Licoes12.IsChecked := true
    else
    if Pos('TEEN/ADULT', uppercase(Turma)) > 0 then
     FormPrincipal.Licoes8.IsChecked := true
    else
     FormPrincipal.Licoes10.IsChecked := true;
end;

function TControllerFuncoes.LimpaTela: iControllerFuncoes;
begin
    formprincipal.Turma.Text        := '';
    formprincipal.Dias.Text         := '';
    formprincipal.Horario.Text      := '';
    formprincipal.Professor.Text    := '';
    formprincipal.de.ItemIndex      := -1;
    formprincipal.ate.ItemIndex     := -1;
    formprincipal.media.ItemIndex   := -1;
    formprincipal.Meses4.Enabled    := False;
    formprincipal.Meses5.Enabled    := False;
    formprincipal.Licoes8.Enabled   := False;
    formprincipal.Licoes10.Enabled  := False;
    formprincipal.Licoes12.Enabled  := False;
    formprincipal.Licoes14.Enabled  := False;
    formprincipal.De.Enabled        := False;
    formprincipal.ate.Enabled       := False;
    formprincipal.media.Enabled     := false;
    FormPrincipal.ListaAlunos.Items.Clear;
end;

function TControllerFuncoes.MontarMeses(Periodo,
  Meses: integer): iControllerFuncoes;
begin
    if periodo = 2 then
     begin
       case meses of
       4: begin
           formprincipal.de.ItemIndex  := formprincipal.De.Items.IndexOf('Março');
           formprincipal.ate.ItemIndex := formprincipal.ate.Items.IndexOf('Junho');
          end;
       5: begin
           formprincipal.de.ItemIndex  := formprincipal.De.Items.IndexOf('Fevereiro');
           formprincipal.ate.ItemIndex := formprincipal.ate.Items.IndexOf('Junho');
          end;
       end;
       exit
     end;
    case meses of
    4: begin
        formprincipal.de.ItemIndex  := formprincipal.De.Items.IndexOf('Agosto');
        formprincipal.ate.ItemIndex := formprincipal.ate.Items.IndexOf('Novembro');
       end;
    5: begin
        formprincipal.de.ItemIndex  := formprincipal.De.Items.IndexOf('Julho');
        formprincipal.ate.ItemIndex := formprincipal.ate.Items.IndexOf('Novembro');
       end;
    end;
end;

class function TControllerFuncoes.New: iControllerFuncoes;
begin
   Result := Self.Create;
end;

function TControllerFuncoes.NumLicoes(Turma: string): string;
begin
    if Pos('ENGLISH 1-2', uppercase(Turma)) > 0 then
      Result := '14'
    else
    if Pos('ENGLISH', uppercase(Turma)) > 0 then
      Result := '10'
    else
    if Pos('TEEN 5', uppercase(Turma)) > 0 then
     Result := '12'
    else
    if Pos('TEEN 6', uppercase(Turma)) > 0 then
     Result := '12'
    else
    if Pos('TEEN/ADULT', uppercase(Turma)) > 0 then
     Result := '8'
    else
     Result := '10';
end;

end.
