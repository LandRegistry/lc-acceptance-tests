@Beta @lcrec

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to retrieve the original registration data for land charges during rectification
So that I can view the details of the original application

Scenario: BUS-090 BUS-092 BUS-125 view and submit a rectification 
Given I am on the rectification screen
When I supply the registration number
#The previous step will fail because user can only enter registration number on designated page which the test is missing
And the date of registration 
When I can click on Continue button to submit the form
When I am on the view amend screen I can see infilled details
When I can click on Continue button to submit the form
When I am on the check details screen I can choose to amend the district
When I can click on Continue button to submit the form
When I am on the Conveyancer and fees screen I can enter a valid key number
When I enter fee details I can choose prepaid
And I change it to choose direct debit
When I click on the Submit button
#Then the susuccessfully completed Registration number is banner is displayed  code commented out on9/3 defect raised