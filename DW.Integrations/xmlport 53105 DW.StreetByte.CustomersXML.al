Xmlport 53105 "DW.Streetbyte.Customers.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(CustomerRec; "Customer")
            {
                 XmlName = 'Customer';

                fieldelement(CustCode;CustomerRec."No.") { }
                fieldelement(CustName;CustomerRec.Name) { }
                fieldelement(SalesRep;CustomerRec."Salesperson Code"){ }
                fieldelement(CustClass;CustomerRec."Customer Posting Group"){ }
                fieldelement(CustPriceGroup;CustomerRec."Customer Price Group"){ }
                fieldelement(CustGroup;CustomerRec."Customer Posting Group"){ }
                fieldelement(CreditLimit;CustomerRec."Credit Limit (LCY)"){ }
                fieldelement(PostAdd1;CustomerRec.Address){ }
                fieldelement(PostAdd2;CustomerRec."Address 2"){ }
                fieldelement(PostAdd3;CustomerRec.City){ }
                fieldelement(PostAdd4;CustomerRec."Post Code"){ }
                fieldelement(Tel;CustomerRec."Phone No."){ }
                fieldelement(fax;CustomerRec."Fax No."){ }
            }
        }       
        
    }

}