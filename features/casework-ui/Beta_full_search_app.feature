@Beta @fsa

Feature: full search application journey

As a land charges caseworker 
I want to be able to capture data for full search application requests that have been posted to LR
So that I can ensure that the search request details submitted can be correcly processed

Scenario: Basic Full search request journey
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
When I click on the name details tab I can enter six names
When I enter a county the details are displayed county edit box 
When I click the add additional county a new county edit box is displayed where I enter the next county
When I click continue the applicant details screen is displayed
And I can capture customer details on the full search screen
Then I can click the complete search button
And I can see search successful text 

Scenario: BUS-011 Capture details of customer who lodged a bankruptcy search request
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
When I click on the name details tab I can enter six names for a bankruptcy search
Then I click continue the applicant details screen is displayed
And I can see Applicant data input fields for the Bankruptcy search request

#EA: To be run/investigated as independent test on jenkins 
#Scenario: BUS-012 Capture details of full search request customer
#Given I am on the LR searches screen
#When I select an application type of Full Search the application is displayed
#And I am on the full search details screen
#When I enter Name in one of the fields on Input details page
#When I enter a county the details are displayed county edit box 
#When I click the add additional county a new county edit box is displayed where I enter the next county
#When I click continue the applicant details screen is displayed
#And I can capture customer details on the full search screen
#Then I can click the complete search button
#And I can validate customer details via the search api

Scenario: BUS-014 Return expected values associated with a key number for a Full search request
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I enter Names in all fields on Input details page
And I have verified the default value in Search Period From field
And I have verified the default value in Search Period To field
And I enter a county the details are displayed county edit box
And I click on continue button
When I enter valid values in Key number field
And I set the address type to Postal Address
Then I can see the expected values prepopulated in Applicant name field
And I can see the expected values prepopulated in Address field

Scenario: BUS-014 Do not return any values when invalid key number is entered for a Full search request
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I enter Names in all fields on Input details page
And I have verified the default value in Search Period From field
And I have verified the default value in Search Period To field
And I enter a county the details are displayed county edit box
And I click on continue button
When I enter an invalid value in Key number field
And I set the address type to Postal Address
Then I can see NO values prepopulated in Applicant name field

Scenario: BUS-015 Override despatch address associated with a key number displayed for a Full search
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I enter Names in all fields on Input details page
And I have verified the default value in Search Period From field
And I have verified the default value in Search Period To field
And I enter a county the details are displayed county edit box
And I click on continue button
When I enter valid values in Key number field
Then I can override it with new address details
And I set the address type to Postal Address
Then I can click the complete search button

Scenario: BUS-030 Verify that Counties free format field is ignored when All counties is selected in a Full search 
Given I am on the LR searches screen
And I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I enter Names in all fields on Input details page
And I click on continue button
And I can see Specify County error message flagged up
When I click box to search all counties 
Then I can confirm that the county edit box is disabled
And I click on continue button
And I can see Applicant data input fields for the Bankruptcy search request

Scenario: BUS-021 Reveal English equivalence of Welsh county names selected
Given I am on the LR searches screen
And I select an application type of Full Search the application is displayed
And I am on the full search details screen
When I select an application type of Full Search the application is displayed
When I click on the name details tab I can enter six names
When I enter a Welsh county name 
And I click on continue button
When I enter valid values in Key number field
And I set the address type to Postal Address
Then I can click the complete search button

Scenario: BUS-022 Certificate date for a full search stored in database should be in the past
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I enter Names in all fields on Input details page
When I enter a county the details are displayed county edit box 
And I click continue the applicant details screen is displayed
And I can capture customer details on the full search screen
When I can click the complete search button
Then I can confirm via api that certificate stored date is in the past

Scenario: BUS-020.1 Search expiry date stored for a full search is in the future
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I enter Names in all fields on Input details page
When I enter a county the details are displayed county edit box 
And I click continue the applicant details screen is displayed
And I can capture customer details on the full search screen
When I can click the complete search button
Then I can confirm via api that the expiry date stored is in the future

Scenario: BUS-141 Capture details of customer who lodged a bankruptcy search request by surname only
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
When I click on the name details tab I can enter the surname only
When I enter a county the details are displayed county edit box 
When I click the add additional county a new county edit box is displayed where I enter the next county
When I click continue the applicant details screen is displayed
And I can capture customer details on the full search screen
Then I can click the complete search button
And I can see Application Successful text on Search list page 

Scenario: BUS-082.6 Verify display of a stored Full searches 
Given I am on the LR searches screen																				
When I navigate to Full search store page
Then I can verify number of application stored before and after a Full search










