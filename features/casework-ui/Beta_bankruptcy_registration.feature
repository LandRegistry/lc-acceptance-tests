@Beta @breg

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a bankruptcy application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: BUS-045 View images of bankruptcy registration forms 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I click on a thumbnail the image is expanded to large image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-045 View single image on a bankruptcy registration screen
Given I am on the bankruptcy registration screen
When I select an application type of WOB with a single image
And I should not see the thumbnail on the image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-046 #BUS-043 #BUS-042 #BUS-132 #BUS-131 Input bankruptcy registration deatils
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I enter case year the details are visible
Then I can click on Continue button to submit the form

Scenario: #BUS-132 #BUS-131 Input particulars of debtor
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I enter case year the details are visible
When I can click on Continue button to submit the form
When I can confirm that I am on the debtors details screen 
When I enter debtors name the details are visible
When I enter occupation the details are visible
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the second AKA the details are visible
When I enter the address the details are visible
When I click to add additional address new fields are visible
And can be completed
Then I can click on Continue button to submit the form

Scenario: #BUS-139 #BUS-130 #BUS-038 #BUS-053 Verify mandatory two stage name re-entry when completing a bankruptcy registration application 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I enter case year the details are visible
When I can click on Continue button to submit the form
When I can confirm that I am on the debtors details screen 
When I enter debtors name the details are visible
When I enter occupation the details are visible
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the address the details are visible
When I can click on Continue button to submit the form
When I am on the verification screen I can rekey debtor's name
When I am on the verification screen I can change debtor's AKA name
When I am on the verification screen I can rekey debtor's AKA name
When I am on the verification screen I can rekey court name
When I am on the verification screen I can view reference numbers
When I can click on Continue button to submit the form
When I am on the Court screen I can enter a valid key number
When I can click the complete search button
Then the susuccessfully completed Registration number is banner is displayed



