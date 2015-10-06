@sai

Feature: search application image

As a land charges caseworker 
I want to be able to view an image of a bankruptcy search request that has been posted to LR
So that I can ensure that the search request details are captured and processed correctly

Scenario: Using the bankruptcy searchs task on the  Land Charges system

#SH-US002 Bankruptcy Search - View Postal Search
Given I am on the bankruptcy searches screen
When I select an application type of Search the application is displayed
When the image of the search application is displayed I can click on all available pages
When I click on a page the image it is visible
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

#SH-US003 Bankruptcy Search - Capture Customer Details
Given I am on the bankruptcy search details screen
When I click on the name details tab I can enter six names
When I click on the Customer details tab I can enter the key number Customer Name Customer Address Customer Reference
When I can click the complete search button
When the application has been submitted a confirmation screen is displayed
Then the user can return to the worklist from the bankruptcy search complete screen









