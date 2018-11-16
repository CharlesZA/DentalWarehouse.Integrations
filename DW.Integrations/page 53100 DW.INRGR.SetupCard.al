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
