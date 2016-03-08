@lcc

Feature: internal functions corrections

As a land charges caseworker 
I want to be able to make corrections
So that changes can be applied where required

Scenario:BUS-128/129/155 Correct and submit a bankruptcy registration record 
Given I am on the view application screen
And I have selected to view specific the application list
When I submit data to retrieve the registration details
And I can validate data returned on Orginal bankruptcy details page
And I can amend relevant details on Original bankruptcy details page
And I can click button to continue
And I validate details submitted on Check details page
And I can verify K22 option is selected by default on Check details page
Then I can click on Complete button
#EA: Next line is expected to fail unless the actual is corrected display: Your application has been successfully corrected!
And I can confirm the correction was successful

Scenario:BUS-128/129 Submit a bankruptcy registration record with K22 suppressed
Given I am on the view application screen
And I have selected to view specific the application list
When I submit data to retrieve the registration details
And I can validate data returned on Orginal bankruptcy details page
And I can amend relevant details on Original bankruptcy details page
And I can click button to continue
And I can choose option to suppress K22
Then I can click on Complete button
#EA: Next line is expected to fail unless the actual is corrected display: Your application has been successfully corrected!
And I can confirm the correction was successful

Scenario: BUS-128/129 Submit a bankruptcy registration record without any correction 
Given I am on the view application screen
And I have selected to view specific the application list
When I submit data to retrieve the registration details
And I can click button to continue
#EA: THE TEST WILL BE AMENDED WHEN CASE YEAR FIELD IS REMOVED FROM THE PAGE
And I enter case year the details are visible
And I can click button to continue
Then I can click on Complete button
#EA: Next line is expected to fail unless the actual is corrected display: Your application has been successfully corrected!
And I can confirm the correction was successful





