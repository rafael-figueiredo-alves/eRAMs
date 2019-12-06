unit eRAMs.Controller.configuracao;

interface

uses
  eRAMs.Controller.interfaces, eRAMs.Model.Interfaces;

Type
  TControllerConfiguracao = Class(TInterfacedObject, iControllerConfiguracao)
    Private
     FConfiguracao : imodelconfiguracao;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerConfiguracao;
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
     Function Testes(Value: Boolean): iControllerConfiguracao; Overload;
     Function Testes(Value: tobject): iControllerConfiguracao; Overload;
     Function Gravar : iControllerConfiguracao;
  End;

implementation

uses
  eRAMs.Model.Configuracao, FMX.Edit, FMX.StdCtrls;

{ TControllerConfiguracao }

function TControllerConfiguracao.Banco(Value: String): iControllerConfiguracao;
begin
    Result := Self;
    FConfiguracao.Banco(value);
end;

function TControllerConfiguracao.Banco(Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Banco;
end;

constructor TControllerConfiguracao.Create;
begin
   Fconfiguracao := tmodelconfiguracao.New;
end;

destructor TControllerConfiguracao.Destroy;
begin

  inherited;
end;

function TControllerConfiguracao.Email(Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Email(value);
end;

function TControllerConfiguracao.Email(Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Email;
end;

function TControllerConfiguracao.Facebook(
  Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Facebook(value);
end;

function TControllerConfiguracao.Facebook(
  Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Facebook;
end;

function TControllerConfiguracao.Gravar: iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.GravaConfiguracoes;
end;

function TControllerConfiguracao.Instagram(
  Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Instagram;
end;

function TControllerConfiguracao.Instagram(
  Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Instagram(value);
end;

class function TControllerConfiguracao.New: iControllerConfiguracao;
begin
   Result := Self.Create;
end;

function TControllerConfiguracao.Pasta(Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.PastaRams;
end;

function TControllerConfiguracao.Pasta(Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.PastaRams(Value);
end;

function TControllerConfiguracao.PWD(Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.PWD;
end;

function TControllerConfiguracao.PWD(Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.PWD(Value);
end;

function TControllerConfiguracao.Servidor(
  Value: TObject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Servidor;
end;

function TControllerConfiguracao.Servidor(
  Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Servidor(value);
end;

function TControllerConfiguracao.Telefones(
  Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Telefones(Value);
end;

function TControllerConfiguracao.Telefones(
  Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Telefones;
end;

function TControllerConfiguracao.Testes(
  Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tswitch(value).IsChecked := FConfiguracao.Testes;
end;

function TControllerConfiguracao.Testes(
  Value: Boolean): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Testes(Value);
end;

function TControllerConfiguracao.UID(Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.UID(Value);
end;

function TControllerConfiguracao.UID(Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.UID;
end;

function TControllerConfiguracao.Unidade(
  Value: String): iControllerConfiguracao;
begin
   Result := self;
   FConfiguracao.Unidade(value);
end;

function TControllerConfiguracao.Unidade(
  Value: tobject): iControllerConfiguracao;
begin
   Result := self;
   tedit(value).Text := FConfiguracao.Unidade;
end;

end.
