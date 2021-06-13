unit ServiceDescriptor;

interface

type
  TServiceDescriptor = class
  private
    FServiceType: TGUID;
    FImplementationType: TClass;
  public
    constructor Create(ServiceType: TGUID; ImplementationType: TClass);
    property ServiceType: TGUID read FServiceType;
    property ImplementationType: TClass read FImplementationType;
  end;

implementation

{ TServiceDescriptor }

constructor TServiceDescriptor.Create(ServiceType: TGUID; ImplementationType:
  TClass);
begin
  FServiceType := ServiceType;
  FImplementationType := ImplementationType;
end;

end.
