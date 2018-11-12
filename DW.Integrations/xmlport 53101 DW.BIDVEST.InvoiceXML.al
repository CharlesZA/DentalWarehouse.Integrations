/// This xmlport is used to send invoice information to bidvest

xmlport 53101 "DW.BIDVEST.InvoiceXML"
{
    Direction = Export;
    schema
    {
        textelement(SalesInvoices)
        {
            tableelement(SalesInvoiceHeader; "Sales Invoice Header")
            {
                XmlName = 'SalesInvoiceHeader';

                fieldelement(SelltoCustomerNo; SalesInvoiceHeader."Sell-to Customer No.") { }
                fieldelement(No; SalesInvoiceHeader."No.") { }
                fieldelement(BilltoCustomerNo; SalesInvoiceHeader."Bill-to Customer No.") { }
                fieldelement(BilltoName; SalesInvoiceHeader."Bill-to Name") { }
                fieldelement(BilltoName2; SalesInvoiceHeader."Bill-to Name 2") { }
                fieldelement(BilltoAddress; SalesInvoiceHeader."Bill-to Address") { }
                fieldelement(BilltoAddress2; SalesInvoiceHeader."Bill-to Address 2") { }
                fieldelement(BilltoCity; SalesInvoiceHeader."Bill-to City") { }
                fieldelement(BilltoContact; SalesInvoiceHeader."Bill-to Contact") { }
                fieldelement(YourReference; SalesInvoiceHeader."Your Reference") { }
                fieldelement(ShiptoCode; SalesInvoiceHeader."Ship-to Code") { }
                fieldelement(ShiptoName; SalesInvoiceHeader."Ship-to Name") { }
                fieldelement(ShiptoName2; SalesInvoiceHeader."Ship-to Name 2") { }
                fieldelement(ShiptoAddress; SalesInvoiceHeader."Ship-to Address") { }
                fieldelement(ShiptoAddress2; SalesInvoiceHeader."Ship-to Address 2") { }
                fieldelement(ShiptoCity; SalesInvoiceHeader."Ship-to City") { }
                fieldelement(ShiptoContact; SalesInvoiceHeader."Ship-to Contact") { }
                fieldelement(OrderDate; SalesInvoiceHeader."Order Date") { }
                fieldelement(PostingDate; SalesInvoiceHeader."Posting Date") { }
                fieldelement(ShipmentDate; SalesInvoiceHeader."Shipment Date") { }
                fieldelement(PostingDescription; SalesInvoiceHeader."Posting Description") { }
                fieldelement(PaymentTermsCode; SalesInvoiceHeader."Payment Terms Code") { }
                fieldelement(DueDate; SalesInvoiceHeader."Due Date") { }
                fieldelement(PaymentDiscount; SalesInvoiceHeader."Payment Discount %") { }
                fieldelement(PmtDiscountDate; SalesInvoiceHeader."Pmt. Discount Date") { }
                fieldelement(ShipmentMethodCode; SalesInvoiceHeader."Shipment Method Code") { }
                fieldelement(LocationCode; SalesInvoiceHeader."Location Code") { }
                fieldelement(ShortcutDimension1Code; SalesInvoiceHeader."Shortcut Dimension 1 Code") { }
                fieldelement(ShortcutDimension2Code; SalesInvoiceHeader."Shortcut Dimension 2 Code") { }
                fieldelement(CustomerPostingGroup; SalesInvoiceHeader."Customer Posting Group") { }
                fieldelement(CurrencyCode; SalesInvoiceHeader."Currency Code") { }
                fieldelement(CurrencyFactor; SalesInvoiceHeader."Currency Factor") { }
                fieldelement(CustomerPriceGroup; SalesInvoiceHeader."Customer Price Group") { }
                fieldelement(PricesIncludingVAT; SalesInvoiceHeader."Prices Including VAT") { }
                fieldelement(InvoiceDiscCode; SalesInvoiceHeader."Invoice Disc. Code") { }
                fieldelement(CustomerDiscGroup; SalesInvoiceHeader."Customer Disc. Group") { }
                fieldelement(LanguageCode; SalesInvoiceHeader."Language Code") { }
                fieldelement(SalespersonCode; SalesInvoiceHeader."Salesperson Code") { }
                fieldelement(OrderNo; SalesInvoiceHeader."Order No.") { }
                fieldelement(Comment; SalesInvoiceHeader."Comment") { }
                fieldelement(NoPrinted; SalesInvoiceHeader."No. Printed") { }
                fieldelement(OnHold; SalesInvoiceHeader."On Hold") { }
                fieldelement(AppliestoDocType; SalesInvoiceHeader."Applies-to Doc. Type") { }
                fieldelement(AppliestoDocNo; SalesInvoiceHeader."Applies-to Doc. No.") { }
                fieldelement(BalAccountNo; SalesInvoiceHeader."Bal. Account No.") { }
                fieldelement(Amount; SalesInvoiceHeader."Amount") { }
                fieldelement(AmountIncludingVAT; SalesInvoiceHeader."Amount Including VAT") { }
                fieldelement(VATRegistrationNo; SalesInvoiceHeader."VAT Registration No.") { }
                fieldelement(ReasonCode; SalesInvoiceHeader."Reason Code") { }
                fieldelement(GenBusPostingGroup; SalesInvoiceHeader."Gen. Bus. Posting Group") { }
                fieldelement(EU3PartyTrade; SalesInvoiceHeader."EU 3-Party Trade") { }
                fieldelement(TransactionType; SalesInvoiceHeader."Transaction Type") { }
                fieldelement(TransportMethod; SalesInvoiceHeader."Transport Method") { }
                fieldelement(VATCountryRegionCode; SalesInvoiceHeader."VAT Country/Region Code") { }
                fieldelement(SelltoCustomerName; SalesInvoiceHeader."Sell-to Customer Name") { }
                fieldelement(SelltoCustomerName2; SalesInvoiceHeader."Sell-to Customer Name 2") { }
                fieldelement(SelltoAddress; SalesInvoiceHeader."Sell-to Address") { }
                fieldelement(SelltoAddress2; SalesInvoiceHeader."Sell-to Address 2") { }
                fieldelement(SelltoCity; SalesInvoiceHeader."Sell-to City") { }
                fieldelement(SelltoContact; SalesInvoiceHeader."Sell-to Contact") { }
                fieldelement(BilltoPostCode; SalesInvoiceHeader."Bill-to Post Code") { }
                fieldelement(BilltoCounty; SalesInvoiceHeader."Bill-to County") { }
                fieldelement(BilltoCountryRegionCode; SalesInvoiceHeader."Bill-to Country/Region Code") { }
                fieldelement(SelltoPostCode; SalesInvoiceHeader."Sell-to Post Code") { }
                fieldelement(SelltoCounty; SalesInvoiceHeader."Sell-to County") { }
                fieldelement(SelltoCountryRegionCode; SalesInvoiceHeader."Sell-to Country/Region Code") { }
                fieldelement(ShiptoPostCode; SalesInvoiceHeader."Ship-to Post Code") { }
                fieldelement(ShiptoCounty; SalesInvoiceHeader."Ship-to County") { }
                fieldelement(ShiptoCountryRegionCode; SalesInvoiceHeader."Ship-to Country/Region Code") { }
                fieldelement(BalAccountType; SalesInvoiceHeader."Bal. Account Type") { }
                fieldelement(ExitPoint; SalesInvoiceHeader."Exit Point") { }
                fieldelement(Correction; SalesInvoiceHeader."Correction") { }
                fieldelement(DocumentDate; SalesInvoiceHeader."Document Date") { }
                fieldelement(ExternalDocumentNo; SalesInvoiceHeader."External Document No.") { }
                fieldelement(TransactionSpecification; SalesInvoiceHeader."Transaction Specification") { }
                fieldelement(PaymentMethodCode; SalesInvoiceHeader."Payment Method Code") { }
                fieldelement(ShippingAgentCode; SalesInvoiceHeader."Shipping Agent Code") { }
                fieldelement(PackageTrackingNo; SalesInvoiceHeader."Package Tracking No.") { }
                fieldelement(PreAssignedNoSeries; SalesInvoiceHeader."Pre-Assigned No. Series") { }
                fieldelement(NoSeries; SalesInvoiceHeader."No. Series") { }
                fieldelement(OrderNoSeries; SalesInvoiceHeader."Order No. Series") { }
                fieldelement(PreAssignedNo; SalesInvoiceHeader."Pre-Assigned No.") { }
                fieldelement(UserID; SalesInvoiceHeader."User ID") { }
                fieldelement(SourceCode; SalesInvoiceHeader."Source Code") { }
                fieldelement(TaxAreaCode; SalesInvoiceHeader."Tax Area Code") { }
                fieldelement(TaxLiable; SalesInvoiceHeader."Tax Liable") { }
                fieldelement(VATBusPostingGroup; SalesInvoiceHeader."VAT Bus. Posting Group") { }
                fieldelement(VATBaseDiscount; SalesInvoiceHeader."VAT Base Discount %") { }
                fieldelement(InvoiceDiscountCalculation; SalesInvoiceHeader."Invoice Discount Calculation") { }
                fieldelement(InvoiceDiscountValue; SalesInvoiceHeader."Invoice Discount Value") { }
                fieldelement(PrepaymentNoSeries; SalesInvoiceHeader."Prepayment No. Series") { }
                fieldelement(PrepaymentInvoice; SalesInvoiceHeader."Prepayment Invoice") { }
                fieldelement(PrepaymentOrderNo; SalesInvoiceHeader."Prepayment Order No.") { }
                fieldelement(QuoteNo; SalesInvoiceHeader."Quote No.") { }
                fieldelement(LastEmailSentTime; SalesInvoiceHeader."Last Email Sent Time") { }
                fieldelement(LastEmailSentStatus; SalesInvoiceHeader."Last Email Sent Status") { }
                fieldelement(SentasEmail; SalesInvoiceHeader."Sent as Email") { }
                fieldelement(LastEmailNotifCleared; SalesInvoiceHeader."Last Email Notif Cleared") { }
                // fieldelement(WorkDescription; SalesInvoiceHeader."Work Description") { }
                fieldelement(DimensionSetID; SalesInvoiceHeader."Dimension Set ID") { }
                fieldelement(PaymentServiceSetID; SalesInvoiceHeader."Payment Service Set ID") { }
                fieldelement(DocumentExchangeIdentifier; SalesInvoiceHeader."Document Exchange Identifier") { }
                fieldelement(DocumentExchangeStatus; SalesInvoiceHeader."Document Exchange Status") { }
                fieldelement(DocExchOriginalIdentifier; SalesInvoiceHeader."Doc. Exch. Original Identifier") { }
                fieldelement(CoupledtoCRM; SalesInvoiceHeader."Coupled to CRM") { }
                fieldelement(DirectDebitMandateID; SalesInvoiceHeader."Direct Debit Mandate ID") { }
                fieldelement(Closed; SalesInvoiceHeader."Closed") { }
                fieldelement(RemainingAmount; SalesInvoiceHeader."Remaining Amount") { }
                fieldelement(CustLedgerEntryNo; SalesInvoiceHeader."Cust. Ledger Entry No.") { }
                fieldelement(InvoiceDiscountAmount; SalesInvoiceHeader."Invoice Discount Amount") { }
                fieldelement(Cancelled; SalesInvoiceHeader."Cancelled") { }
                fieldelement(Corrective; SalesInvoiceHeader."Corrective") { }
                fieldelement(CampaignNo; SalesInvoiceHeader."Campaign No.") { }
                fieldelement(SelltoContactNo; SalesInvoiceHeader."Sell-to Contact No.") { }
                fieldelement(BilltoContactNo; SalesInvoiceHeader."Bill-to Contact No.") { }
                fieldelement(OpportunityNo; SalesInvoiceHeader."Opportunity No.") { }
                fieldelement(ResponsibilityCenter; SalesInvoiceHeader."Responsibility Center") { }
                fieldelement(AllowLineDisc; SalesInvoiceHeader."Allow Line Disc.") { }
                fieldelement(GetShipmentUsed; SalesInvoiceHeader."Get Shipment Used") { }
                fieldelement(Id; SalesInvoiceHeader."Id") { }

                /// Lines
                textelement(SalesInvoiceLines)
                {
                    tableelement(SalesInvoiceLine; "Sales Invoice Line")
                    {
                        XmlName = 'SalesInvoiceLine';
                        LinkTable = SalesInvoiceHeader;
                        LinkFields = "Document No." = FIELD ("No.");

                        fieldelement(SelltoCustomerNo; SalesInvoiceLine."Sell-to Customer No.") { }
                        fieldelement(DocumentNo; SalesInvoiceLine."Document No.") { }
                        fieldelement(LineNo; SalesInvoiceLine."Line No.") { }
                        fieldelement(Type; SalesInvoiceLine."Type") { }
                        fieldelement(No; SalesInvoiceLine."No.") { }
                        fieldelement(LocationCode; SalesInvoiceLine."Location Code") { }
                        fieldelement(PostingGroup; SalesInvoiceLine."Posting Group") { }
                        fieldelement(ShipmentDate; SalesInvoiceLine."Shipment Date") { }
                        fieldelement(Description; SalesInvoiceLine."Description") { }
                        fieldelement(Description2; SalesInvoiceLine."Description 2") { }
                        fieldelement(UnitofMeasure; SalesInvoiceLine."Unit of Measure") { }
                        fieldelement(Quantity; SalesInvoiceLine."Quantity") { }
                        fieldelement(UnitPrice; SalesInvoiceLine."Unit Price") { }
                        fieldelement(UnitCostLCY; SalesInvoiceLine."Unit Cost (LCY)") { }
                        fieldelement(VAT; SalesInvoiceLine."VAT %") { }
                        fieldelement(LineDiscount; SalesInvoiceLine."Line Discount %") { }
                        fieldelement(LineDiscountAmount; SalesInvoiceLine."Line Discount Amount") { }
                        fieldelement(Amount; SalesInvoiceLine."Amount") { }
                        fieldelement(AmountIncludingVAT; SalesInvoiceLine."Amount Including VAT") { }
                        fieldelement(AllowInvoiceDisc; SalesInvoiceLine."Allow Invoice Disc.") { }
                        fieldelement(GrossWeight; SalesInvoiceLine."Gross Weight") { }
                        fieldelement(NetWeight; SalesInvoiceLine."Net Weight") { }
                        fieldelement(UnitsperParcel; SalesInvoiceLine."Units per Parcel") { }
                        fieldelement(UnitVolume; SalesInvoiceLine."Unit Volume") { }
                        fieldelement(AppltoItemEntry; SalesInvoiceLine."Appl.-to Item Entry") { }
                        fieldelement(ShortcutDimension1Code; SalesInvoiceLine."Shortcut Dimension 1 Code") { }
                        fieldelement(ShortcutDimension2Code; SalesInvoiceLine."Shortcut Dimension 2 Code") { }
                        fieldelement(CustomerPriceGroup; SalesInvoiceLine."Customer Price Group") { }
                        fieldelement(JobNo; SalesInvoiceLine."Job No.") { }
                        fieldelement(WorkTypeCode; SalesInvoiceLine."Work Type Code") { }
                        fieldelement(ShipmentNo; SalesInvoiceLine."Shipment No.") { }
                        fieldelement(ShipmentLineNo; SalesInvoiceLine."Shipment Line No.") { }
                        fieldelement(BilltoCustomerNo; SalesInvoiceLine."Bill-to Customer No.") { }
                        fieldelement(InvDiscountAmount; SalesInvoiceLine."Inv. Discount Amount") { }
                        fieldelement(DropShipment; SalesInvoiceLine."Drop Shipment") { }
                        fieldelement(GenBusPostingGroup; SalesInvoiceLine."Gen. Bus. Posting Group") { }
                        fieldelement(GenProdPostingGroup; SalesInvoiceLine."Gen. Prod. Posting Group") { }
                        fieldelement(VATCalculationType; SalesInvoiceLine."VAT Calculation Type") { }
                        fieldelement(TransactionType; SalesInvoiceLine."Transaction Type") { }
                        fieldelement(TransportMethod; SalesInvoiceLine."Transport Method") { }
                        fieldelement(AttachedtoLineNo; SalesInvoiceLine."Attached to Line No.") { }
                        fieldelement(ExitPoint; SalesInvoiceLine."Exit Point") { }
                        fieldelement(TransactionSpecification; SalesInvoiceLine."Transaction Specification") { }
                        fieldelement(TaxCategory; SalesInvoiceLine."Tax Category") { }
                        fieldelement(TaxAreaCode; SalesInvoiceLine."Tax Area Code") { }
                        fieldelement(TaxLiable; SalesInvoiceLine."Tax Liable") { }
                        fieldelement(TaxGroupCode; SalesInvoiceLine."Tax Group Code") { }
                        fieldelement(VATClauseCode; SalesInvoiceLine."VAT Clause Code") { }
                        fieldelement(VATBusPostingGroup; SalesInvoiceLine."VAT Bus. Posting Group") { }
                        fieldelement(VATProdPostingGroup; SalesInvoiceLine."VAT Prod. Posting Group") { }
                        fieldelement(BlanketOrderNo; SalesInvoiceLine."Blanket Order No.") { }
                        fieldelement(BlanketOrderLineNo; SalesInvoiceLine."Blanket Order Line No.") { }
                        fieldelement(VATBaseAmount; SalesInvoiceLine."VAT Base Amount") { }
                        fieldelement(UnitCost; SalesInvoiceLine."Unit Cost") { }
                        fieldelement(SystemCreatedEntry; SalesInvoiceLine."System-Created Entry") { }
                        fieldelement(LineAmount; SalesInvoiceLine."Line Amount") { }
                        fieldelement(VATDifference; SalesInvoiceLine."VAT Difference") { }
                        fieldelement(VATIdentifier; SalesInvoiceLine."VAT Identifier") { }
                        fieldelement(ICPartnerRefType; SalesInvoiceLine."IC Partner Ref. Type") { }
                        fieldelement(ICPartnerReference; SalesInvoiceLine."IC Partner Reference") { }
                        fieldelement(PrepaymentLine; SalesInvoiceLine."Prepayment Line") { }
                        fieldelement(ICPartnerCode; SalesInvoiceLine."IC Partner Code") { }
                        fieldelement(PostingDate; SalesInvoiceLine."Posting Date") { }
                        fieldelement(LineDiscountCalculation; SalesInvoiceLine."Line Discount Calculation") { }
                        fieldelement(DimensionSetID; SalesInvoiceLine."Dimension Set ID") { }
                        fieldelement(JobTaskNo; SalesInvoiceLine."Job Task No.") { }
                        fieldelement(JobContractEntryNo; SalesInvoiceLine."Job Contract Entry No.") { }
                        fieldelement(DeferralCode; SalesInvoiceLine."Deferral Code") { }
                        fieldelement(VariantCode; SalesInvoiceLine."Variant Code") { }
                        fieldelement(BinCode; SalesInvoiceLine."Bin Code") { }
                        fieldelement(QtyperUnitofMeasure; SalesInvoiceLine."Qty. per Unit of Measure") { }
                        fieldelement(UnitofMeasureCode; SalesInvoiceLine."Unit of Measure Code") { }
                        fieldelement(QuantityBase; SalesInvoiceLine."Quantity (Base)") { }
                        fieldelement(FAPostingDate; SalesInvoiceLine."FA Posting Date") { }
                        fieldelement(DepreciationBookCode; SalesInvoiceLine."Depreciation Book Code") { }
                        fieldelement(DepruntilFAPostingDate; SalesInvoiceLine."Depr. until FA Posting Date") { }
                        fieldelement(DuplicateinDepreciationBook; SalesInvoiceLine."Duplicate in Depreciation Book") { }
                        fieldelement(UseDuplicationList; SalesInvoiceLine."Use Duplication List") { }
                        fieldelement(ResponsibilityCenter; SalesInvoiceLine."Responsibility Center") { }
                        fieldelement(CrossReferenceNo; SalesInvoiceLine."Cross-Reference No.") { }
                        fieldelement(UnitofMeasureCrossRef; SalesInvoiceLine."Unit of Measure (Cross Ref.)") { }
                        fieldelement(CrossReferenceType; SalesInvoiceLine."Cross-Reference Type") { }
                        fieldelement(CrossReferenceTypeNo; SalesInvoiceLine."Cross-Reference Type No.") { }
                        fieldelement(ItemCategoryCode; SalesInvoiceLine."Item Category Code") { }
                        fieldelement(Nonstock; SalesInvoiceLine."Nonstock") { }
                        fieldelement(PurchasingCode; SalesInvoiceLine."Purchasing Code") { }
                        fieldelement(ApplfromItemEntry; SalesInvoiceLine."Appl.-from Item Entry") { }
                        fieldelement(ReturnReasonCode; SalesInvoiceLine."Return Reason Code") { }
                        fieldelement(AllowLineDisc; SalesInvoiceLine."Allow Line Disc.") { }
                        fieldelement(CustomerDiscGroup; SalesInvoiceLine."Customer Disc. Group") { }
                        fieldelement(Pricedescription; SalesInvoiceLine."Price description") { }
                    }
                }
            }
        }
    }
}