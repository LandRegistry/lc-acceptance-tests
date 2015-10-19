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
Given I am on the bankruptcy full search details screen
When I click on the name details tab I can enter six names
When I click in the search to field I can add the current year
When I click on the Customer details tab I can enter the key number Customer Name Customer Address Customer Reference
When I click on entered details in the address box I can make an amendment
When I click on the search areas tab all counties check box search area  List of Areas to search is displayed
When I can click the complete search button when the customer address field is complete
When I am on the Application complete screen
When the user can return to the worklist
When I select an application type of Full Search the application is displayed
When I click on the name details tab I can enter six names
When I click on the Customer details tab I can enter the key number Customer Name Customer Address Customer Reference
When I click on entered details in the address box I can make an amendment
When I click on the search areas tab all counties check box search area  List of Areas to search is displayed
When I enter details into the search area edit box I can click on the add area button
When add area button is clicked the search area details are added to the List of areas to search box
When I click on entered details in the list of areas search box I can make an amendment
When I can click the complete search button when the customer address field is complete
When I am on the Application complete screen
Then the user can return to the worklist