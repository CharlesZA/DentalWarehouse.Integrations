xmlport 53109 "DW.Streetbyte.ProdSubCate.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(ProdCat;"Product Group")
            {
                 XmlName = 'ProductGroup';

                fieldelement(Catcode;ProdCat.Code) { }
                fieldelement(Catname;ProdCat.Description) { }
               
            }
        }       
        
    }

}