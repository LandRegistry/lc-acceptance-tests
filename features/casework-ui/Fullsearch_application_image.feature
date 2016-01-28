@fsai

Feature: search application image

As a land charges caseworker 
I want to be able to view an image of a bankruptcy full search request that has been posted to LR
So that I can ensure that the search request details are captured and processed correctly

Scenario: Using the bankruptcy searchs task on the  Land Charges system

#SH-US018 Full search - View Postal Search
Given I am on the bankruptcy searches screen
When I select an application type of Full Search the application is displayed
When I click on a thumbnail the image is expanded to large image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

#SH-US019 - Full Search - Capture Customer Details
Given I am on the full search details screen
When I access the application screen a dropdown list is visible for categories of name type
When I click on the name details tab I can enter six names
When I click box to search all counties the county edit box is disbled
When I click continue the applicant details screen is displayed
When I click on entered details in the address box I can make an amendment
When I enter fee details I can choose prepaid
And I change it to choose direct debit
When I can click the complete search button
When I am on the Application complete screen
Then the user can return to the worklist

#Given I am on the full search details screen
When I select an application type of Full Search the application is displayed
When I click on the name details tab I can enter six names
When I enter a county the details are displayed county edit box 
When I click the add additional county a new county edit box is displayed where I enter the next county
When I click continue the applicant details screen is displayed
When I click on entered details in the address box I can make an amendment
When I enter fee details I can choose prepaid
When I can click the complete search button
When I am on the Application complete screen
Then the user can return to the worklist