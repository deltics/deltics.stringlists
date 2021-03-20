
{$i deltics.stringlists.inc}

  unit Deltics.StringLists.Base;


interface

  type
    IStringListBase = interface
    ['{8E7F562C-6E19-48A8-A8A7-561CAB57CA40}']
      function get_Capacity: Integer;
      function get_Count: Integer;
      function get_Sorted: Boolean;
      function get_Unique: Boolean;
      procedure set_Capacity(const aValue: Integer);
      procedure set_Sorted(const aValue: Boolean);
      procedure set_Unique(const aValue: Boolean);

      procedure Clear;
      procedure Delete(const aIndex: Integer); overload;
      procedure LoadFromFile(const aFilename: String);
      procedure SaveToFile(const aFilename: String);

      property Capacity: Integer read get_Capacity write set_Capacity;
      property Count: Integer read get_Count;
      property Sorted: Boolean read get_Sorted write set_Sorted;
      property Unique: Boolean read get_Unique write set_Unique;
    end;




implementation

end.
