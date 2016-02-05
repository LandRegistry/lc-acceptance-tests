@cns

Feature: complex names within searches

As a land charges caseworker 
I want to be able to indicate that a name is complex through searches
So that I can see a list of complex and simple names that are associated to the input name

Scenario: using search facility within the land charges system indicate, search and return complex and simple names

#EA: Test below changing due to changes to screen journey. Review and scrap
#sh-us008 Full and bankruptcy searches
#Given I am on the bankruptcy searches screen
#When I select an application type of Search the application is displayed
#When a complex name checkbox is available I can click it to confirm that the input name is complex	
#When I can submit the completed search the complex name indicator is saved with all the search details	
#Then I can check the database to confirm the complex name setting

Scenario: #BUS-023.01 Verify all known complex name variations on a Full search
Given I am on the LR searches screen
When I select an application type of Full Search the application is displayed
And I am on the full search details screen
And I select Complex names from First name section
And I enter Complex name for the first name search
And I click on the first look up complex name link
Then I can see the Complex name results table
And I can confirm the exact variation of names for my first search name

Scenario: #BUS-023.02 Verify all known complex name variations on a Bankruptcy search
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
And I select Complex names from Second name section
And I enter Complex name for the second name search
And I click on the second look up complex name link
Then I can see the Complex name results table
And I can confirm the exact variation of names for my second search name


Scenario: #BUS-023.03 Verify that no name is returned if there is no known name variation on a Bankruptcy Complex name search 
Given I am on the LR searches screen
And I click to launch Bankruptcy search and select a record
And I am on the bankruptcy search details screen
And I select Complex names from Second name section
And I enter an unknown Complex name for the second name search
And I click on the second look up complex name link
Then I can see the Complex name results pop up
And I can confirm there is no match for the second name search

