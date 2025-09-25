Scriptname SQK_randomizer extends ReferenceAlias  


GlobalVariable property _SQK_CanBeApproachedBQ01 auto
GlobalVariable property _SQK_CanBeApproachedBQ02 auto
Keyword property LocTypeInn auto
Quest Property BQ01 auto
Quest Property BQ02 auto

; Roll for quest approachability and update corresponding global variable
Function RollForQuestApproachability(Quest questToCheck, GlobalVariable approachabilityGlobal, String questName)
    if(!questToCheck.IsRunning() || questToCheck.GetStage() == 0)
        ;Debug.Notification(questName + " is not started/completed, rolling for approachability") ;DEBUG
        int roll = Utility.RandomInt(1,2) ; 50% chance

        if roll == 1
            approachabilityGlobal.SetValue(1)
            ;Debug.Notification("Roll: " + roll + " You can be approached for " + questName) ;DEBUG
        Else
            approachabilityGlobal.SetValue(0)
            ;Debug.Notification("Roll: " + roll + " You cannot be approached for " + questName) ;DEBUG
        endif
    endif
EndFunction


Event Oninit()
    Debug.Notification("Situational Quest Kickoffs Initialized") ;DEBUG
endEvent



Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if(akOldLoc != akNewLoc && !akOldLoc.HasKeyword(LocTypeInn) && !akNewLoc.HasKeyword(LocTypeInn)) ; When is not in an inn to prevent package malfunction/exploiting
        RollForQuestApproachability(BQ01, _SQK_CanBeApproachedBQ01, "BQ01")
        RollForQuestApproachability(BQ02, _SQK_CanBeApproachedBQ02, "BQ02")
    Endif
endEvent