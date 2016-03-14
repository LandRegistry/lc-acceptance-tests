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

Scenario: BUS-086 Cancel a C4 entry without a D2 cancellation
Given I launch Application Cancellation page
And I select the first registration application
And I select part cancellation option
And I can click button to continue
When I choose the C4 cancellation option
And I can click button to continue
And I can click button to continue
Then I can submit conveyancer details

#BA confirmed this is not a requirement but check impact on system
Scenario: Cancel a D2 entry 
Given I launch Application Cancellation page
And I select the first registration application
And I select part cancellation option
And I can click button to continue
When I choose the D2 cancellation option
And I can click button to continue
And I can click button to continue
Then I can submit conveyancer details

Scenario: Submit a C4 cancellation with additional information
Given I launch Application Cancellation page
And I select the first registration application
And I select part cancellation option
And I can click button to continue
And I choose the C4 cancellation option
When I can click button to continue
Then I can enter additional information
And I can attach a file
And I can click button to continue
And I can submit conveyancer details






