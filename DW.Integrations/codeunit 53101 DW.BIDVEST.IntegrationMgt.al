/// This codeunit manages the bidvest integration

codeunit 53101 "DW.BIDVEST.IntegrationMgt"
{
    Description = 'Manages the bidvest integration';

    trigger OnRun()
    begin

    end;


    /// Determine best triggers to execute sending information to bidvest.

    /// This one below is to be used to sales invoices and credit memos
    /// LOCAL [IntegrationEvent] OnAfterFinalizePosting(VAR SalesHeader : Record "Sales Header";VAR SalesShipmentHeader : Record "Sales Shipment Header";VAR SalesInvoiceHeader : Record "Sales Invoice Header";VAR SalesCrMemoHeader : Record "Sales Cr.Memo Heade
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterFinalizePosting', '', false, false)]
    local procedure SALESPOST_OnAfterFinalizePosting(SalesHeader: Record "Sales Header";
                                                    SalesShipmentHeader: Record "Sales Shipment Header";
                                                    SalesInvoiceHeader: Record "Sales Invoice Header";
                                                    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                                                    ReturnReceiptHeader: Record "Return Receipt Header";
                                                    GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    begin
        if SalesInvoiceHeader."No." <> '' then begin
            SendInvoiceXML(SalesInvoiceHeader."No.");
        end;
        if SalesCrMemoHeader."No." <> '' then begin
            SendCreditMemoXML(SalesCrMemoHeader."No.");
        end;
    end;

    procedure SendInvoiceXML(documentNo: Code[20])
    var
        invoiceXML: XmlPort "DW.BIDVEST.InvoiceXML";
        salesInvHeader: Record "Sales Invoice Header";
        integrationSetup: Record "DW.INTGR.Setup";
    begin
        /// Send invoice xml based on document number filter
        integrationSetup.Get();
        if integrationSetup.BIDVEST_ENABLED = false then exit;
        if documentNo = '' then exit;

        salesInvHeader.SetRange("No.", documentNo);

        invoiceXML.SetTableView(salesInvHeader);
    end;

    procedure SendCreditMemoXML(documentNo: Code[20])
    var
        creditMemoXML: XmlPort "DW.BIDVEST.CreditMemoXML";
        salesCrMemoHeader: Record "Sales Cr.Memo Header";
        integrationSetup: Record "DW.INTGR.Setup";
    begin
        /// Send credit memo xml based on document number filter
        integrationSetup.Get();
        if integrationSetup.BIDVEST_ENABLED = false then exit;
        if documentNo = '' then exit;
        salesCrMemoHeader.SetRange("No.", documentNo);

        creditMemoXML.SetTableView(salesCrMemoHeader);
    end;

    procedure SendStatementXML(customerId: Code[20])
    var
        customerStatement: Report "Statement";
        statementxml: OutStream;
        statementinstream: InStream;
        tofiletext: Text;
        requestpagexml: Text;
    begin
        /// Send customer statement xml here....
        //customerStatement.SaveAsXml();
        requestpagexml := customerStatement.RunRequestPage();
        clear(customerStatement);
        customerStatement.SaveAs(requestpagexml, ReportFormat::Xml, statementxml);
        CopyStream(statementxml, statementinstream);


        tofiletext := 'statement.xml';
        DownloadFromStream(statementinstream, '', 'C:\Users\Charles\Desktop\test', '', tofiletext);
    end;
}