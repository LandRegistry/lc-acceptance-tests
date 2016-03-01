@bcap

Feature: cancellation application process

As a land charges caseworker
I want to be able to retrieve or submit a cancellation application data
So that I can be sure that details are correctly entered onto the land charges register

Scenario: #BUS-067.00 View cancellation form image
Given I launch Application Cancellation page
When I select the first registration application
When I am on a Large image I can zoom in
When I am on a Large image I can zoom out
When I must have a registration number value before the continue button can be clicked
Then I can click the continue button to go to the next screen

Scenario: BUS-068 Retrieve and validate a newly submitted application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I parse the new registration number as Original registration number
Then I can retrieve the application details with valid data submitted


Scenario: BUS-073 Cancel a new Bankruptcy application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I parse the new registration number as Original registration number
When I can retrieve the application details with valid data submitted
Then I can submit conveyancer details


Scenario: BUS-071/73.1 Confirm that a Bankruptcy application cannot be cancelled twice
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
When I attempt to resubmit a cancelled new application number
Then I will still be on the application retrieval page
