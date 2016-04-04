@Beta @bsa

Feature: bankruptcy search application journey

As a land charges caseworker 
I want to be able to capture data for bankruptcy search application requests that have been posted to LR
So that I can ensure that the search request details submitted can be correcly processed

Scenario: Basic bankruptcy research journey 
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
And I enter Names in all fields on Input details page
And I click on continue button
And I can capture customer details on the full search screen
Then I can click the complete search button
And I can see Application Successful text on Search list page 

Scenario: BUS-013 Return expected values associated with a key number for a Bankruptcy search request
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
And I enter Names in all fields on Input details page
And I click on continue button
When I enter valid values in Key number field
Then I can see the expected values prepopulated in Applicant name field
And I can see the expected values prepopulated in Address field

Scenario: BUS-013 Do not Return any values when invalid key number is entered for a Bankruptcy search request
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
And I enter Names in all fields on Input details page
And I click on continue button
When I enter invalid values in Key number field
Then I can see NO values prepopulated in Applicant name field

Scenario: BUS-016 Override despatch address associated with a key number displayed for a Bankruptcy search
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
And I enter Names in all fields on Input details page
And I click on continue button
When I enter valid values in Key number field
Then I can override it with new address details
Then I can click the complete search button

#EA: Works and passes on wifi but fails on jenkins. Parametize api on jenkins/preview
#Scenario: BUS-020 Certificate date stored for a bankruptcy search is in the past 
#Given I am on the LR searches screen
#And I click to launch Bankruptcy search and select a record
#And I am on the bankruptcy search details screen
#And I enter Names in all fields on Input details page
#And I click on continue button
#And I enter valid values in Key number field
#And I enter fee details I can choose prepaid
#When I can click the complete search button
#Then I can confirm via api that certificate stored date is in the past





