/// This codeunit runs the orderwise integration process

codeunit 53102 "DW.ORDERWISE.IntegrationMgt"
{
    TableNo = "Job Queue Entry";

    var
        integrationSetup: Record "DW.INTGR.Setup";
        encriptionManagement: Codeunit "Encryption Management";
        userAuthToken: Text;
        siteAuthToken: Text;
        supplierID: Text;

    trigger OnRun()
    begin
        Code();
    end;

    procedure TEST_UserAuth()
    begin
        GetUserAuthToken();
        Message(userAuthToken);
    end;

    procedure TEST_SiteAuth()
    begin
        GetUserAuthToken();
        GetSiteAuthToken();
        message(siteAuthToken);
    end;

    local procedure Code()
    var
    begin
        ReceiveAndProcessOrders();
    end;


    /// This function receives and processes orders for the order ligistics interface.
    procedure ReceiveAndProcessOrders()
    var
    begin

        /// 1. Get AuthTokens - This function assumes that it will be called from the Job Queue
        GetUserAuthToken();
        GetSiteAuthToken();

        /// 2. Get Supplier ID
        GetSupplierID();
        GetOrders();
    end;

    local procedure GetOrders()
    var
        httpClient: HttpClient;
        httpRequestMessage: HttpRequestMessage;
        httpResponseMessage: HttpResponseMessage;
        httpContent: HttpContent;
        httpHeaders: HttpHeaders;
        responseContent: Text;
        jsonToken: JsonToken;
        jsonObject: JsonObject;
        jsonValue: JsonValue;

        jsonOrders: JsonArray;
        jsonOrder: JsonObject;
        iCounter: Integer;

        orderID: Text;
    begin
        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Auth-Token', userAuthToken);
        httpHeaders.Add('Site-Token', siteAuthToken);

        httpRequestMessage.Content(httpContent);

        /// Processes only 100 at a time. Set max orders for prefered value.
        if integrationSetup.ORDLOG_ENABLED then begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_LIVEURL + '/suppliers/' + supplierID + '/orders' +
                        '?maxOrders=100& notConfirmed=True&noResults=False&incOrderwise=True&incRepwise=True');
        end
        else begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_DEVURL + '/suppliers/' + supplierID + '/orders' +
                        '?maxOrders=100& notConfirmed=True&noResults=False&incOrderwise=True&incRepwise=True');
        end;
        httpRequestMessage.Method('GET');
        httpClient.Send(httpRequestMessage, httpResponseMessage);

        httpResponseMessage.Content().ReadAs(responseContent);
        jsonToken.ReadFrom(responseContent);

        jsonOrders := jsonToken.AsArray();
        /// Loop through orders
        for iCounter := 0 to jsonOrders.Count() do begin
            if jsonOrders.Get(iCounter, jsonToken) then begin
                jsonOrder := jsonToken.AsObject();

                // Process Order to NAV here...
                CreateNAVOrder(jsonOrder);

                // Send order confirmation and results back to order logistics
                if jsonObject.Get('id', jsonToken) then begin
                    orderID := jsonToken.AsValue().AsText();
                    SendOrderConfirmation(orderID);
                    SendOrderConfirmationResults(orderID, GetJsonToken(jsonOrder, 'orderNo').AsValue().AsCode());
                    // Register push notification here... This is not defined yet in documentation...
                end;
            end;

        end;

    end;

    // send results of order confirmation
    local procedure SendOrderConfirmationResults(id: Text; salesOrderNo: code[20])
    var
        salesHeader: Record "Sales Header";
        salesLine: Record "Sales Line";
        httpClient: HttpClient;
        httpRequestMessage: HttpRequestMessage;
        httpResponseMessage: HttpResponseMessage;
        httpContent: HttpContent;
        httpHeaders: HttpHeaders;
        jsonPayLoad: JsonObject;
        jsonItems: JsonArray;
        jsonItem: JsonObject;
        jsonBackOrder: JsonObject;
        payLoad: Text;
    begin
        integrationSetup.get();

        /// Create payload

        //Header payload
        salesHeader.get(salesHeader."Document Type"::Order, salesOrderNo);
        jsonPayLoad.Add('SupplierRef', '0000000');  /// Can add further reference info here...

        //Lines payload
        salesLine.setrange("Document Type", salesLine."Document Type"::Order);
        salesLine.SetRange("Document No.", salesHeader."No.");
        if salesLine.IsEmpty() = false then begin
            salesLine.FindSet();
            repeat
                jsonItem.Add('ProductCode', salesLine."No.");
                jsonItem.Add('DeliveryQty', salesLine.Quantity);
                jsonItem.Add('ExpectedDeliveryDate', salesLine."Shipment Date");
                jsonItem.Add('AlternateDeliveryBranchCode', '');
                jsonItem.Add('InvoiceNo', '');
                jsonItem.Add('SupplyReasonCode', 'OK$');

                jsonBackOrder.Add('BackOrderQty', 0);
                jsonBackOrder.Add('ExpectedDeliveryDate', salesLine."Shipment Date");
                jsonItem.Add('BackOrder', jsonBackOrder);

                jsonItems.Add(jsonItem);
            Until salesLine.next = 0;
            jsonPayLoad.Add('items', jsonItems);
        end;


        jsonPayLoad.WriteTo(payLoad);

        httpContent.WriteFrom(payLoad);

        /// Retrieve Headers
        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Auth-Token', userAuthToken);
        httpHeaders.Add('Site-Token', siteAuthToken);
        httpHeaders.Add('Content-Type', 'application/json');

        httpRequestMessage.Content := httpContent;

        if integrationSetup.ORDLOG_ENABLED then begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_LIVEURL + '/orders/' + id + '/results');
        end
        else begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_DEVURL + '/orders/' + id + '/results');
        end;

        httpRequestMessage.Method('POST');

        httpClient.Send(httpRequestMessage, httpResponseMessage);


        //// handle response messages back......Doesn't make sense


    end;
    // Confirms that an order was receieved back to order logistics.
    local procedure SendOrderConfirmation(id: Text)
    var
        httpClient: HttpClient;
        httpRequestMessage: HttpRequestMessage;
        httpResponseMessage: HttpResponseMessage;
        httpContent: HttpContent;
        httpHeaders: HttpHeaders;
        jsonPayLoad: JsonObject;
        payLoad: Text;
    begin
        integrationSetup.get();

        /// Create payload
        jsonPayLoad.Add('SupplierRef', '0000000');  /// Can add further reference info here...
        jsonPayLoad.WriteTo(payLoad);

        httpContent.WriteFrom(payLoad);

        /// Retrieve Headers
        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Auth-Token', userAuthToken);
        httpHeaders.Add('Site-Token', siteAuthToken);
        httpHeaders.Add('Content-Type', 'application/json');

        httpRequestMessage.Content := httpContent;

        if integrationSetup.ORDLOG_ENABLED then begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_LIVEURL + '/orders/' + id + '/confirm');
        end
        else begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_DEVURL + '/orders/' + id + '/confirm');
        end;

        httpRequestMessage.Method('POST');

        httpClient.Send(httpRequestMessage, httpResponseMessage);

    end;

    // creates the actual NAV order...
    local procedure CreateNAVOrder(jOrder: JsonObject)
    var
        salesHeader: Record "Sales Header";
        salesLine: Record "Sales Line";
        jsonToken: JsonToken;
        jsonObject: JsonObject;
        jsonValue: JsonValue;
        jLines: JsonArray;
        jLine: JsonObject;
        iCounter: Integer;
    begin

        /// Sales header
        salesHeader.init;
        salesHeader."Document Type" := salesHeader."Document Type"::Order;
        salesHeader."No." := GetJsonToken(jOrder, 'orderNo').AsValue().AsText();
        salesHeader.Insert();

        salesHeader.SetHideValidationDialog(true);

        salesHeader.Validate("Sell-to Customer No.", GetJsonToken(jOrder, 'accountNo').AsValue().AsText());
        salesHeader.Validate("Document Date", GetJsonToken(jOrder, 'orderTimestamp').AsValue().AsDate());
        salesHeader.Validate("Your Reference", GetJsonToken(jOrder, 'customerRef').AsValue().AsText());

        /// NOTES: NEED SOMEWHERE TO ADD THE ID TO THE SALES DOCUMENT
        /// salesHeader.Validate("ORDERWISE ID",GetJsonToken(jOrder, 'id').AsValue().AsText());

        salesHeader.Modify();


        /// Lines
        jLines := GetJsonToken(jOrder, 'items').AsArray();
        for iCounter := 0 to jLines.Count() do begin
            jLines.get(iCounter, jsonToken);
            jLine := jsonToken.AsObject();

            salesLine.init;
            salesLine."Document Type" := salesHeader."Document Type";
            salesLine."Document No." := salesHeader."No.";
            salesLine."Line No." := iCounter;
            salesLine.Insert();

            salesLine.SetHideValidationDialog(true);

            salesLine.validate(Type, salesLine.Type::Item);
            salesLine.validate("No.", GetJsonToken(jLine, 'productCode').AsValue().AsText());
            salesLine.Validate(Quantity, GetJsonToken(jLine, 'orderQty').AsValue().AsDecimal());
            salesLine.Validate("Unit Price", GetJsonToken(jLine, 'unitPrice').AsValue().AsDecimal());

            salesLine.Modify();
        end;
    end;

    // Easier way of calling json fields
    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken;
    begin

        if not JsonObject.Get(TokenKey, JsonToken) then

            Error('Could not find a token with key %1', TokenKey);

    end;

    procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken;
    begin

        if not JsonObject.SelectToken(Path, JsonToken) then

            Error('Could not find a token with path %1', Path);

    end;

    local procedure GetSupplierID()
    var
        httpClient: HttpClient;
        httpRequestMessage: HttpRequestMessage;
        httpResponseMessage: HttpResponseMessage;
        httpContent: HttpContent;
        httpHeaders: HttpHeaders;
        responseContent: Text;
        jsonToken: JsonToken;
        jsonObject: JsonObject;
        jsonValue: JsonValue;
    begin
        integrationSetup.Get();

        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Auth-Token', userAuthToken);
        httpHeaders.Add('Site-Token', siteAuthToken);

        httpRequestMessage.Content(httpContent);

        if integrationSetup.ORDLOG_ENABLED then begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_LIVEURL + '/suppliers');
        end
        else begin
            httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_DEVURL + '/suppliers');
        end;
        httpRequestMessage.Method('GET');
        httpClient.Send(httpRequestMessage, httpResponseMessage);

        httpResponseMessage.Content().ReadAs(responseContent);

        jsonToken.ReadFrom(responseContent);
        jsonToken.AsArray().Get(0, jsonToken);
        jsonObject := jsonToken.AsObject();

        if jsonObject.get('id', jsonToken) then begin
            supplierID := jsonToken.AsValue().AsText();
        end;

    end;

    local procedure GetUserAuthToken()
    var
        httpClient: HttpClient;
        httpRequestMessage: HttpRequestMessage;
        httpResponseMessage: HttpResponseMessage;
        httpContent: HttpContent;
        httpHeaders: HttpHeaders;
        passwordHASH: Text;
        jsonPayLoad: JsonObject;
        payLoad: Text;
    begin
        integrationSetup.get();

        
        passwordHASH := encriptionManagement.GenerateHash(LowerCase(integrationSetup.ORDLOG_USERNAME) + '-' + integrationSetup.ORDLOG_PASSWORD, 0);
        passwordHASH :=LowerCase(passwordHASH); // << VOX1.10 PS >>

        /// Create payload
        jsonPayLoad.Add('UserName', integrationSetup.ORDLOG_USERNAME);
        jsonPayLoad.Add('PassHash', passwordHASH);
        jsonPayLoad.Add('ApplicationName', integrationSetup.ORDLOG_APPID);
        jsonPayLoad.Add('CompanyName', integrationSetup.ORDLOG_COMPANY);
        jsonPayLoad.WriteTo(payLoad);

        httpContent.WriteFrom(payLoad);

        /// Retrieve Headers
        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Content-Type', 'application/json');

        httpRequestMessage.Content := httpContent;
        httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_RESURL);
        httpRequestMessage.Method('POST');

        httpClient.Send(httpRequestMessage, httpResponseMessage);

        httpResponseMessage.Content().ReadAs(userAuthToken);


    end;


    /// This proceedure gets a new token for further api calls
    local procedure GetSiteAuthToken()
    var
        httpClient: HttpClient;
        httpRequestMessage: HttpRequestMessage;
        httpResponseMessage: HttpResponseMessage;
        httpContent: HttpContent;
        httpHeaders: HttpHeaders;
        passwordHASH: Text;
        jsonPayLoad: JsonObject;
        payLoad: Text;
    begin
        integrationSetup.get();

        passwordHASH := encriptionManagement.GenerateHash(LowerCase(integrationSetup.ORDLOG_SITENO) + '-' + integrationSetup.ORDLOG_SITEPASSWORD, 0);

        /// Create payload
        jsonPayLoad.Add('SiteNo', integrationSetup.ORDLOG_SITENO);
        jsonPayLoad.Add('PassHash', passwordHASH);
        jsonPayLoad.WriteTo(payLoad);

        httpContent.WriteFrom(payLoad);

        /// Retrieve Headers
        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Auth-Token', userAuthToken);
        httpHeaders.Add('Content-Type', 'application/json');

        httpRequestMessage.Content := httpContent;
        httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_SITETOKENURL);
        httpRequestMessage.Method('POST');

        httpClient.Send(httpRequestMessage, httpResponseMessage);

        httpResponseMessage.Content().ReadAs(siteAuthToken);


    end;
}