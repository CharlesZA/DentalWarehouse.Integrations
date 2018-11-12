table 53100 "DW.INTGR.Setup"
{
    DataPerCompany = true;
    //DataClassification=CustomerContent;
    Description = 'Contains Setup Information for Integration';

    fields
    {
        field(1; PrimaryKey; Code[10]) { }

        field(10; BIDVEST_IP; Text[50]) { }
        field(11; BIDVEST_PORT; Text[50]) { }
        field(12; BIDVEST_USER; Text[50]) { }
        field(13; BIDVEST_PASSWORD; Text[50]) { }
        field(14; BIDVEST_ENABLED; Boolean) { }


        field(200; Locked; Boolean)
        {
            Caption = 'Locked';
        }
    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        TestField(Locked, false);
    end;

    procedure SetupDefaults();
    begin
        /// This procedure is used to default the fields.
        /// Values used here were determined during implementation

        /// Bidvest
        BIDVEST_IP := '41.170.90.242';
        BIDVEST_PORT := '22';
        BIDVEST_USER := 'DentalWH';
        BIDVEST_PASSWORD := 'VkZ38vpr9CUG';
        BIDVEST_ENABLED := false;


        Modify(false);
    end;


}