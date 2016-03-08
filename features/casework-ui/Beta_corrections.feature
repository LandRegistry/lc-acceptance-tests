@lcc

Feature: internal functions corrections

As a land charges caseworker 
I want to be able to make corrections
So that changes can be applied where required

Scenario: Correct and submit a bankruptcy registration record 
Given I am on the view application screen
And I have selected to view specific the application list
When I submit data to retrieve the registration details
And I can validate data returned on Orginal bankruptcy details page
And I can amend relevant details on Original bankruptcy details page
And I can click button to continue
And I can verify K22 option is selected by default
Then I can click on Complete button
And I can confirm the correction was successful

Scenario: Submit a bankruptcy registration record with K22 suppressed
Given I am on the view application screen
And I have selected to view specific the application list
When I submit data to retrieve the registration details
And I can validate data returned on Orginal bankruptcy details page
And I can amend relevant details on Original bankruptcy details page
And I can click button to continue
And I can choose option to suppress K22
Then I can click on Complete button
And I can confirm the correction was successful

Scenario: Submit a bankruptcy registration record without any correction 
Given I am on the view application screen
And I have selected to view specific the application list
When I submit data to retrieve the registration details
And I can click button to continue
#EA: Next line needs to be reviewed/discussed with BA
And I enter case year the details are visible
And I can click button to continue
Then I can click on Complete button
And I can confirm the correction was successful





