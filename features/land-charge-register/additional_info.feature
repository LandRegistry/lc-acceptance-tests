@addlinfo

Feature: View additional information

Scenario: Additional Information

  Given an existing C1 registration
  When I part cancel the registration with "Plan attached" set to "the land edged red"
  Then the original registration's additional information will read "PART CAN [NEW_REGNO] REGD [NEW_DATE] SO FAR ONLY AS IT RELATES TO THE LAND EDGED RED AS DESC ON APPN TO CANCEL."
    And the new registration is not revealed

  Given an existing C1 registration
  When I part cancel the registration with "part cancelled" set to "the front garden"
  Then the original registration's additional information will read "PART CAN [NEW_REGNO] REGD [NEW_DATE] SO FAR ONLY AS IT RELATES TO THE FRONT GARDEN BEING PART OF LAND REGD."
    And the new registration is not revealed

  Given an existing C1 registration with a short description of "The Yellow House"
  When I rectify the short description to "The Green Bungalow"
  Then the original registration is updated
    And the original registration's additional information will read "SHORT DESCRIPTION RECTIFIED FROM THE YELLOW HOUSE BY [NEW_REGNO] REGD [NEW_DATE]."

  Given an existing C1 registraton with a district of "The South Hams"
  When I rectify the district to "Nine"
  Then the original registration is updated
    And the original registration's additional information will read "DISTRICT RECTIFIED FROM THE SOUTH HAMS BY [NEW_REGNO] REGD [NEW_DATE]."

  Given an existing C1 registration with a name of "John William Smith"
  When I rectify the name to "Johannes Wilhelm Schmidt"
  Then a new registration is created
    And the new registration's additional information will read "NAME PREVIOUSLY REGISTERED AS JOHN WILLIAM SMITH UNDER [ORIG_REGNO] REGD [ORIG_DATE]."
    And the original registration's additional information will read "NAME RECTIFIED TO JOHANNES WILHELM SCHMIDT BY [NEW_REGNO] REGD [NEW_DATE]."

  Given an existing C1 registration with a county of "Devon"
  When I rectify the county to "Dorset"
  Then a new registration is created
    And the new registration's additional information will read "COUNTY PREVIOUSLY REGD AS DEVON UNDER [ORIG_REGNO] REGD [ORIG_DATE]."
    And the original registration is not revealed

  Given an existing C1 registration with a county of "Devon"
  When I rectify with an additional county of "Dorset"
  Then a new registration is created
    And the new registration's additional information will read "PREVIOUSLY REGISTERED ONLY IN COUNTY OF DEVON UNDER [ORIG_REGNO] REGD [ORIG_DATE]."
    And the original registration's additional information will read "CHARGE PREVIOUSLY REGD SOLELY UNDER COUNTY OF DEVON NOW REGD IN ADDITIONAL COUNTY OF DORSET BY [NEW_REGNO] REGD [NEW_DATE]."

  Given an existing C1 registration
  When I rectify the date of instrument from "2014-01-02" to "2015-02-03"
  Then the original registration is updated
    And the original registration's addtional information will read "DATE OF INSTRUMENT RECTIFIED FROM 02/01/2014 TO 03/02/2015 BY [NEW_REGNO] REGD [NEW_DATE]."

  Given an existing C1 registration
  When I rectify the chargee from "Messrs Tim and Bob" to "Messrs Tim, Bob and Sam"
  Then the original registration is updated
    And the original registration's addtional information will read "CHARGEE RECTIFIED TO MESSRS TIM, BOB AND SAM FROM MESSRS TIM AND BOB BY [NEW_REGNO] REGD [NEW_DATE]."

  Given an existing C1 registration
  When I rectify the class of charge to "C2"
  Then a new registration is created
    And the new registration's additional information will read "CLASS OF CHARGE PREVIOUSLY REGD AS C1 UNDER [ORIG_REGNO] REGD [ORIG_DATE]."
    And the original registration is not revealed

  Given an existing WO registration
  When I renew the registration
  Then a new registration is created
    And the original registration's additional information will read "RENEWED BY [NEW_REGNO] REGD [NEW_DATE]"
    And the new registration's additional information will read "RENEWAL OF [ORIG_REGNO] REGD [ORIG_DATE]"

  Given an existing PAB and WOB registration with court details of "Plymouth County Court" ref "100 of 2016"
  When I amend the WOB's address
  Then a new registration is created
    And the new registration's additional information will read "PLYMOUTH COUNTY COURT NO 100 OF 2016 THIS REGISTRATION AMENDS [ORIG_WOB_REGNO] DATED [ORIG_WOB_DATE] & [ORIG_PAB_REGNO] DATED [ORIG_PAB_DATE]."
    And the original registration is not revealed

  Given an existing PAB and WOB registration with court details of "Plymouth County Court" ref "100 of 2016"
  When I amend the WOB's debtor name to "William Smith"
  Then a new registration is created
    And the new registration's additional information will read "PLYMOUTH COUNTY COURT NO 100 OF 2016 THIS REGISTRATION AMENDS [ORIG_WOB_REGNO] DATED [ORIG_WOB_DATE] & [ORIG_PAB_REGNO] DATED [ORIG_PAB_DATE]."
    And the original registration's additional information will read "PLYMOUTH COUNTY COURT NO 100 OF 2016 NAME OF DEBTOR AMENDED TO WILLIAM SMITH BY [NEW_REGNO] REGD [NEW_DATE]."
