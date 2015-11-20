@aai

Feature: amendment application image

As a land charges caseworker
I want to be able to view an image on a amendment application form
So that I can ensure that details are captured correctly onto the land charges register

Scenario: Using the land charges system for amendments
#AM-US001    View Application
Given I have selected to view a specific record on the amendments application list the individual record is displayed
When I am on the retrieve original documents  screen  the accompanying evidence is visible as thumbnails
When I click on a thumbnail the image is expanded to large image
When I am on a Large image I can zoom in
When I am on a Large image I can zoom out
When I must have a registration number before the continue button can be clicked
Then I can click the continue button to go to the next screen

#AM-US002    View Original Application reject
Given I am on the bankruptcy details screen
When the application details become visible they must be the correct ones for the registration number detailed on the previous screen 
When I click on the reject button the next screen is displayed
Then the user can return to the worklist

#AM-US002    View Original Application confirm
Given I have selected to view a specific record from the worklist
When I must have a registration number before the continue button can be clicked
When I can click the continue button to go to the next screen
When the application details become visible they must be the correct ones for the registration number detailed on the previous screen 
# When I can click on the submit button to go to the next screen
Then the user can return to the amend worklist

#AM-US003    Amend Details
Given I have selected to view a specific record from the worklist
When I am on the bankruptcy details worklist screen with amendments still listed
When I must have a different registration number before the continue button can be clicked
When I can click the continue button to go to the next screen
When I am on the amend details screen I can click on the amend name button
When the application details screen is displayed I can overtype the details
When I click add alternative name the debtor alternative name fields are displayed
When I enter the alias names
When I click add alternative name the debtor alternative name fields are displayed
When I enter the alias names
And I can click the continue button to go to the next screen
# When I click the add button for alias name the debtor alias name screen is displayed
# And I can click the continue button to go to the next screen
# When I click the add button for alias name the debtor alias name screen is displayed
# When I enter the additional alias names
# And I can click the continue button to go to the next screen
# When I select an alias name and click the remove button the name is removed from the screen
When I am on the amend details screen I can click on the amend address button
When the address details screen is displayed I can overtype the details
When I click yes to add an address the address details screen is displayed
When I enter the address details
When I select an address and click the remove button the address is removed from the screen
And I can click the continue button to go to the next screen
When I am on the amend details screen I can click on the amend court button
When the court details screen is displayed I can overtype the details
And I can click the continue button to go to the next screen
When I click the check box to confirm verification
Then I can click submit button to save all new information


#AM-US005    Unique Identifier
Given I am on the Application complete screen   
When the amendments application has been submitted the unique identifier is displayed to the user on the screen     
Then the user can return to the amend worklist

#CR-US010 Amend Indicator
Given the application has been amended 
When we check the bankruptcy database record there must be a indicator for amended       
Then the indicator must have a value for amended

 