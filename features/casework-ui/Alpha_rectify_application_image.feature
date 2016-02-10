@rai

Feature: rectify application image

As a land charges caseworker
I want to be able to view an image on a rectify application form
So that I can amend the original details and save the changes

#Scenario: Using the bankruptcy rectifications task on the  Land Charges system

#RC-US001 View original application
#Given I am on the Bankruptcy Rectification document request screen
#When I must have a registration number before the continue button can be clicked
#Then I can click the continue button to go to the next screen
#
##RC-US002 View Details
#Given I am on the Rectify screen
#When I click on the different thumbnails the editable details are displayed below
##When I am on a Large image I can zoom in
##When I am on a Large image I can zoom out
#When the application details screen is displayed I can overtype the details
#When there is more that one alias name
#When I add an address the new details are visible
#Then all amended details will need to be updated to reflect the stored changes
#
##RC-US003 View summary
##Given I am on the Rectify screen
##When I can the new details on the screen
##When I click on the Yes for acknowledgement required checkbox is highlighted
##When I click on the No for acknowledgement required checkbox is highlighted
##Then I click on the Yes for acknowledgement required checkbox is highlighted
#
##RC-US004 Submit
#Given I am on the Rectify screen
#When I click on the Submit button
#Then the Application has been submitted the date is displayed to the user on the screen
#
##RC-US005 Request acknowledgement
#Given I am on the Application complete screen
#When the rectification to the application has been submitted the amended unique identifier is displayed to the user on the screen
#Then the user can return to the worklist
#
#Given an acknowledgement has not been requested
#When I am on the Application complete screen
#Then there is not link to view notification
#
#Given an acknowledgement has been requested
#When I click on the view notification link
#Then the image on an acknowledgement is displayed



