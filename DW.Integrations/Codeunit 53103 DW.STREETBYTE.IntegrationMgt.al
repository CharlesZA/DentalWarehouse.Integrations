
codeunit 53103 "DW.STREETBYTE.IntegrationMgt"
{
    Description = 'Manages the StreetByte integration';
  
    trigger OnRun()
    begin
        // << VOX1.14 PS   >> 
        //Rep Names : SendSalesReps
        //customer Master : SendCustomers
        //Product Categories : SendProdCat
        //Supllier Master  : SendSupplier
        //geo areas : SendGeoAreas
        //Product sub Cat : SendProdSubCat
      
      //Product Master 
      //order taken by 
      //dentsply
      //Customer Groups 
      //warehouse master 
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
        SALESREPS:XmlPort "DW.streetbyte.SalesRepsXML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;
        clear(SALESREPS);
        tofiletext := 'rep-names.txt';

        txtID := 'rep-names';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendSalesReps);
        SALESREPS.SetDestination(SendSalesReps);
        SALESREPS.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.StreetByte_FilePath + '\' + 'rep-names'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.StreetByte_Address,integrationSetup.StreetByte_User,
                                     integrationSetup.StreetByte_Password, integrationSetup.StreetByte_SSHFINGER,
                                     integrationSetup.StreetByte_FilePath + '\' +'rep-names'+ '.txt',
                                     '/ <root>');

    end;

    
    procedure SendCustomers()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendCustomers: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        Customers:XmlPort "DW.StreetByte.Customers.XML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;
        clear(Customers);
        tofiletext := 'customer-master.txt';

        txtID := 'customer-master';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendCustomers);
        Customers.SetDestination(SendCustomers);
        Customers.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.StreetByte_FilePath + '\' + 'customer-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.StreetByte_Address,integrationSetup.StreetByte_User,
                                     integrationSetup.StreetByte_Password, integrationSetup.StreetByte_SSHFINGER,
                                     integrationSetup.StreetByte_FilePath + '\' +'customer-master'+ '.txt',
                                     '/ <root>');

    end;

    procedure SendProdCat()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendProdCat: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        ProdCats:XmlPort "DW.Streetbyte.ProductCat.XML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;
        clear(ProdCats);
        tofiletext := 'product-categories.txt';

        txtID := 'product-categories';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendProdCat);
        ProdCats.SetDestination(SendProdCat);
        ProdCats.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.StreetByte_FilePath + '\' + 'product-categories'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.StreetByte_Address,integrationSetup.StreetByte_User,
                                     integrationSetup.StreetByte_Password, integrationSetup.StreetByte_SSHFINGER,
                                     integrationSetup.StreetByte_FilePath + '\' +'product-categories'+ '.txt',
                                     '/ <root>');

    end;

    procedure SendSupplier()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendSuppliers: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        ProdCats:XmlPort "DW.Streetbyte.ProductCat.XML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;
        clear(ProdCats);
        tofiletext := 'supplier-master.txt';

        txtID := 'supplier-master';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendSuppliers);
        ProdCats.SetDestination(SendSuppliers);
        ProdCats.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.StreetByte_FilePath + '\' + 'supplier-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.StreetByte_Address,integrationSetup.StreetByte_User,
                                     integrationSetup.StreetByte_Password, integrationSetup.StreetByte_SSHFINGER,
                                     integrationSetup.StreetByte_FilePath + '\' +'supplier-master'+ '.txt',
                                     '/ <root>');

    end;

    procedure SendGeoAreas()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendGeoArea: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        GeoAreas:XmlPort "DW.Streetbyte.GeoAreas.XML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;
        clear(GeoAreas);
        tofiletext := 'geo-areas.txt';

        txtID := 'geo-areas';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendGeoArea);
        GeoAreas.SetDestination(SendGeoArea);
        GeoAreas.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.StreetByte_FilePath + '\' + 'geo-areas'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.StreetByte_Address,integrationSetup.StreetByte_User,
                                     integrationSetup.StreetByte_Password, integrationSetup.StreetByte_SSHFINGER,
                                     integrationSetup.StreetByte_FilePath + '\' +'geo-areas'+ '.txt',
                                     '/ <root>');

    end;
    procedure SendProdSubCat()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendProdSubCat: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        ProdSubCat:XmlPort "DW.Streetbyte.GeoAreas.XML";


    begin
        integrationSetup.get;
        if integrationSetup.streetbyte_ENABLED = false then exit;
        clear(ProdSubCat);
        tofiletext := 'product-sub-categories.txt';

        txtID := 'product-sub-categories';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendProdSubCat);
        ProdSubCat.SetDestination(SendProdSubCat);
        ProdSubCat.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup.StreetByte_FilePath + '\' + 'product-sub-categories'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup.StreetByte_Address,integrationSetup.StreetByte_User,
                                     integrationSetup.StreetByte_Password, integrationSetup.StreetByte_SSHFINGER,
                                     integrationSetup.StreetByte_FilePath + '\' +'product-sub-categories'+ '.txt',
                                     '/ <root>');

    end;





}