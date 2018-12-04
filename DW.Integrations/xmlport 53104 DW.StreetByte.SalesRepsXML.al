
xmlport 53104 "DW.BIDVEST.SalesRepsXML"
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