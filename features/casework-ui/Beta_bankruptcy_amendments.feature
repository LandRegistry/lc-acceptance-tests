@Beta @bamd

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to view the amendment form a bankruptcy registration
So that I can make any changes to the registration



Scenario: #BUS-049 Retrieve and View and amend original data of application
Given I am on the bankruptcy amendments screen
When I select an application type of WOB with a single image to amend
When I enter the WOB reference number the details are visible
And the wob date is visible
When I enter the PAB reference number the details are visible
And the pab date is visible
When I can click on Continue button to submit the form
When I am on the registration check screen
When I can click on Continue button to submit the form
When I am on the original bankruptcy details screen I can see the details are all completed
When I click add AKA  on amendments a new fields are displayed and I can enter them
#When I click to add additional address new fields are visible
#And can be completed
#When I click on the remove address the details are no longer visible
When I can click on Continue button to submit the form
When I click the change details button on the check details screen
#When I amend an AKA name the new details are visible
When I can click on Continue button to submit the form
When I am returned to the confirm details screen I can then click continue
When I am on the Court screen I can enter a valid key number
When I can click the complete bankruptcy button
Then the susuccessfully completed Registration number is banner is displayed

Scenario: Amendments API verification
Given I am on the bankruptcy amendments screen
When I select an application type of WOB with a single image to amend
When I enter a PAB reference number for the amendment
And I enter date for the PAB amendment
When I can click on Continue button to submit the form
And I amend the registration record
And I can click on Continue button to submit the form
And I can click on Continue button to submit the form
#Need to discuss smart way to test next line due to a potential defect
#Then I can submit amended form and verify the new api updates for the amendment


