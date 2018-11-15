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
                    SendOrderConfirmationResults(orderID);
                    // Register push notification here... This is not defined yet in documentation...
                end;
            end;

        end;

    end;

    // send results of order confirmation
    local procedure SendOrderConfirmationResults(id: Text)
    var
    begin

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
    begin

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

        jsonObject.get('id', jsonToken);
        supplierID := jsonToken.AsValue().AsText();
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