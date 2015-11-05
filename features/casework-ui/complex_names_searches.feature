@cns

Feature: complex names within searches

As a land charges caseworker 
I want to be able to indicate that a name is complex
So that I can see a list of complex and simple names that are associated to the input name

Scenario: using search facility within the land charges system indicate, search and return complex and simple names

#sh-us008 Full and bankruptcy searches
Given I am on the bankruptcy searches screen
When I have selected to view a specific record from the worklist
When a complex name checkbox is available I can click it to confirm that the input name is complex	
When I can submit the completed search the complex name indicator is saved with all the search details	
Then I can check the database to confirm the complex name setting
