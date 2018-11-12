/// This xmlport is used to send statement information to bidvest

xmlport 53103 "DW.BIDVEST.StatementXML"
{
    schema
    {
        textelement(Root)
        {
            tableelement(NodeName2; "Customer")
            {
            }
        }
    }

}