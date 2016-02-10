@Beta @lcr

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a land charges application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: BUS-099 Verify mandatory two stage name re-entry when completing a Land Charges registration application 
Given I am on the view application screen
When I have selected to view a specific Land Charges application from the application list
When I can select the appropiate class of charge
When I access the application screen the county Unitary Authority dropdown box is visible	
When I access the application screen the district box is visible as a free format
When I access the application screen the short description text box is visible
And I can enter the free format details
When Private Individual is selected I can complete the names details
And I have a trade title profession I can complete the details
And I have additional information I can enter it in the free format text box
When I can click on Continue button to submit the form
Then I can re-key estate owner's full name