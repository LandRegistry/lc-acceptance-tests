@lcr

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to view an image on a land charges application form
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
And I can select the correct location
When I access the application screen the district dropdown box is visible	
And I can select the correct location
When I access the application screen the short description text box is visible
And I can enter the free format details
When I access the application screen a dropdown list is visible for categories of estate owner	
When Private Individual is selected I can complete the names details
When Limited Company is selected I can complete the company details
When Local authority is selected I can complete the local authority details
When Complex name is selected I can complex the complex name details
When other is selected I can complete the name
When I have a trade title profession I can complete the details
When I have additional information I can enter it in the free format text box
Then I can click the continue button to go to the next screen



#NR-US002 Unique Identifier
#Given I am on the Land Charges Application complete screen
#When the Application has been submitted the unique identifier is displayed to the user on the screen
#Then the user can return to the worklist