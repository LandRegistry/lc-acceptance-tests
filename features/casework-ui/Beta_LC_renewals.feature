@Beta @lcrn

Feature: Land charge renewals

As a Land Charges Caseworker
I want to be able to be able to capture renewal application details
So that I can submit the details presented

Scenario: BUS-144/087 View images and submit conveyancer details for LC renewals 
Given I have selected to view a specific Land Charges application from the application list
And I submit input details for land charge registration
#When I parse a Land Charge application details for renewal 
#Then I am on a Large image I can zoom in
#And I am on a Large image I can zoom out

Scenario: BUS-145 Submit conveyancer details 
Given I have selected to view a specific Land Charges application from the application list
And I submit input details for land charge registration
#Defect: No.71 logged as conveyancer details not pre-populating
#When I parse a Land Charge application details for renewal 
#Then I can click on Continue button to submit the form
#And I am on Conveyancer page
#Defect: No.71 logged as conveyancer details not pre-populating
#And I can submit conveyancer details for the renewal
#And I submit the data
#And I can see the application successful message 




