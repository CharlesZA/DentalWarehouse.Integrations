/// This codeunit runs the orderwise integration process

codeunit 53102 "DW.ORDERWISE.IntegrationMgt"
{
    var
        integrationSetup: Record "DW.INTGR.Setup";
        encriptionManagement: Codeunit "Encryption Management";
        userAuthToken: Text;
        siteAuthToken: Text;

    trigger OnRun()
    begin

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
        //jsonPayLoad.Add('ApplicationName', integrationSetup.ORDLOG_APPID);
        //jsonPayLoad.Add('CompanyName', integrationSetup.ORDLOG_COMPANY);
        jsonPayLoad.WriteTo(payLoad);

        httpContent.WriteFrom(payLoad);

        /// Retrieve Headers
        httpContent.GetHeaders(httpHeaders);
        httpHeaders.Clear();
        httpHeaders.Add('Content-Type', 'application/json');

        httpRequestMessage.Content := httpContent;
        httpRequestMessage.SetRequestUri(integrationSetup.ORDLOG_SITETOKENURL);
        httpRequestMessage.Method('POST');

        httpClient.Send(httpRequestMessage, httpResponseMessage);

        httpResponseMessage.Content().ReadAs(siteAuthToken);


    end;
}