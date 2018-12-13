
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
        //order taken by : SendUsers
        //warehouse master : SendLocations
        //Product Master : SendItemMaster
        //Customer Groups : SendCustomerGroups
        //Stock Master
        //Sales-Invoices
        
      //dentsply  - Excluded from current Phase - Eric.
      
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
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(SALESREPS);
        tofiletext := 'rep-names.txt';

        txtID := 'reps';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendSalesReps);
        SALESREPS.SetDestination(SendSalesReps);
        SALESREPS.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'rep-names'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'rep-names'+ '.txt',
                                     integrationSetup."StreetByte Destination");

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
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(Customers);
        tofiletext := 'customer-master.txt';

        txtID := 'cust';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendCustomers);
        Customers.SetDestination(SendCustomers);
        Customers.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'customer-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'customer-master'+ '.txt',
                                     integrationSetup."StreetByte Destination");

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
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(ProdCats);
        tofiletext := 'product-categories.txt';

        txtID := 'pcat';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendProdCat);
        ProdCats.SetDestination(SendProdCat);
        ProdCats.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'product-categories'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'product-categories'+ '.txt',
                                     integrationSetup."StreetByte Destination");

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
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(ProdCats);
        tofiletext := 'supplier-master.txt';

        txtID := 'supps';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendSuppliers);
        ProdCats.SetDestination(SendSuppliers);
        ProdCats.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'supplier-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'supplier-master'+ '.txt',
                                     integrationSetup."StreetByte Destination");

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
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(GeoAreas);
        tofiletext := 'geo-areas.txt';

        txtID := 'geos';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendGeoArea);
        GeoAreas.SetDestination(SendGeoArea);
        GeoAreas.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'geo-areas'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'geo-areas'+ '.txt',
                                     integrationSetup."StreetByte Destination");

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
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(ProdSubCat);
        tofiletext := 'product-sub-categories.txt';

        txtID := 'psubcat';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendProdSubCat);
        ProdSubCat.SetDestination(SendProdSubCat);
        ProdSubCat.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'product-sub-categories'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'product-sub-categories'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;

procedure SendUsers()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendUser: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        ProdSubCat:XmlPort "DW.Streetbyte.Users.XML";


    begin
        integrationSetup.get;
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(ProdSubCat);
        tofiletext := 'order-taken-by.txt';

        txtID := 'users';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendUser);
        ProdSubCat.SetDestination(SendUser);
        ProdSubCat.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'order-taken-by'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'order-taken-by'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;

procedure SendLocations()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendLocation: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        Locations:XmlPort "DW.Streetbyte.Locations.XML";


    begin
        integrationSetup.get;
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(Locations);
        tofiletext := 'warehouse-master.txt';

        txtID := 'locs';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendLocation);
        Locations.SetDestination(SendLocation);
        Locations.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'warehouse-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'warehouse-master'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;

procedure SendItemMaster()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendItem: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        Items:XmlPort "DW.Streetbyte.ProdMaster.XML";


    begin
        integrationSetup.get;
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(Items);
        tofiletext := 'product-master.txt';

        txtID := 'prods';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(Senditem);
        Items.SetDestination(Senditem);
        Items.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'product-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'product-master'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;

    
procedure SendCustomerGroups()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendCustGroup: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        CustomerGrps:XmlPort "DW.Streetbyte.CustGroup.XML";


    begin
        integrationSetup.get;
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(CustomerGrps);
        tofiletext := 'customer-groups.txt';

        txtID := 'cgroups';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendCustGroup);
        CustomerGrps.SetDestination(SendCustGroup);
        CustomerGrps.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'customer-groups'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'customer-groups'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;

      
procedure SendStockMaster()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendSTockMast: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        SendSTockMasters:XmlPort "DW.Streetbyte.StockMaster.XML";


    begin
        integrationSetup.get;
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(SendSTockMasters);
        tofiletext := 'stock-master.txt';

        txtID := 'smaster';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendSTockMast);
        SendSTockMasters.SetDestination(SendSTockMast);
        SendSTockMasters.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'stock-master'+ '.txt', true);

        processBlob.get(txtID);
        processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'stock-master'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;



procedure SendSalesinvoices()
    var
        integrationSetup: Record "DW.INTGR.Setup";
        SendInvlines: OutStream;
        tofiletext: Text;
        requestpagexml: Text;
        processBlob: Record "DW.INTGR.ProcessBlob";
        txtID: code[20];
        sftpintegration: Codeunit "SFTP Outbound Integration";
        SendSINVLines:XmlPort "DW.Streetbyte.Sinvlines.XML";


    begin
        integrationSetup.get;
        if integrationSetup."streetbyte ENABLED" = false then exit;
        clear(SendSINVLines);
        tofiletext := 'sales-invoices.txt';

        txtID := 'SINVS';
        IF processBlob.Get(txtID) then processBlob.Delete(FALSE);
        processBlob.init;
        processBlob.PrimaryKey := txtID;
        processBlob.Insert(false);

        processBlob.CalcFields(TempBlob);
        processBlob.TempBlob.CreateOutStream(SendInvlines);
        SendSINVLines.SetDestination(SendInvlines);
        SendSINVLines.Export();
        processBlob.Modify(FALSE);
        processBlob.ExportToServerFile(integrationSetup."StreetByte FilePath" + '\' + 'sales-invoices'+ '.txt', true);

        processBlob.get(txtID);
        //processBlob.Delete(false);

        // add ftp function call here
        sftpintegration.SFTPSENDFILE(integrationSetup."StreetByte Address",integrationSetup."StreetByte User",
                                     integrationSetup."StreetByte Password", integrationSetup."StreetByte SSHFINGER",
                                     integrationSetup."StreetByte FilePath" + '\' +'sales-invoices'+ '.txt',
                                     integrationSetup."StreetByte Destination");

    end;



}