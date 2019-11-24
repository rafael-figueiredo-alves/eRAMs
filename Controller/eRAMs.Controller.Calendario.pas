unit eRAMs.Controller.Calendario;

interface

uses
  eRAMs.Controller.interfaces, FMX.ListBox;

Type
  TControllerCalendario = Class(TInterfacedObject, iControllerCalendario)
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
    Public
      Constructor Create;
      Destructor Destroy; Override;
      Class function New: iControllerCalendario;
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
  End;

implementation

uses
  System.Generics.Collections, eRAMs.Model.Calendario, FireDAC.Comp.Client,
  eRAMs.Model.Interfaces;

{ TControllerCalendario }

function TControllerCalendario.Busca(Dias: string): iControllerCalendario;
var Cal : imodelCalendario;
begin
   Result := self;
   cal := tmodelcalendario.New;
   cal.Busca(dias);
   Fdias := Cal.Dias;
   Fmes1 := Cal.Mes1;
   Fmes2 := Cal.Mes2;
   Fmes3 := Cal.Mes3;
   FMes4 := cal.Mes4;
   FMes5 := Cal.Mes5;
   FMes6 := Cal.Mes6;
   FFeriados := Cal.Feriados;
   FParcial := Cal.Parcial;
   FFinal := Cal.ProvaFinal;
   FOral := Cal.Oral;
end;

constructor TControllerCalendario.Create;
begin

end;

destructor TControllerCalendario.Destroy;
begin

  inherited;
end;

function TControllerCalendario.Dias: string;
begin
   Result := Fdias;
end;

function TControllerCalendario.Dias(Value: string): iControllerCalendario;
begin
   Result := self;
   Fdias := Value;
end;

function TControllerCalendario.Feriados(Value: string): iControllerCalendario;
begin
   Result := self;
   FFeriados := Value;
end;

function TControllerCalendario.Feriados: string;
begin
    Result := FFeriados;
end;

function TControllerCalendario.Listar(Value: TListBox): iControllerCalendario;
var  FDados:  TFDMemTable;
    item : TListBoxItem;
    MyList : TListBox;
begin
   Result := self;
   MyList := Value;
   MyList.Items.Clear;
   FDados := TModelCalendario.New.Listar;
   FDados.First;
   while not FDados.Eof do
    begin
      item := TListBoxItem.Create(nil);
      item.Text := FDados.FieldByName('Dias').AsString;
      Item.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
      MyList.AddObject(item);
      FDados.Next;
    end;
   FDados.DisposeOf;
end;

function TControllerCalendario.Mes1: string;
begin
   Result := FMes1;
end;

function TControllerCalendario.Mes1(Value: string): iControllerCalendario;
begin
   Result := self;
   Fmes1 := Value;
end;

function TControllerCalendario.Mes2(Value: string): iControllerCalendario;
begin
   Result := self;
   Fmes2 := Value;
end;

function TControllerCalendario.Mes2: string;
begin
   Result := FMes2;
end;

function TControllerCalendario.Mes3: string;
begin
   Result := FMes3;
end;

function TControllerCalendario.Mes3(Value: string): iControllerCalendario;
begin
   Result := self;
   Fmes3 := Value;
end;

function TControllerCalendario.Mes4: string;
begin
   Result := FMes4;
end;

function TControllerCalendario.Mes4(Value: string): iControllerCalendario;
begin
   Result := self;
   Fmes4 := Value;
end;

function TControllerCalendario.Mes5: string;
begin
   Result := FMes5;
end;

function TControllerCalendario.Mes5(Value: string): iControllerCalendario;
begin
   Result := self;
   Fmes5 := Value;
end;

function TControllerCalendario.Mes6: string;
begin
   Result := FMes6;
end;

function TControllerCalendario.Mes6(Value: string): iControllerCalendario;
begin
   Result := self;
   Fmes6 := Value;
end;

class function TControllerCalendario.New: iControllerCalendario;
begin
    Result := self.Create;
end;

function TControllerCalendario.Oral(Value: string): iControllerCalendario;
begin
   Result := self;
   FOral := Value;
end;

function TControllerCalendario.Oral: string;
begin
   Result := FOral;
end;

function TControllerCalendario.Parcial: string;
begin
   Result := FParcial;
end;

function TControllerCalendario.Parcial(Value: string): iControllerCalendario;
begin
   Result := self;
   FParcial := Value;
end;

function TControllerCalendario.ProvaFinal: string;
begin
   Result := FFinal;
end;

function TControllerCalendario.ProvaFinal(Value: string): iControllerCalendario;
begin
   Result := self;
   FFinal := Value;
end;

function TControllerCalendario.Salvar: Boolean;
var Dados : iModelCalendario;
begin
  Dados := tmodelcalendario.New;
  Result := Dados
            .Dias(Fdias)
            .Mes1(Fmes1)
            .Mes2(FMes2)
            .Mes3(FMes3)
            .Mes4(fmes4)
            .Mes5(fmes5)
            .Mes6(fmes6)
            .Feriados(FFeriados)
            .Parcial(FParcial)
            .ProvaFinal(FFinal)
            .Oral(FOral)
            .Salvar;
end;

end.
