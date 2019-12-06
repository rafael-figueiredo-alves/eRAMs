unit eRAMs.Model.Configuracao;

interface

uses
  eRAMs.Model.Interfaces;

Type
  TModelConfiguracao = Class(TInterfacedObject, iModelConfiguracao)
    Private
     Fservidor  : string;
     FPastaRAMs : string;
     FUID       : String;
     FPWD       : string;
     FUnidade   : String;
     FTelefones : String;
     FEmail     : String;
     FFacebook  : String;
     FInstagram : String;
     FBanco     : String;
     FTestes    : Boolean;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelConfiguracao;
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
     Function Testes : Boolean; Overload;
     Function Testes (Value: Boolean) : iModelConfiguracao; overload;
  End;

implementation

{ TModelConfiguracao }

Uses inifiles, System.SysUtils;

function TModelConfiguracao.Banco(Value: string): iModelConfiguracao;
begin
    Result := self;
    FBanco := Value;
end;

function TModelConfiguracao.Banco: string;
begin
   Result := FBanco;
end;

constructor TModelConfiguracao.Create;
var cfg: tinifile;
    arq: string;
    PastaRAMs, PastaBanco : string;
begin
   PastaRAMs := ExtractFilePath(ParamStr(0)) + 'RAMs\';
   PastaBanco := ExtractFilePath(ParamStr(0)) + 'BD\';
   arq := Extractfilepath(ParamStr(0))+'eRAMs.config.ini';
   cfg := TIniFile.Create(arq);
   try
     fservidor  := cfg.ReadString('SOP', 'Servidor', '');
     FUID       := cfg.ReadString('SOP', 'UID', '');
     FPWD       := cfg.ReadString('SOP', 'PWD', '');
     FPastaRAMs := cfg.ReadString('Base', 'Pasta', PastaRAMs);
     FUnidade   := cfg.ReadString('Dados', 'Unidade', 'Escola Teste');
     FTelefones := cfg.ReadString('Dados', 'Telefones', '(11) 5555-5555 / (11) 66666-6666');
     FEmail     := cfg.ReadString('Dados', 'Email', 'erams@gmail.com');
     FFacebook  := cfg.ReadString('Dados', 'Facebook', 'facebook.com/erams');
     FInstagram := cfg.ReadString('Dados', 'Instagram', '@erams');
     FBanco     := cfg.ReadString('Conexao', 'Banco', PastaBanco);
     FTestes    := cfg.ReadBool('Desenvolvimento', 'Testes', true);
   finally
     cfg.DisposeOf;
   end;
end;

destructor TModelConfiguracao.Destroy;
begin

  inherited;
end;

function TModelConfiguracao.Email: String;
begin
   Result := FEmail;
end;

function TModelConfiguracao.Email(Email: String): iModelConfiguracao;
begin
  Result := Self;
  FEmail := Email;
end;

function TModelConfiguracao.Facebook(Facebook: String): iModelConfiguracao;
begin
  Result := Self;
  FFacebook := Facebook;
end;

function TModelConfiguracao.Facebook: String;
begin
  Result := FFacebook;
end;

function TModelConfiguracao.GravaConfiguracoes: iModelConfiguracao;
var cfg: tinifile;
    arq: string;
begin
   Result := Self;
   arq := Extractfilepath(ParamStr(0))+'eRAMs.config.ini';
   cfg := TIniFile.Create(arq);
   try
     cfg.WriteString('SOP', 'Servidor', fservidor);
     cfg.WriteString('SOP', 'UID', FUID);
     cfg.WriteString('SOP', 'PWD', FPWD);
     cfg.WriteString('Base', 'Pasta', FPastaRAMs);
     cfg.WriteString('Dados', 'Unidade', FUnidade);
     cfg.WriteString('Dados', 'Telefones', FTelefones);
     cfg.WriteString('Dados', 'Email', FEmail);
     cfg.WriteString('Dados', 'Facebook', FFacebook);
     cfg.WriteString('Dados', 'Instagram', FInstagram);
     cfg.WriteString('Conexao', 'Banco', FBanco);
     cfg.WriteBool('Desenvolvimento', 'Testes', FTestes);
   finally
     cfg.DisposeOf;
   end;
end;

function TModelConfiguracao.Instagram(Instagram: String): iModelConfiguracao;
begin
  Result := Self;
  FInstagram := Instagram;
end;

function TModelConfiguracao.Instagram: String;
begin
  Result := FInstagram;
end;

class function TModelConfiguracao.New: iModelConfiguracao;
begin
    Result := Self.Create;
end;

function TModelConfiguracao.PastaRams(Pasta: String): iModelConfiguracao;
begin
    Result := Self;
    FPastaRAMs := Pasta;
end;

function TModelConfiguracao.PastaRams: String;
begin
   Result := FPastaRAMs;
end;

function TModelConfiguracao.PWD(PWD: String): iModelConfiguracao;
begin
  Result := Self;
  FPWD := PWD;
end;

function TModelConfiguracao.PWD: String;
begin
   Result := FPWD;
end;

function TModelConfiguracao.Servidor(Servidor: String): iModelConfiguracao;
begin
   Result := Self;
   Fservidor := Servidor;
end;

function TModelConfiguracao.Servidor: String;
begin
   Result := Fservidor;
end;

function TModelConfiguracao.Telefones: String;
begin
   Result := FTelefones;
end;

function TModelConfiguracao.Telefones(Telefones: String): iModelConfiguracao;
begin
  Result := Self;
  FTelefones := Telefones;
end;

function TModelConfiguracao.Testes(Value: Boolean): iModelConfiguracao;
begin
    Result := Self;
    FTestes := Value;
end;

function TModelConfiguracao.Testes: Boolean;
begin
   Result := FTestes;
end;

function TModelConfiguracao.UID: String;
begin
   Result := FUID;
end;

function TModelConfiguracao.UID(UID: String): iModelConfiguracao;
begin
   Result := Self;
   FUID := UID;
end;

function TModelConfiguracao.Unidade: String;
begin
   Result := FUnidade;
end;

function TModelConfiguracao.Unidade(Unidade: String): iModelConfiguracao;
begin
   Result := Self;
   FUnidade := Unidade;
end;

end.
