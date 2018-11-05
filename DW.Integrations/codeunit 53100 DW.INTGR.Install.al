/// This codeunit is responsible for installing the extension to the database.

codeunit 53100 "DW.INTGR.Install"
{
    Subtype = Install;
    Description = 'Extension Install Codeunit';

    trigger OnInstallAppPerCompany()
    begin
        // Code for company related operations
    end;

    trigger OnInstallAppPerDatabase()
    var
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo); // Get info about the currently executing module

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
            HandleFreshInstall
        else
            HandleReinstall; // If not a fresh install, then we are Re-installing the same version of the extension
    end;

    local procedure HandleFreshInstall();
    var
        //integrationSetup:Record"NAC.IBMNAV.Setup";
        sourceCode: Record "Source Code";
        sourceCodeSetup: Record "Source Code Setup";
        company: Record "Company";
    begin
        // Do work needed the first time this extension is ever installed for this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was install
        // - Initial data setup for use

        SetupDefaultRolesAndPermissions();

        if company.FindFirst() then begin
            repeat

            // integrationSetup.ChangeCompany(company.Name);              
            // integrationSetup.init;
            // integrationSetup.SetupDefaults();
            // integrationSetup.Insert(false);

            // sourceCode.ChangeCompany(company.Name);
            // sourceCode.Init;
            // sourceCode.Code := 'DW.INTGR';
            // sourceCode.Description := 'DW.INTGR Transactions';
            // if sourceCode.Insert(false) then begin end;

            // sourceCodeSetup.ChangeCompany(company.Name);
            // if sourceCodeSetup.get() then begin
            //     sourceCodeSetup."DW.INTGR" := 'DW.INTGR';
            //     sourceCodeSetup.Modify(false);
            // end;
            until company.Next = 0;
        end;
    end;

    local procedure HandleReinstall();
    begin
        // Do work needed when reinstalling the same version of this extension back on this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was reinstalled
        // - Data 'patchup' work, for example, detecting if new 'base' records have been changed while you have been working 'offline'.
        // - Setup 'welcome back' messaging for next user access.
    end;

    local procedure SetupDefaultRolesAndPermissions()
    var
        userGroup: Record "User Group";
        userGroupPermissionSet: Record "User Group Permission Set";
    begin

    end;

}