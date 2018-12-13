xmlport 53110 "DW.Streetbyte.Users.XML"
// << VOX1.14 PS >>
{
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';

    schema
    {
        textelement(Root)
        
        {
            tableelement(Users;User)
            {
                 XmlName = 'Users';

                fieldelement(Userid;Users."User Name") { }
                fieldelement(UserName;users."Full Name") { }
               
            }
        }       
        
    }

}