unit ServiceContainer;

interface

uses
  Contnrs, ServiceDescriptor;

type
  TServiceContainer = class
  private
    FCollection: TObjectList;
  protected
    function FindService(AInterface: TGUID): TServiceDescriptor;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Register(ServiceType: TGUID; ImplementationType: TClass);
    function GetInstance(ServiceType: TGUID): TObject;
  end;

implementation

uses
  SysUtils;

{ TServiceContainer }

constructor TServiceContainer.Create;
begin
  FCollection := TObjectList.Create;
end;

destructor TServiceContainer.Destroy;
begin
  FreeAndNil(FCollection);
  inherited;
end;

function TServiceContainer.FindService(AInterface: TGUID): TServiceDescriptor;
var
  I: Integer;
  Item: TServiceDescriptor;
begin
   result := nil;
   for I := 0 to FCollection.Count - 1 do begin
      Item := FCollection[I] as TServiceDescriptor;
      if GUIDToString(Item.ServiceType) = GUIDToString(AInterface) then begin
         result := Item;
         exit;
      end;
   end;
end;

function TServiceContainer.GetInstance(ServiceType: TGUID): TObject;
var
  Descriptor: TServiceDescriptor;
  Intf: IInterface;
begin
   Descriptor := FindService(ServiceType);
   if Descriptor <> nil then begin
      if Descriptor.ImplementationType.GetInterfaceEntry(ServiceType) <> nil then begin
         result := Descriptor.ImplementationType.Create
;
      end;
   end;
end;

procedure TServiceContainer.Register(ServiceType: TGUID; ImplementationType:
  TClass);
var
  Descriotor: TServiceDescriptor;
begin
  Descriotor := TServiceDescriptor.Create(ServiceType, ImplementationType);
  FCollection.Add(Descriotor);
end;

end.
