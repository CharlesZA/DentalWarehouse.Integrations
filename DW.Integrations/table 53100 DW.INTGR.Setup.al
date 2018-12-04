table 53100 "DW.INTGR.Setup"
{
    DataPerCompany = true;
    //DataClassification=CustomerContent;
    Description = 'Contains Setup Information for Integration';

    fields
    {
        field(1; PrimaryKey; Code[10]) { }

        /// Bidvest fields
        field(10; BIDVEST_IP; Text[50]) { }
        field(11; BIDVEST_PORT; Text[50]) { }
        field(12; BIDVEST_USER; Text[50]) { }
        field(13; BIDVEST_PASSWORD; Text[50]) { }
        field(14; BIDVEST_ENABLED; Boolean) { }
        field(15; BIDVEST_TEMPXMLPATH; TEXT[50]) { }
        field(16; BIDVEST_SSHFINGER; TEXT[150]) { }

        /// Order Logistics
        field(20; ORDLOG_DEVURL; Text[50]) { }
        field(21; ORDLOG_LIVEURL; Text[50]) { }
        field(22; ORDLOG_ENABLED; Boolean) { }
        FIELD(23; ORDLOG_RESURL; Text[50]) { }
        FIELD(24; ORDLOG_USERNAME; Text[50]) { }
        FIELD(25; ORDLOG_PASSWORD; Text[50]) { }
        FIELD(26; ORDLOG_COMPANY; Text[50]) { }
        FIELD(27; ORDLOG_APPID; Text[50]) { }
        field(28; ORDLOG_SITENO; Text[50]) { }
        FIELD(29; ORDLOG_SITEPASSWORD; Text[50]) { }
        FIELD(30; ORDLOG_SITETOKENURL; Text[50]) { }

        field(200; Locked; Boolean)
        {
            Caption = 'Locked';
        }
        // << VOX1.14 PS 
        // StreetByte fields
        field(50000; StreetByte_Address; Text[150]) { }
        field(50001; StreetByte_Port; Text[50]) { }
        field(50002; StreetByte_User; Text[50]) { }
        field(50003; StreetByte_Password; Text[50]) { }
        field(50004; StreetByte_Enabled; Boolean) { }
        field(50005; StreetByte_FilePath; TEXT[50]) { }
        field(50006; StreetByte_SSHFINGER; TEXT[150]) { }
        // >> VOX1.14 PS 



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
        BIDVEST_TEMPXMLPATH := 'C:\Temp';
        BIDVEST_SSHFINGER := 'ssh-dss 1024 Pqt2eKxXQy2PGJYyBeLAAeD4kq/dIIbTowj3bFPyqBo=';

        /// Order Logistics
        ORDLOG_DEVURL := 'https://test.orderlogistics.co.za/rest/v1/';
        ORDLOG_LIVEURL := 'https://www.orderlogistics.co.za/rest/v1/';
        ORDLOG_RESURL := 'https://www.orderlogistics.co.za/rest/v1/auth';
        ORDLOG_ENABLED := false;
        ORDLOG_APPID := 'MS DYNAMICS NAV 2018';
        ORDLOG_COMPANY := 'The Dental Warehouse';
        ORDLOG_USERNAME := 'DENTWHINTEG@TESTOW.CO.ZA';
        ORDLOG_PASSWORD := ']WBZwu02zzjWJ3h';
        ORDLOG_SITENO := 'DENTWH';
        ORDLOG_SITEPASSWORD := '2429226242';
        ORDLOG_SITETOKENURL := 'https://www.orderlogistics.co.za/rest/v1/siteauth';

        // Modify(false);
        // << VOX1.14 PS 
        // StreetByte fields
        StreetByte_Address   := 'https://dw.kusasa.biz/';
        StreetByte_Port      := '443';
        StreetByte_User      := 'Preshan';
        StreetByte_Password  := 'This is a strong password';
        StreetByte_Enabled   :=  False;
        StreetByte_FilePath  := 'C:\Temp2';
        StreetByte_SSHFINGER := '69:48:fc:a8:0b:54:0e:21:df:20:2c:e5:d0:d1:1d:9f:18:67:1f:9f';
        // >> VOX1.14 PS 
    end;


}