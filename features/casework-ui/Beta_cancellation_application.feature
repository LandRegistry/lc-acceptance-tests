@bcap

Feature: cancellation application process

As a land charges caseworker
I want to be able to retrieve or submit a cancellation application data
So that I can be sure that details are correctly entered onto the land charges register

Scenario: #BUS-067.00 View K11 cancellation form image
Given I launch Application Cancellation page
When I select the first registration application
When I am on a Large image I can zoom in
When I am on a Large image I can zoom out
When I must have a registration number value before the continue button can be clicked
Then I can click the continue button to go to the next screen

Scenario: #BUS-148 View K13 cancellation form image
Given I launch Application Cancellation page
When I select a K13 registration application
When I am on a Large image I can zoom in
When I am on a Large image I can zoom out
When I must have a registration number value before the continue button can be clicked
Then I can click the continue button to go to the next screen

Scenario: BUS-068 Retrieve and validate a newly submitted PAB application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I parse the new registration number as Original registration number
Then I can retrieve the application details with valid data submitted

Scenario: BUS-073 Cancel a new PAB Bankruptcy application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I parse the new registration number as Original registration number
When I can retrieve the application details with valid data submitted
Then I can click button to continue

Scenario: BUS-071/73.1 Confirm that a PAB Bankruptcy application cannot be cancelled twice
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I attempt to resubmit a cancelled new application number
Then I will still be on the application retrieval page

Scenario: BUS-068 Retrieve and validate a newly submitted WOB application
Given I am on the bankruptcy registration screen
And I select an application type of WOB with a single image
When I parse the new registration number as Original registration number
Then I can retrieve the application details with valid data submitted

Scenario: BUS-073 Cancel a new WOB Bankruptcy application
Given I am on the bankruptcy registration screen
And I select an application type of WOB with a single image
When I parse the new registration number as Original registration number
And I can retrieve the application details with valid data submitted
Then I can click button to continue

Scenario: BUS-071/73.1 Confirm that a Bankruptcy application cannot be cancelled twice
Given I am on the bankruptcy registration screen
And I select an application type of WOB with a single image
When I attempt to resubmit a cancelled new application number
Then I will still be on the application retrieval page

Scenario: BUS-073/147 A part bankruptcy application cannot be cancelled 
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I parse the new registration number as Original registration number
Then I cannot retrieve the application details with Part Cancelation option selected
And I will still be on the application retrieval page

Scenario: BUS-073 API verification of cancelled registration 
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
Then I can verify API output for a cancelled PAB application

Scenario: BUS-171  Select part cancellation option 
Given I launch Application Cancellation page
When I select the first registration application
And I select part cancellation option
Then I can click button to continue

Scenario: BUS-160/171.0 Part cancellation with plan attached
Given I have selected to view a specific Land Charges application from the application list
And I submit input details for land charge registration
And I parse a new land charge registration for cancellation
And I select part cancellation option
And I can click button to continue
And I can opt to confirm plan attached
And I can enter additional information
And I can click button to continue
Then I can submit conveyancer details for the part cancellation
And I submit the data

Scenario: BUS-160/171.0 Part cancellation without plan attached selecting a C4 or D2
Given I have selected to view a specific Land Charges application from the application list
And I submit input details for land charge registration
And I parse a new land charge registration for cancellation
And I select part cancellation option
And I can click button to continue
And I can enter additional information
And I can click button to continue
Then I can submit conveyancer details for the part cancellation
And I submit the data

#EA:Data dependant test. To be reviewed with IH. Same reg number needed for this test
#Scenario: Part cancellation with a C4 option 
#Given I launch Application Cancellation page
#And I select the first registration application
#And I select part cancellation option
#And I can click button to continue
#And I choose the C4 cancellation option
#When I can click button to continue
#Then I can enter additional information
#And I can attach a file
#And I can click button to continue
#And I can submit conveyancer details

Scenario: BUS-082 Store application record on original details page of an amendment
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I parse the new registration number as Original registration number
And I can retrieve the application details with valid data submitted
And I can click button to continue
And I am on the Court screen I can enter a valid key number
When I select option to return to the application later
Then I am on Store application page
And I can enter a reason
And I can click to store the reason

Scenario: BUS-082 Store application record on View and Cancel page of cancellation journey
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I parse the new registration number as Original registration number
And I can retrieve the application details with valid data submitted
When I select option to return to the application later
Then I am on Store application page
And I can enter a reason
And I can click to store the reason

#REQUIRED BUT NOT YET IMPLEMENTED
#Scenario: BUS-082.0 Store application record on conveyancer and fees page of cancellation journey
#Given I am on the bankruptcy registration screen
#And I select an application type of PAB with a single image
#And I parse the new registration number as Original registration number
#And I can retrieve the application details with valid data submitted
#And I can click button to continue
#And I am on the Court screen I can enter a valid key number
#When I select option to return to the application later
#Then I am on Store application page
#And I can enter a reason
#And I can click to store the reason



