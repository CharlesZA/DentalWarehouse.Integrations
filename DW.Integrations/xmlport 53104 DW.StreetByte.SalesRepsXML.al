
xmlport 53104 "DW.StreetByte.SalesRepsXML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(SPERSOn; "Salesperson/Purchaser")
            {
                 XmlName = 'Salesperson';

                fieldelement(REPCODE;SPERSOn.Code) { }
                fieldelement(REPNAME; SPERSOn.Name) { }
            }
        }
    }

}