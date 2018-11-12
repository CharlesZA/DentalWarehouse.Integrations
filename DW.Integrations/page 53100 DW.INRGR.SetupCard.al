page 53100 "DW.INTGR.SetupCard"
{

    PageType = Card;
    SourceTable = "DW.INTGR.Setup";
    Caption = 'DW.INTGR.SetupCard';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("PrimaryKey"; "PrimaryKey")
                {
                    ApplicationArea = All;
                }
            }
            group(BIDVEST)
            {
                field(BIDVEST_IP; BIDVEST_IP) { }
                field(BIDVEST_PORT; BIDVEST_PORT) { }
                field(BIDVEST_USER; BIDVEST_USER) { }
                field(BIDVEST_PASSWORD; BIDVEST_PASSWORD) { }
                field(BIDVEST_ENABLED; BIDVEST_ENABLED) { }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(LockRecord)
            {
                Caption = 'Lock Record';
                Image = Lock;
                trigger OnAction()
                begin
                    Rec.Locked := true;
                    Modify(false);
                end;
            }
            action(UnLockRecord)
            {
                Caption = 'Unlock Record';
                Image = ReOpen;
                trigger OnAction()
                begin
                    Rec.Locked := false;
                    Modify(false);
                end;
            }
        }
    }
    trigger OnOpenPage();
    begin
        // Make sure there is a record, otherwise create it and set defaults.
        if Rec.get() = false then begin
            Rec.INIt;
            Rec.SetupDefaults();
            Rec.Insert(FALSE);
        end;
    end;

}
