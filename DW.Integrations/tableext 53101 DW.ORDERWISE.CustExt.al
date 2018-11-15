/// This is just a table extension to flagging customers for price export

tableextension 53101 "DW.ORDERWISE.CustExt" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(53100; SUBMITORDERWISEPRICES; Boolean)
        {
            Caption = 'Submit Pricing to ORDERWISE';

        }
    }
}