@Beta @lcrn

Feature: Land charge renewals

As a Land Charges Caseworker
I want to be able to be able to capture renewal application details
So that I can submit the details presented

Scenario: BUS-144 View renewals images
Given I am on the Land Charges renewal applications screen
When I select an application from the first row
#Then I am on a Large image I can zoom in
#And I am on a Large image I can zoom out


Scenario: BUS-145/087 Submit conveyancer details 
Given I am on the Land Charges renewal applications screen
When I select an application from the first row
#And I am on the Application retrieval screen
#And I can retrieve the Renewal application details with valid data submitted
#And I can validate data presented on Original Registration details page
#And I can click button to continue
#And I am on Conveyancer page
#When I can submit conveyancer details
#Then I can see the application successful text displayed on land charges renewal application screen



