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
                field("StreetByte Enabled"; "StreetByte Enabled") { }
                field("StreetByte Address"; "StreetByte Address") { }
                field("StreetByte Port"; "StreetByte Port") { }
                field("StreetByte User"; "StreetByte User") { }
                field("StreetByte Password"; "StreetByte Password") { }
                field("StreetByte FilePath"; "StreetByte FilePath") { }
                FIELD("StreetByte SSHFINGER"; "StreetByte SSHFINGER") { }
                field("StreetByte Destination"; "StreetByte Destination") { }
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
                   Orderlogistics.TEST_UserAuth();
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

            action(StreetByte_ProdSubCat)
            {
                Caption = 'Send Product Sub Categories to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendProdSubCat;
                end;
            }

            
            action(StreetByte_Users)
            {
                Caption = 'Send Users to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendUsers;
                end;
            }

              action(StreetByte_Locations)
            {
                Caption = 'Send Locations to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendLocations;
                end;
            }
            
              action(StreetByte_ProductMaster)
            {
                Caption = 'Send Item Master to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendItemMaster;
                end;
            }
              action(StreetByte_CustomerGroups)
            {
                Caption = 'Send Customer Groups to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendCustomerGroups;
                end;
            }
               action(StreetByte_Salesinvs)
            {
                Caption = 'Send Sales Invoices to StreetByte';
                trigger OnAction()
                var
                    StreetByte: Codeunit "DW.streetbyte.IntegrationMgt";
                begin
                   clear(StreetByte);
                   StreetByte.SendSalesinvoices;
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
