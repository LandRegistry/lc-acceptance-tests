@cnr

Feature: complex names within searches

As a land charges caseworker 
I want to be able to indicate that a name is complex through bankruptcy registration
So that I can see a list of complex and simple names that are associated to the input name

Scenario: using search facility within the land charges system indicate, search and return complex and simple names

#sh-us008 Full and bankruptcy searches
Given I am on the view application screen
When I have selected to view specific the application list
When I click on the enter a complex name link a new screen is displayed
When the complex name field is completed I can then click the search name button
When the list on complex names is displayed I can select one 
Then I can click the continue button to go to the next screen

Given I am on the debtors address screen
When I supply the address details in the address fields they remain visible
When I click the add address button the address is added to the top of the screen
When I supply additional address details 
When I click the add address button the address is added to the top of the screen
Then I can click the continue button to go to the next screen

Given I am on the case information screen
When I first see the class of charge neither PAB or WOB are checked
When I select a Class of Charge of PAB this becomes checked
Then I select a Class of Charge of WOB this becomes checked and PAB becomes unchecked

Given I am on the case information screen
When I enter a court name the details remain visible
When I enter a court number and year the details remain visible
Then I click the submit button and the application complete screen is displayed

Given I am on the Application complete screen
When the Application has been submitted the unique identifier is displayed to the user on the screen
And the Application has been submitted the date is displayed to the user on the screen
Then the user can return to the worklist

Then I can check the database to confirm the complex name setting