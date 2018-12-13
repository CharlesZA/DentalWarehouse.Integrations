xmlport 53114 "DW.Streetbyte.StockMaster.XML"
// << VOX1.14 PS >>
{
  
   Format = VariableText;
   FieldSeparator='|';
   FieldDelimiter= '';
   
    schema
    
    {
        textelement(Root)
         
        {
            tableelement(Items;Item)
            {
                 XmlName = 'Items';
                fieldelement(ProdCode;Items."No.") { }
                fieldelement(ProdName;Items.Description) { }
                fieldelement(Inv;Items.Inventory) { }
                fieldelement(POInv;Items."Qty. on Purch. Order") { }
                fieldelement(UnitCost;Items."Unit Cost") { }
                fieldelement(SOInv;Items."Qty. on Sales Order") { }
                textelement(gvAllocatedQTy2)
                {
                trigger onbeforePassvariable();
                begin
                    gvAllocatedQTy2 := format(gvAllocatedQTy);
                end;
                }
                textelement(gvAVailableqty2)
                {
                trigger onbeforePassvariable();
                begin
                    gvAVailableqty2 := format(gvAVailableqty);
                end;
                }
                textelement(gvOnHandValue2)
                {
                trigger onbeforePassvariable();
                begin
                    gvOnHandValue2 := format(gvOnHandValue);
                end;
                }
                textelement(gvAvailValue2)
                {
                trigger onbeforePassvariable();
                begin
                    gvAvailValue2 := format(gvAvailValue);
                end;
                }
               
                trigger OnAfterGetRecord()
                var salesheader:Record "sales header";
                begin
                    gvAllocatedQTy := 0;
                    gvAVailableqty := 0;
                    gvOnHandValue := 0;
                    gvAvailValue :=0;
                    gvSalesline.reset;
                    gvSalesline.setrange("Document Type",gvSalesline."Document Type"::order);
                    gvSalesline.SetRange(Type,gvSalesline.type::item);
                    gvSalesline.SetRange("No.",Items."No.");
                    if gvSalesline.findset then begin 
                      repeat
                        salesheader.get(gvSalesline."Document Type",gvSalesline."Document No.");
                        if (salesheader.Status= salesheader.Status::Released) then begin 
                          gvAllocatedQTy += gvSalesline.Quantity; 
                        end;
                      until gvSalesline.next = 0;
                    end;
                    
                    if gvAllocatedQTy > Items.Inventory  then 
                      gvAllocatedQTy := Items.Inventory;

                    gvAVailableqty := Items.Inventory - gvAllocatedQTy;

                    if gvAVailableqty < 0 then 
                      gvAVailableqty := 0;

                    gvAvailValue := gvAllocatedQTy * Items."Unit Cost";
                    gvOnHandValue := items.Inventory * Items."Unit Cost";

                end;
            }
        }       
        
    }
     var
    gvAllocatedQTy:Decimal;
    gvAVailableqty:decimal;
    gvOnHandValue:Decimal;
    gvAvailValue:Decimal;
    gvSalesline:Record "Sales Line";

}