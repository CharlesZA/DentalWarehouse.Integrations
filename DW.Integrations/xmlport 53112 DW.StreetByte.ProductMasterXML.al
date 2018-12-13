xmlport 53112 "DW.Streetbyte.ProdMaster.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(Items;Item)
            {
                 XmlName = 'Items';
                

                fieldelement(ProdCode;Items."No.") { }
                fieldelement(ProdName;Items.Description) { }
                fieldelement(ProdCat;Items."Item Category Code") { }
                fieldelement(ProdGroup;Items."Product Group Code") { }
                fieldelement(ProdCat;Items."Item Category Code") { }
                fieldelement(Supplier;Items."Vendor No.") { }
            }
        }       
        
    }

}