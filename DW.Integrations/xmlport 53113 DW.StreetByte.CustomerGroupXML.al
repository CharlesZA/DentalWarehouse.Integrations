xmlport 53113 "DW.Streetbyte.CustGroup.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(DimVal;"Dimension Value")
            {
                 XmlName = 'DimVals';
                 SourceTableView= SORTING("Dimension Code",Code) ORDER(Ascending) WHERE("Dimension Value Type"=FILTER(Standard),
                                  "Global Dimension No."=filter(5));

                fieldelement(DimCode;DimVal.Code) { }
                fieldelement(DimName;DimVal.Name) { }
               
            }
        }       
        
    }

}