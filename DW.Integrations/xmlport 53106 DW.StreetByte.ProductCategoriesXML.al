xmlport 53106 "DW.Streetbyte.ProductCat.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(ProdCat;"Item Category")
            {
                 XmlName = 'ItemCategory';

                fieldelement(Catcode;ProdCat.Code) { }
                fieldelement(Catname;ProdCat.Description) { }
               
            }
        }       
        
    }

}