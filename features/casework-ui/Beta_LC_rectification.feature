@Beta @lcrec

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to retrieve the original registration data for land charges during rectification
So that I can view the details of the original application

Scenario: BUS-090 BUS-092 BUS-125 view and submit a rectification 
Given I am on the rectification screen
When I supply the registration number
#The previous step will fail because user can only enter registration number on designated page which the test is missing
And the date of registration 
When I can click on Continue button to submit the form
When I am on the view amend screen I can see infilled details
When I can click on Continue button to submit the form
When I am on the check details screen I can choose to amend the district
When I can click on Continue button to submit the form
When I am on the Conveyancer and fees screen I can enter a valid key number
When I enter fee details I can choose prepaid
And I change it to choose direct debit
When I click on the Submit button
Then the successfully completed Registration banner and number is displayed  

Scenario: BUS-095 Reclassify a form from K9 to a PAB and vice versa
Given I am on Land Charge rectification screen
When I can classify the form to a PAB Registration type
Then I can restore the reclassified PAB form back to a K9 Rectification form 

Scenario: BUS-095 Reclassify a form from K9 to a K4 and vice versa
Given I am on Land Charge rectification screen
When I can classify the K9 form to a K4 form type
Then I can restore the reclassified K4 form back to a K9 Rectification form 

