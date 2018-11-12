/// This xmlport is used to send credit memo information to bidvest

xmlport 53102 "DW.BIDVEST.CreditMemoXML"
{
    schema
    {
        textelement(SalesCreditMemos)
        {
            tableelement(SalesCrMemoHeader; "Sales Cr.Memo Header")
            {
                fieldelement(SelltoCustomerNo; SalesCrMemoHeader."Sell-to Customer No.") { }
                fieldelement(No; SalesCrMemoHeader."No.") { }
                fieldelement(BilltoCustomerNo; SalesCrMemoHeader."Bill-to Customer No.") { }
                fieldelement(BilltoName; SalesCrMemoHeader."Bill-to Name") { }
                fieldelement(BilltoName2; SalesCrMemoHeader."Bill-to Name 2") { }
                fieldelement(BilltoAddress; SalesCrMemoHeader."Bill-to Address") { }
                fieldelement(BilltoAddress2; SalesCrMemoHeader."Bill-to Address 2") { }
                fieldelement(BilltoCity; SalesCrMemoHeader."Bill-to City") { }
                fieldelement(BilltoContact; SalesCrMemoHeader."Bill-to Contact") { }
                fieldelement(YourReference; SalesCrMemoHeader."Your Reference") { }
                fieldelement(ShiptoCode; SalesCrMemoHeader."Ship-to Code") { }
                fieldelement(ShiptoName; SalesCrMemoHeader."Ship-to Name") { }
                fieldelement(ShiptoName2; SalesCrMemoHeader."Ship-to Name 2") { }
                fieldelement(ShiptoAddress; SalesCrMemoHeader."Ship-to Address") { }
                fieldelement(ShiptoAddress2; SalesCrMemoHeader."Ship-to Address 2") { }
                fieldelement(ShiptoCity; SalesCrMemoHeader."Ship-to City") { }
                fieldelement(ShiptoContact; SalesCrMemoHeader."Ship-to Contact") { }
                fieldelement(PostingDate; SalesCrMemoHeader."Posting Date") { }
                fieldelement(ShipmentDate; SalesCrMemoHeader."Shipment Date") { }
                fieldelement(PostingDescription; SalesCrMemoHeader."Posting Description") { }
                fieldelement(PaymentTermsCode; SalesCrMemoHeader."Payment Terms Code") { }
                fieldelement(DueDate; SalesCrMemoHeader."Due Date") { }
                fieldelement(PaymentDiscount; SalesCrMemoHeader."Payment Discount %") { }
                fieldelement(PmtDiscountDate; SalesCrMemoHeader."Pmt. Discount Date") { }
                fieldelement(ShipmentMethodCode; SalesCrMemoHeader."Shipment Method Code") { }
                fieldelement(LocationCode; SalesCrMemoHeader."Location Code") { }
                fieldelement(ShortcutDimension1Code; SalesCrMemoHeader."Shortcut Dimension 1 Code") { }
                fieldelement(ShortcutDimension2Code; SalesCrMemoHeader."Shortcut Dimension 2 Code") { }
                fieldelement(CustomerPostingGroup; SalesCrMemoHeader."Customer Posting Group") { }
                fieldelement(CurrencyCode; SalesCrMemoHeader."Currency Code") { }
                fieldelement(CurrencyFactor; SalesCrMemoHeader."Currency Factor") { }
                fieldelement(CustomerPriceGroup; SalesCrMemoHeader."Customer Price Group") { }
                fieldelement(PricesIncludingVAT; SalesCrMemoHeader."Prices Including VAT") { }
                fieldelement(InvoiceDiscCode; SalesCrMemoHeader."Invoice Disc. Code") { }
                fieldelement(CustomerDiscGroup; SalesCrMemoHeader."Customer Disc. Group") { }
                fieldelement(LanguageCode; SalesCrMemoHeader."Language Code") { }
                fieldelement(SalespersonCode; SalesCrMemoHeader."Salesperson Code") { }
                fieldelement(Comment; SalesCrMemoHeader."Comment") { }
                fieldelement(NoPrinted; SalesCrMemoHeader."No. Printed") { }
                fieldelement(OnHold; SalesCrMemoHeader."On Hold") { }
                fieldelement(AppliestoDocType; SalesCrMemoHeader."Applies-to Doc. Type") { }
                fieldelement(AppliestoDocNo; SalesCrMemoHeader."Applies-to Doc. No.") { }
                fieldelement(BalAccountNo; SalesCrMemoHeader."Bal. Account No.") { }
                fieldelement(Amount; SalesCrMemoHeader."Amount") { }
                fieldelement(AmountIncludingVAT; SalesCrMemoHeader."Amount Including VAT") { }
                fieldelement(VATRegistrationNo; SalesCrMemoHeader."VAT Registration No.") { }
                fieldelement(ReasonCode; SalesCrMemoHeader."Reason Code") { }
                fieldelement(GenBusPostingGroup; SalesCrMemoHeader."Gen. Bus. Posting Group") { }
                fieldelement(EU3PartyTrade; SalesCrMemoHeader."EU 3-Party Trade") { }
                fieldelement(TransactionType; SalesCrMemoHeader."Transaction Type") { }
                fieldelement(TransportMethod; SalesCrMemoHeader."Transport Method") { }
                fieldelement(VATCountryRegionCode; SalesCrMemoHeader."VAT Country/Region Code") { }
                fieldelement(SelltoCustomerName; SalesCrMemoHeader."Sell-to Customer Name") { }
                fieldelement(SelltoCustomerName2; SalesCrMemoHeader."Sell-to Customer Name 2") { }
                fieldelement(SelltoAddress; SalesCrMemoHeader."Sell-to Address") { }
                fieldelement(SelltoAddress2; SalesCrMemoHeader."Sell-to Address 2") { }
                fieldelement(SelltoCity; SalesCrMemoHeader."Sell-to City") { }
                fieldelement(SelltoContact; SalesCrMemoHeader."Sell-to Contact") { }
                fieldelement(BilltoPostCode; SalesCrMemoHeader."Bill-to Post Code") { }
                fieldelement(BilltoCounty; SalesCrMemoHeader."Bill-to County") { }
                fieldelement(BilltoCountryRegionCode; SalesCrMemoHeader."Bill-to Country/Region Code") { }
                fieldelement(SelltoPostCode; SalesCrMemoHeader."Sell-to Post Code") { }
                fieldelement(SelltoCounty; SalesCrMemoHeader."Sell-to County") { }
                fieldelement(SelltoCountryRegionCode; SalesCrMemoHeader."Sell-to Country/Region Code") { }
                fieldelement(ShiptoPostCode; SalesCrMemoHeader."Ship-to Post Code") { }
                fieldelement(ShiptoCounty; SalesCrMemoHeader."Ship-to County") { }
                fieldelement(ShiptoCountryRegionCode; SalesCrMemoHeader."Ship-to Country/Region Code") { }
                fieldelement(BalAccountType; SalesCrMemoHeader."Bal. Account Type") { }
                fieldelement(ExitPoint; SalesCrMemoHeader."Exit Point") { }
                fieldelement(Correction; SalesCrMemoHeader."Correction") { }
                fieldelement(DocumentDate; SalesCrMemoHeader."Document Date") { }
                fieldelement(ExternalDocumentNo; SalesCrMemoHeader."External Document No.") { }
                fieldelement(TransactionSpecification; SalesCrMemoHeader."Transaction Specification") { }
                fieldelement(PaymentMethodCode; SalesCrMemoHeader."Payment Method Code") { }
                fieldelement(PreAssignedNoSeries; SalesCrMemoHeader."Pre-Assigned No. Series") { }
                fieldelement(NoSeries; SalesCrMemoHeader."No. Series") { }
                fieldelement(PreAssignedNo; SalesCrMemoHeader."Pre-Assigned No.") { }
                fieldelement(UserID; SalesCrMemoHeader."User ID") { }
                fieldelement(SourceCode; SalesCrMemoHeader."Source Code") { }
                fieldelement(TaxAreaCode; SalesCrMemoHeader."Tax Area Code") { }
                fieldelement(TaxLiable; SalesCrMemoHeader."Tax Liable") { }
                fieldelement(VATBusPostingGroup; SalesCrMemoHeader."VAT Bus. Posting Group") { }
                fieldelement(VATBaseDiscount; SalesCrMemoHeader."VAT Base Discount %") { }
                fieldelement(PrepmtCrMemoNoSeries; SalesCrMemoHeader."Prepmt. Cr. Memo No. Series") { }
                fieldelement(PrepaymentCreditMemo; SalesCrMemoHeader."Prepayment Credit Memo") { }
                fieldelement(PrepaymentOrderNo; SalesCrMemoHeader."Prepayment Order No.") { }
                fieldelement(DimensionSetID; SalesCrMemoHeader."Dimension Set ID") { }
                fieldelement(DocumentExchangeIdentifier; SalesCrMemoHeader."Document Exchange Identifier") { }
                fieldelement(DocumentExchangeStatus; SalesCrMemoHeader."Document Exchange Status") { }
                fieldelement(DocExchOriginalIdentifier; SalesCrMemoHeader."Doc. Exch. Original Identifier") { }
                fieldelement(Paid; SalesCrMemoHeader."Paid") { }
                fieldelement(RemainingAmount; SalesCrMemoHeader."Remaining Amount") { }
                fieldelement(CustLedgerEntryNo; SalesCrMemoHeader."Cust. Ledger Entry No.") { }
                fieldelement(InvoiceDiscountAmount; SalesCrMemoHeader."Invoice Discount Amount") { }
                fieldelement(Cancelled; SalesCrMemoHeader."Cancelled") { }
                fieldelement(Corrective; SalesCrMemoHeader."Corrective") { }
                fieldelement(CampaignNo; SalesCrMemoHeader."Campaign No.") { }
                fieldelement(SelltoContactNo; SalesCrMemoHeader."Sell-to Contact No.") { }
                fieldelement(BilltoContactNo; SalesCrMemoHeader."Bill-to Contact No.") { }
                fieldelement(OpportunityNo; SalesCrMemoHeader."Opportunity No.") { }
                fieldelement(ResponsibilityCenter; SalesCrMemoHeader."Responsibility Center") { }
                fieldelement(ReturnOrderNo; SalesCrMemoHeader."Return Order No.") { }
                fieldelement(ReturnOrderNoSeries; SalesCrMemoHeader."Return Order No. Series") { }
                fieldelement(AllowLineDisc; SalesCrMemoHeader."Allow Line Disc.") { }
                fieldelement(GetReturnReceiptUsed; SalesCrMemoHeader."Get Return Receipt Used") { }
                fieldelement(Id; SalesCrMemoHeader."Id") { }

                textelement(SalesCreditMemoLines)
                {
                    tableelement(SalesCrMemoLine; "Sales Cr.Memo Line")
                    {
                        fieldelement(SelltoCustomerNo; SalesCrMemoLine."Sell-to Customer No.") { }
                        fieldelement(DocumentNo; SalesCrMemoLine."Document No.") { }
                        fieldelement(LineNo; SalesCrMemoLine."Line No.") { }
                        fieldelement(Type; SalesCrMemoLine."Type") { }
                        fieldelement(No; SalesCrMemoLine."No.") { }
                        fieldelement(LocationCode; SalesCrMemoLine."Location Code") { }
                        fieldelement(PostingGroup; SalesCrMemoLine."Posting Group") { }
                        fieldelement(ShipmentDate; SalesCrMemoLine."Shipment Date") { }
                        fieldelement(Description; SalesCrMemoLine."Description") { }
                        fieldelement(Description2; SalesCrMemoLine."Description 2") { }
                        fieldelement(UnitofMeasure; SalesCrMemoLine."Unit of Measure") { }
                        fieldelement(Quantity; SalesCrMemoLine."Quantity") { }
                        fieldelement(UnitPrice; SalesCrMemoLine."Unit Price") { }
                        fieldelement(UnitCostLCY; SalesCrMemoLine."Unit Cost (LCY)") { }
                        fieldelement(VAT; SalesCrMemoLine."VAT %") { }
                        fieldelement(LineDiscount; SalesCrMemoLine."Line Discount %") { }
                        fieldelement(LineDiscountAmount; SalesCrMemoLine."Line Discount Amount") { }
                        fieldelement(Amount; SalesCrMemoLine."Amount") { }
                        fieldelement(AmountIncludingVAT; SalesCrMemoLine."Amount Including VAT") { }
                        fieldelement(AllowInvoiceDisc; SalesCrMemoLine."Allow Invoice Disc.") { }
                        fieldelement(GrossWeight; SalesCrMemoLine."Gross Weight") { }
                        fieldelement(NetWeight; SalesCrMemoLine."Net Weight") { }
                        fieldelement(UnitsperParcel; SalesCrMemoLine."Units per Parcel") { }
                        fieldelement(UnitVolume; SalesCrMemoLine."Unit Volume") { }
                        fieldelement(AppltoItemEntry; SalesCrMemoLine."Appl.-to Item Entry") { }
                        fieldelement(ShortcutDimension1Code; SalesCrMemoLine."Shortcut Dimension 1 Code") { }
                        fieldelement(ShortcutDimension2Code; SalesCrMemoLine."Shortcut Dimension 2 Code") { }
                        fieldelement(CustomerPriceGroup; SalesCrMemoLine."Customer Price Group") { }
                        fieldelement(JobNo; SalesCrMemoLine."Job No.") { }
                        fieldelement(WorkTypeCode; SalesCrMemoLine."Work Type Code") { }
                        fieldelement(BilltoCustomerNo; SalesCrMemoLine."Bill-to Customer No.") { }
                        fieldelement(InvDiscountAmount; SalesCrMemoLine."Inv. Discount Amount") { }
                        fieldelement(GenBusPostingGroup; SalesCrMemoLine."Gen. Bus. Posting Group") { }
                        fieldelement(GenProdPostingGroup; SalesCrMemoLine."Gen. Prod. Posting Group") { }
                        fieldelement(VATCalculationType; SalesCrMemoLine."VAT Calculation Type") { }
                        fieldelement(TransactionType; SalesCrMemoLine."Transaction Type") { }
                        fieldelement(TransportMethod; SalesCrMemoLine."Transport Method") { }
                        fieldelement(AttachedtoLineNo; SalesCrMemoLine."Attached to Line No.") { }
                        fieldelement(ExitPoint; SalesCrMemoLine."Exit Point") { }
                        fieldelement(TransactionSpecification; SalesCrMemoLine."Transaction Specification") { }
                        fieldelement(TaxCategory; SalesCrMemoLine."Tax Category") { }
                        fieldelement(TaxAreaCode; SalesCrMemoLine."Tax Area Code") { }
                        fieldelement(TaxLiable; SalesCrMemoLine."Tax Liable") { }
                        fieldelement(TaxGroupCode; SalesCrMemoLine."Tax Group Code") { }
                        fieldelement(VATClauseCode; SalesCrMemoLine."VAT Clause Code") { }
                        fieldelement(VATBusPostingGroup; SalesCrMemoLine."VAT Bus. Posting Group") { }
                        fieldelement(VATProdPostingGroup; SalesCrMemoLine."VAT Prod. Posting Group") { }
                        fieldelement(BlanketOrderNo; SalesCrMemoLine."Blanket Order No.") { }
                        fieldelement(BlanketOrderLineNo; SalesCrMemoLine."Blanket Order Line No.") { }
                        fieldelement(VATBaseAmount; SalesCrMemoLine."VAT Base Amount") { }
                        fieldelement(UnitCost; SalesCrMemoLine."Unit Cost") { }
                        fieldelement(SystemCreatedEntry; SalesCrMemoLine."System-Created Entry") { }
                        fieldelement(LineAmount; SalesCrMemoLine."Line Amount") { }
                        fieldelement(VATDifference; SalesCrMemoLine."VAT Difference") { }
                        fieldelement(VATIdentifier; SalesCrMemoLine."VAT Identifier") { }
                        fieldelement(ICPartnerRefType; SalesCrMemoLine."IC Partner Ref. Type") { }
                        fieldelement(ICPartnerReference; SalesCrMemoLine."IC Partner Reference") { }
                        fieldelement(PrepaymentLine; SalesCrMemoLine."Prepayment Line") { }
                        fieldelement(ICPartnerCode; SalesCrMemoLine."IC Partner Code") { }
                        fieldelement(PostingDate; SalesCrMemoLine."Posting Date") { }
                        fieldelement(LineDiscountCalculation; SalesCrMemoLine."Line Discount Calculation") { }
                        fieldelement(DimensionSetID; SalesCrMemoLine."Dimension Set ID") { }
                        fieldelement(JobTaskNo; SalesCrMemoLine."Job Task No.") { }
                        fieldelement(JobContractEntryNo; SalesCrMemoLine."Job Contract Entry No.") { }
                        fieldelement(DeferralCode; SalesCrMemoLine."Deferral Code") { }
                        fieldelement(VariantCode; SalesCrMemoLine."Variant Code") { }
                        fieldelement(BinCode; SalesCrMemoLine."Bin Code") { }
                        fieldelement(QtyperUnitofMeasure; SalesCrMemoLine."Qty. per Unit of Measure") { }
                        fieldelement(UnitofMeasureCode; SalesCrMemoLine."Unit of Measure Code") { }
                        fieldelement(QuantityBase; SalesCrMemoLine."Quantity (Base)") { }
                        fieldelement(FAPostingDate; SalesCrMemoLine."FA Posting Date") { }
                        fieldelement(DepreciationBookCode; SalesCrMemoLine."Depreciation Book Code") { }
                        fieldelement(DepruntilFAPostingDate; SalesCrMemoLine."Depr. until FA Posting Date") { }
                        fieldelement(DuplicateinDepreciationBook; SalesCrMemoLine."Duplicate in Depreciation Book") { }
                        fieldelement(UseDuplicationList; SalesCrMemoLine."Use Duplication List") { }
                        fieldelement(ResponsibilityCenter; SalesCrMemoLine."Responsibility Center") { }
                        fieldelement(CrossReferenceNo; SalesCrMemoLine."Cross-Reference No.") { }
                        fieldelement(UnitofMeasureCrossRef; SalesCrMemoLine."Unit of Measure (Cross Ref.)") { }
                        fieldelement(CrossReferenceType; SalesCrMemoLine."Cross-Reference Type") { }
                        fieldelement(CrossReferenceTypeNo; SalesCrMemoLine."Cross-Reference Type No.") { }
                        fieldelement(ItemCategoryCode; SalesCrMemoLine."Item Category Code") { }
                        fieldelement(Nonstock; SalesCrMemoLine."Nonstock") { }
                        fieldelement(PurchasingCode; SalesCrMemoLine."Purchasing Code") { }
                        fieldelement(ApplfromItemEntry; SalesCrMemoLine."Appl.-from Item Entry") { }
                        fieldelement(ReturnReceiptNo; SalesCrMemoLine."Return Receipt No.") { }
                        fieldelement(ReturnReceiptLineNo; SalesCrMemoLine."Return Receipt Line No.") { }
                        fieldelement(ReturnReasonCode; SalesCrMemoLine."Return Reason Code") { }
                        fieldelement(AllowLineDisc; SalesCrMemoLine."Allow Line Disc.") { }
                        fieldelement(CustomerDiscGroup; SalesCrMemoLine."Customer Disc. Group") { }
                    }
                }
            }
        }
    }
}