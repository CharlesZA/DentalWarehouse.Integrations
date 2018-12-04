page 53100 "DW.INTGR.SetupCard"
{

    PageType = Card;
    SourceTable = "DW.INTGR.Setup";
    Caption = 'DW.INTGR.SetupCard';
    UsageCategory = Administration;
   
    layout
    {
        area(content)
        {
            group(General)
            {
                // field("PrimaryKey"; "PrimaryKey")
                // {
                //     ApplicationArea = All;
                // }
            }
            group(BIDVEST)
            {
                field(BIDVEST_IP; BIDVEST_IP) { }
                field(BIDVEST_PORT; BIDVEST_PORT) { }
                field(BIDVEST_USER; BIDVEST_USER) { }
                field(BIDVEST_PASSWORD; BIDVEST_PASSWORD) { }
                field(BIDVEST_ENABLED; BIDVEST_ENABLED) { }
                field(BIDVEST_TEMPXMLPATH; BIDVEST_TEMPXMLPATH) { }
                FIELD(BIDVEST_SSHFINGER; BIDVEST_SSHFINGER) { }
            }
            group(ORDERLOGISTICS)
            {
                field(ORDLOG_APPID; ORDLOG_APPID) { }
                field(ORDLOG_COMPANY; ORDLOG_COMPANY) { }
                field(ORDLOG_DEVURL; ORDLOG_DEVURL) { }
                field(ORDLOG_ENABLED; ORDLOG_ENABLED) { }
                field(ORDLOG_LIVEURL; ORDLOG_LIVEURL) { }
                field(ORDLOG_PASSWORD; ORDLOG_PASSWORD) { }
                field(ORDLOG_RESURL; ORDLOG_RESURL) { }
                field(ORDLOG_SITENO; ORDLOG_SITENO) { }
                field(ORDLOG_SITEPASSWORD; ORDLOG_SITEPASSWORD) { }
                field(ORDLOG_SITETOKENURL; ORDLOG_SITETOKENURL) { }
                field(ORDLOG_USERNAME; ORDLOG_USERNAME) { }
            }
            // << VOX1.14 PS 
            // Streetbyte Website Integration fields
            group(STREETBYTE)
            {
                field(StreetByte_Address; StreetByte_Address) { }
                field(StreetByte_Port; StreetByte_Port) { }
                field(StreetByte_User; StreetByte_User) { }
                field(StreetByte_Password; StreetByte_Password) { }
                field(StreetByte_Enabled; StreetByte_Enabled) { }
                field(StreetByte_FilePath; StreetByte_FilePath) { }
                FIELD(StreetByte_SSHFINGER; StreetByte_SSHFINGER) { }
            }
            // >> VOX1.14 PS 

        }
    }
    actions
    {
        area(Processing)
        {
            action(LockRecord)
            {
                Caption = 'Lock Record';
                Image = Lock;
                trigger OnAction()
                begin
                    Rec.Locked := true;
                    Modify(false);
                end;
            }
            action(UnLockRecord)
            {
                Caption = 'Unlock Record';
                Image = ReOpen;
                trigger OnAction()
                begin
                    Rec.Locked := false;
                    Modify(false);
                end;
            }
            action(ExportInvoices)
            {
                Caption = 'Export Invoices for Bidvest';
                trigger OnAction()
                var
                    bidvest: Codeunit "DW.BIDVEST.IntegrationMgt";
                begin
                    bidvest.SendInvoiceXML('103015');
                end;
            }
            action(ExportCreditNotes)
            {
                Caption = 'Export Credit Memos for Bidvest';
                trigger OnAction()
                var
                    bidvest: Codeunit "DW.BIDVEST.IntegrationMgt";
                begin
                    bidvest.SendCreditMemoXML('104002');
                    ;
                End;
            }
            action(ExportStatementXML)
            {
                Caption = 'Export Statement XML';
                trigger OnAction()
                var
                    bidvest: Codeunit "DW.BIDVEST.IntegrationMgt";
                begin
                    bidvest.SendStatementXML('');
                end;
            }
            action(ORDLOG_TESTUSERAUTH)
            {
                Caption = 'Order Logistics - Test User Token';
                trigger OnAction()
                var
                    orderlogistics: Codeunit "DW.ORDERWISE.IntegrationMgt";
                begin
                    orderlogistics.TEST_UserAuth();
                end;
            }
            action(ORDLOG_TESTSITEAUTH)
            {
                Caption = 'Order Logistics - Test Site Token';
                trigger OnAction()
                var
                    orderlogistics: Codeunit "DW.ORDERWISE.IntegrationMgt";
                begin
                    orderlogistics.TEST_SiteAuth();
                end;
            }
            // << VOX1.14 PS 
            // StreetByte Integration Fields 
            action(StreetByte_SendSalesReps)
            {
                Caption = 'Send Sales Reps to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                    StreetByte.SendSalesReps;
                end;
            }
            action(StreetByte_SendCustomers)
            {
                Caption = 'Send Customers to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendCustomers;
                end;
            }
            
            action(StreetByte_SendItemCats)
            {
                Caption = 'Send Product Groups to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendProdCat;
                end;
            }

            action(StreetByte_SendSuppliers)
            {
                Caption = 'Send Suppliers to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendSupplier;
                end;
            }

             action(StreetByte_SendGeoAreas)
            {
                Caption = 'Send Geographic Areas to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendGeoAreas;
                end;
            }
            // >> VOX1.14 PS 

        }
    }
    trigger OnOpenPage();
    var

    begin
        // Make sure there is a record, otherwise create it and set defaults.
        if Rec.get() = false then begin
            Rec.INIt;
            Rec.SetupDefaults();
            Rec.Insert(FALSE);
        end;
    end;

}
