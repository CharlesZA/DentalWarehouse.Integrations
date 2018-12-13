xmlport 53111 "DW.Streetbyte.Locations.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(Locations;Location)
            {
                 XmlName = 'Locations';
                 SourceTableView= SORTING(Code) ORDER(Ascending) WHERE("Use As In-Transit"=filter(False));

                fieldelement(Code;Locations.Code) { }
                fieldelement(Name;Locations.Name) { }
               
            }
        }       
        
    }

}