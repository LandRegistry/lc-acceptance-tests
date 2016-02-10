@bsai

Feature: search application image

As a land charges caseworker 
I want to be able to view an image of a bankruptcy search request that has been posted to LR
So that I can ensure that the search request details are captured and processed correctly

#Scenario: Using the bankruptcy searchs task on the  Land Charges system

##SH-US002 Bankruptcy Search - View Postal Search
#Given I am on the bankruptcy searches screen
#When I select an application type of Search the application is displayed
#When the image of the search application is displayed I can click on all available pages
##When I click on a thumbnail the image is expanded to large image
#When I am on a Large image I can zoom in
#Then I am on a Large image I can zoom out

##SH-US003 Bankruptcy Search - Capture Customer Details
#Given I am on the bankruptcy search details screen
#When I click on the name details tab I can enter six names for a bankruptcy search
#When I click continue the applicant details screen is displayed
#And I click on the Pre paid button
#When I am on the Application complete screen a new record is stored on the register database in the correct format
#When I can click the complete search button
#Then the user can return to the worklist

#Scenario: BUS-013 Return expected values associated with a key number for a Bankruptcy search request
#Given I am on the LR searches screen
#And I click to launch Bankruptcy search and select a record
#And I am on the bankruptcy search details screen
#And I enter Names in all fields on Input details page
#And I click on continue button
#When I enter valid values in Key number field
#Then I can see the expected values prepopulated in Applicant name field
##And I can see the expected values prepopulated in Address field

#Scenario: BUS-013 Do not Return any values when invalid key number is entered for a Bankruptcy search request
#Given I am on the LR searches screen
#And I click to launch Bankruptcy search and select a record
#And I am on the bankruptcy search details screen
#And I enter Names in all fields on Input details page
#And I click on continue button
#When I enter invalid values in Key number field
#Then I can see NO values prepopulated in Applicant name field

#Scenario: BUS-016 Override despatch address associated with a key number displayed for a Bankruptcy search
#Given I am on the LR searches screen
#And I click to launch Bankruptcy search and select a record
#And I am on the bankruptcy search details screen
#And I enter Names in all fields on Input details page
#And I click on continue button
#When I enter valid values in Key number field
#Then I can override it with new address details
#Then I can click the complete search button






