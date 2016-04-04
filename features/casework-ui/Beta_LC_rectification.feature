@Beta @lcrec

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to retrieve the original registration data for land charges during rectification
So that I can view the details of the original application

#EA: Test passes on macbook and manually in diti environment and only dails on jenkins
#Scenario: BUS-090 BUS-092 BUS-125 view and submit a rectification 
#Given I have selected to view a specific Land Charges application from the application list
#And I submit input details for land charge registration
#When I parse a Land Charge application details for rectification
#When I am on the view amend screen I can see infilled details
#When I can click on Continue button to submit the form
#When I am on the check details screen I can choose to amend the district
#When I can click on Continue button to submit the form
#When I am on the Conveyancer and fees screen I can enter a valid key number
#When I enter fee details I can choose prepaid
#When I click on the Submit button
#Then the successfully completed Registration banner and number is displayed 

Scenario: BUS-095 Reclassify a form from K9 to a PAB and vice versa
Given I am on Land Charge rectification screen
When I can classify the form to a PAB Registration type
Then I can restore the reclassified PAB form back to a K9 Rectification form 

Scenario: BUS-095 Reclassify a form from K9 to a K4 and vice versa
Given I am on Land Charge rectification screen
When I can classify the K9 form to a K4 form type
Then I can restore the reclassified K4 form back to a K9 Rectification form 	




