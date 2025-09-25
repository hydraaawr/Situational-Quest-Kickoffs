Scriptname SQK_randomizer extends ReferenceAlias  


GlobalVariable property _SQK_CanBeApproachedBQ01 auto
GlobalVariable property _SQK_CanBeApproachedBQ02 auto
GlobalVariable property _SQK_CanBeApproachedBQ03 auto
GlobalVariable property _SQK_CanBeApproachedBQ04 auto
Keyword property LocTypeInn auto
Quest Property BQ01 auto



Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if(akOldLoc != akNewLoc && !akOldLoc.HasKeyword(LocTypeInn) && !akNewLoc.HasKeyword(LocTypeInn)) ; When is not in an inn to prevent package malfunction/exploiting
        if(!BQ01.IsRunning() || BQ01.GetStage() == 0) ; If BQ01 is not started or completed
            Debug.Notification("BQ01 is started/completed, rolling for approachability") ;DEBUG
            int RollBQ01 = Utility.RandomInt(1,2) ; 50% chance

            if RollBQ01 == 1
                _SQK_CanBeApproachedBQ01.SetValue(1)
                Debug.Notification("Roll: " + RollBQ01 + " You can be approached for BQ01") ;DEBUG
            Else
                _SQK_CanBeApproachedBQ01.SetValue(0)
                Debug.Notification("Roll: " + RollBQ01 + " You cannot be approached for BQ01") ;DEBUG
            endif
        endif
    Endif

endEvent