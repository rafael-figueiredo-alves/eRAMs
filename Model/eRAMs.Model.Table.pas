unit eRAMs.Model.Table;

interface

Uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.DApt,
  eRAMs.Model.Interfaces;

Type
  TModelTable = Class(TInterfacedObject, iModelTable)
    Private
     FMemTable : TFDMemTable;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelTable;
     Function Lista : tobject;
  End;

implementation

{ TModelTable }

constructor TModelTable.Create;
begin
    FMemTable := TFDMemTable.Create(nil);
end;

destructor TModelTable.Destroy;
begin
  FMemTable.DisposeOf;
  inherited;
end;

function TModelTable.Lista: TObject;
begin
   Result := FMemTable;
end;

class function TModelTable.New: iModelTable;
begin
    Result := Self.Create;
end;

end.
