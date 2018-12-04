
codeunit 53103 "DW.STREETBYTE.IntegrationMgt"
{
    Description = 'Manages the StreetByte integration';
  
    trigger OnRun()
    begin
      // << VOX1.14 PS   >> 
      //Rep Names
      //Product sub Cat
      //Product Master 
      //Product Categories
      //order taken by 
      //customer Master 
      //geo areas
      //dentsply
      //Customer Groups 
      //warehouse master 
      //Supllier Master 
      //Stock Master
      //Sales-Invoices
    end;


    procedure SendSalesReps()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendSalesReps: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        SALESREPS:XmlPort "DW.BIDVEST.SalesRepsXML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;

        /// Send customer statement xml here....
        //SALESREPS.SaveAsXml();
       // requestpagexml := SALESREPS.RunRequestPage();
        clear(SALESREPS);

        tofiletext := 'Sales-reps.TXT';

        txtID := 'Sales-reps';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendSalesReps);
        SALESREPS.SetDestination(SendSalesReps);
        SALESREPS.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.BIDVEST_TEMPXMLPATH + '\' + 'Sales-reps'+ '.txt', true);

       // processBlob.get(txtID);
       // processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.BIDVEST_IP, integrationSetup.BIDVEST_USER,
                                     integrationSetup.BIDVEST_PASSWORD, integrationSetup.BIDVEST_SSHFINGER,
                                     integrationSetup.BIDVEST_TEMPXMLPATH + '\' + 'Sales-reps'+ '.txt',
                                     '/ <root>');

    end;
}