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
        txtINVID: Code[20];
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtOutStream: OutStream;
    begin
        /// Send invoice xml based on document number filter
        integrationSetup.Get();
        if integrationSetup.BIDVEST_ENABLED = false then exit;
        if documentNo = '' then exit;

        salesInvHeader.SetRange("No.", documentNo);

        invoiceXML.SetTableView(salesInvHeader);

        txtINVID := 'INVOICE';
        IF processBlob.Get(txtINVID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtINVID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(txtOutStream);
        invoiceXML.SetDestination(txtOutStream);
        invoiceXML.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.BIDVEST_TEMPXMLPATH + '\' + documentNo + '.xml', true);

        processBlob.get(txtINVID);
        processBlob.Delete(false);

        /// add ftp function call here....
    end;

    procedure SendCreditMemoXML(documentNo: Code[20])
    var
        creditMemoXML: XmlPort "DW.BIDVEST.CreditMemoXML";
        salesCrMemoHeader: Record "Sales Cr.Memo Header";
        integrationSetup: Record "DW.INTGR.Setup";
        txtINVID: Code[20];
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtOutStream: OutStream;
    begin
        /// Send credit memo xml based on document number filter
        integrationSetup.Get();
        if integrationSetup.BIDVEST_ENABLED = false then exit;
        if documentNo = '' then exit;
        salesCrMemoHeader.SetRange("No.", documentNo);

        creditMemoXML.SetTableView(salesCrMemoHeader);

        txtINVID := 'CRMEMO';
        IF processBlob.Get(txtINVID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtINVID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(txtOutStream);
        creditMemoXML.SetDestination(txtOutStream);
        creditMemoXML.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.BIDVEST_TEMPXMLPATH + '\' + documentNo + '.xml', true);

        processBlob.get(txtINVID);
        processBlob.Delete(false);

        /// add ftp function call here
    end;

    procedure SendStatementXML(customerId: Code[20])
    var
        integrationSetup: Record "DW.INTGR.Setup";
        customerStatement: Report 116;
        statementxml: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
    begin
        integrationSetup.get;
        if integrationSetup.BIDVEST_ENABLED = false then exit;

        /// Send customer statement xml here....
        //customerStatement.SaveAsXml();
        requestpagexml := customerStatement.RunRequestPage();
        clear(customerStatement);

        tofiletext := 'statement.xml';

        txtID := 'STATEMENT';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(statementxml);

        customerStatement.SaveAs(requestpagexml, ReportFormat::Xml, statementxml);

        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.BIDVEST_TEMPXMLPATH + '\' + 'statement' + '.xml', true);



        //// add ftp function call here
    end;
}