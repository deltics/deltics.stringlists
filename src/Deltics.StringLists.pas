{
  * X11 (MIT) LICENSE *

  Copyright © 2013 Jolyon Smith

  Permission is hereby granted, free of charge, to any person obtaining a copy of
   this software and associated documentation files (the "Software"), to deal in
   the Software without restriction, including without limitation the rights to
   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
   of the Software, and to permit persons to whom the Software is furnished to do
   so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.


  * GPL and Other Licenses *

  The FSF deem this license to be compatible with version 3 of the GPL.
   Compatability with other licenses should be verified by reference to those
   other license terms.


  * Contact Details *

  Original author : Jolyon Smith
  skype           : deltics
  e-mail          : <EXTLINK mailto: jsmith@deltics.co.nz>jsmith@deltics.co.nz</EXTLINK>
  website         : <EXTLINK http://www.deltics.co.nz>www.deltics.co.nz</EXTLINK>
}

{$i deltics.stringlists.inc}

  unit Deltics.StringLists;


interface

  uses
    Deltics.StringLists.Ansi,
    Deltics.StringLists.String_,
    Deltics.StringLists.Utf8,
    Deltics.StringLists.Wide,
    Deltics.StringTypes;


  {$i deltics.stringtypes.aliases.inc}


  type
    IStringList         = Deltics.StringLists.String_.IStringList;
    IUtf8StringList     = Deltics.StringLists.Utf8.IUtf8StringList;
    IWideStringList     = Deltics.StringLists.Wide.IWideStringList;

    TStrings            = Deltics.StringLists.String_.TStrings;
    TStringList         = Deltics.StringLists.String_.TStringList;
    TUtf8Strings        = Deltics.StringLists.Utf8.TUtf8Strings;
    TUtf8StringList     = Deltics.StringLists.Utf8.TUtf8StringList;
    TWideStrings        = Deltics.StringLists.Wide.TWideStrings;
    TWideStringList     = Deltics.StringLists.Wide.TWideStringList;

  {$ifdef UNICODE}
    IAnsiStringList     = Deltics.StringLists.Ansi.IAnsiStringList;
    IUnicodeStringList  = Deltics.StringLists.String_.IStringList;

    TAnsiStringList     = Deltics.StringLists.Ansi.TAnsiStringList;
    TAnsiStrings        = Deltics.StringLists.Ansi.TAnsiStrings;
    TUnicodeStringList  = Deltics.StringLists.String_.TStringList;
    TUnicodeStrings     = Deltics.StringLists.String_.TStrings;
  {$else}
    IAnsiStringList     = Deltics.StringLists.String_.IStringList;
    IUnicodeStringList  = Deltics.StringLists.Wide.IWideStringList;

    TAnsiStringList     = Deltics.StringLists.String_.TStringList;
    TAnsiStrings        = Deltics.StringLists.String_.TStrings;
    TUnicodeStringList  = Deltics.StringLists.Wide.TWideStringList;
    TUnicodeStrings     = Deltics.StringLists.Wide.TWideStrings;
  {$endif}




  {$ifdef TYPE_HELPERS}
  type
    TStringListHelper = class helper for TStringList
    public
      procedure Add(const aArray: StringArray); overload;
      function AsArray: StringArray;
    end;
  {$endif TYPE_HELPERS}



implementation



{$ifdef TypeHelpers}
  procedure TStringListHelper.Add(const aArray: StringArray);
  var
    i: Integer;
  begin
    for i := 0 to High(aArray) do
      Add(aArray[i]);
  end;



  function TStringListHelper.AsArray: StringArray;
  var
    i: Integer;
  begin
    SetLength(result, Count);

    for i := 0 to Pred(Count) do
      result[i] := self[i];
  end;
{$endif}


end.
