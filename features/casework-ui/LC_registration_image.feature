@lcr

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a land charges application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: Using the land charges system
#NR-US001 View Image of Application
Given I am on the view application screen
When I have selected to view a specific Land Charges application from the application list
When I am on a Large image I can zoom in
When I am on a Large image I can zoom out
When viewing the application screen a dropdown list is visible for class of charge 	
And I can select the appropiate class of charge
When I access the application screen the county Unitary Authority dropdown box is visible	
When I access the application screen the district box is visible as a free format
When I access the application screen the short description text box is visible
And I can enter the free format details
When Private Individual is selected I can complete the names details
And I have a trade title profession I can complete the details
And I have additional information I can enter it in the free format text box
And I have a trade title profession I can complete the details
And I have additional information I can enter it in the free format text box
#Then I can click the land charges continue button to go to the next screen
Then I can click on Continue button to submit the form


#SEPARATE TESTING FOR THE FOLLOWING WITHOUT SUBMITTING THE FORM
#Limited Company is selected I can complete the company details
#When Local authority is selected I can complete the company details
#When Complex name is selected I can complete the complex name details
#When other is selected I can complete the name


#EA: Commenting out for now till tidying up exercise is completed
#NR-US002 Unique Identifier
#Given I am on the Application complete screen
#When the Application has been submitted the unique identifier is displayed to the user on the screen
#And a row is added to the Land charges database
#Then the user can return to the worklist

Scenario: Using the land charges system with a complex name
Given I am on the view application screen
When I have selected to view a specific Land Charges application from the application list
When I am on a Large image I can zoom in
When I am on a Large image I can zoom out
When I can select the appropiate class of charge
When I access the application screen the county Unitary Authority dropdown box is visible	
When I access the application screen the district box is visible as a free format
When I access the application screen the short description text box is visible
And I can enter the free format details
When Complex name is selected I can complete the complex name details
#EA: Enter Complex name in field first
When I enter Complex name in given field
When I click on look up complex name a new screen is displayed
When I select a complex name then radio button is highlighted
And I can then click the close button
When I have a trade title profession I can complete the details
When I have additional information I can enter it in the free format text box
When I can select the appropiate class of charge
Then I can click on Continue button to submit the form
#EA: REVIEW IN NEXT SPRINT Next three lines commented out as it appears We should be taken to Conveyancer and fee page which is currently a placeholding one
#EA: REVIEW IN SPRINT 4
#And I am on the Application complete screen
#And the Application has been submitted the unique identifier is displayed to the user on the screen
#And the user can return to the worklist


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
