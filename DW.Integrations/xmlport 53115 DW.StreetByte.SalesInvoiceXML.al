xmlport 53115 "DW.Streetbyte.Sinvlines.XML"
// << VOX1.14 PS >>
{

    Format = VariableText;
    FieldSeparator = '|';
    FieldDelimiter = '';
    //RecordSeparator = '<Newline>';
    schema

    {
        textelement(Root)
        {
            tableelement(SalesInvLines; "Sales Invoice Line")

            {
                XmlName = 'SalesInv';
                SourceTableView = SORTING ("Document No.") ORDER(Ascending) WHERE (Type = FILTER (Item));
                //Customer
                fieldelement(CustNo; SalesInvLines."Sell-to Customer No.") { }
                //Salesperson
                textelement(Salesp)
                {
                    trigger onbeforePassvariable();
                    begin
                        Salesp := gvSalesInvheader."Salesperson Code";
                    end;
                }
                //Product
                fieldelement(ItemNo; SalesInvLines."No.") { }
                //warehouse
                fieldelement(Whouse; SalesInvLines."Location Code") { }
                //order no
                textelement(OrderNo)
                {
                    trigger onbeforePassvariable();
                    begin
                        OrderNo := gvSalesInvheader."Order No.";
                    end;
                }
                //InvoiceNo
                fieldelement(InvNo; SalesInvLines."Document No.") { }
                //Order Date
                textelement(OrderDate)
                {
                    trigger onbeforePassvariable();
                    begin
                        Orderdate := format(gvSalesInvheader."Order Date", 0, '<Year4><Month,2><Day,2>');
                    end;
                }
                //Order Value 
                fieldelement(LineAmount; SalesInvLines."Line Amount") { }
                //Cost
                textelement(LineCost)
                {
                    trigger onbeforePassvariable();
                    begin
                        LineCost := format(SalesInvLines."Unit Cost" * SalesInvLines.Quantity);
                    end;
                }
                //Qty
                fieldelement(Qty; SalesInvLines.Quantity) { }
                //Discount
                fieldelement(LineAmount; SalesInvLines."Line Discount Amount") { }
                //Document Type
                textelement(DocumentType)
                {
                    trigger onbeforePassvariable();
                    begin
                        DocumentType := 'Invoice';
                    end;
                }
                //Customer Order Taken By
                textelement(OrderTakenBy)
                {
                    trigger onbeforePassvariable();
                    begin
                        OrderTakenBy := gvSalesInvHeader."Assigned User ID";
                    end;
                }

                trigger OnAfterGetRecord()

                begin
                    gvSalesInvHeader.reset;
                    gvSalesInvHeader.get(SalesInvLines."Document No.");
                end;
            }
        }

    }

    var
        gvSalesInvHeader: Record "Sales Invoice Header";

}