xmlport 53107 "DW.Streetbyte.Suppliers.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(Supplier;"Vendor")
            {
                 XmlName = 'Suppliers';

                fieldelement(SuppCode;Supplier."No.") { }
                fieldelement(SuppName;Supplier.Name) { }
               
            }
        }       
        
    }

}