@Beta @binc

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to view the original application data 
So that I can identify where the correction is needs to be made and make said correction


Scenario:BUS-128/129/155 Correct and submit a bankruptcy registration record 
Given I am on the view application screen
And I have selected to view specific Bankruptcy application
When I submit data to retrieve the registration details
And I can validate data returned on Orginal bankruptcy details page
And I can amend relevant details on Original bankruptcy details page
And I can click button to continue
And I validate details submitted on Check details page
#And I can verify K22 option is selected by default on Check details page
Then I can click on Complete button
#Next step commented out due to defect no: 196 logged
#And I can confirm the correction was successful

Scenario:BUS-128/129 Submit a bankruptcy registration record with K22 suppressed
Given I am on the view application screen
And I have selected to view specific Bankruptcy application
When I submit data to retrieve the registration details
And I can validate data returned on Orginal bankruptcy details page
And I can amend relevant details on Original bankruptcy details page
And I can click button to continue
And I can choose option to suppress K22
Then I can click on Complete button
#Next step commented out due to defect no: 196 logged
#And I can confirm the correction was successful

Scenario: BUS-128/129 Submit a bankruptcy registration record without any correction 
Given I am on the view application screen
And I have selected to view specific Bankruptcy application
When I submit data to retrieve the registration details
And I can click button to continue
Then I can click on Complete button
#Next step commented out due to defect no: 196 logged
#And I can confirm the correction was successful

