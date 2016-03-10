@Beta @bamd

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to view the amendment form a bankruptcy registration
So that I can make any changes to the registration



Scenario: #BUS-049 Retrieve and View and amend original data of application
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I register and submit a PAB reference number for amendment
When I can click on Continue button to submit the form
When I can amend data on the Original Bankruptcy details page
When I click add AKA  on amendments a new fields are displayed and I can enter them
When I can click button to continue
#Next line commented out.See defect no:37
#When I click the change details button on the check details screen
#When I amend an AKA name the new details are visible
When I can click on Continue button to submit the form
When I am on the Court screen I can enter a valid key number
When I can click button to continue
#Next line commented out due to defect logged
#Then the susuccessfully completed Registration number is banner is displayed

Scenario: Amendments API verification
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I register and submit a PAB reference number for amendment
When I can click on Continue button to submit the form
And I amend the registration record
And I can click on Continue button to submit the form
And I can click on Continue button to submit the form
#next line will fail: Defect no: 28 logged
#Then I can submit amended form and verify the new api updates for the amendment

Scenario: BUS-095 Reclassify a LRRABO form to a K11 Cancellation application and vice versa
Given I am on Bankruptcy Amendment screen
When I can reclassify a LRRABO form to a Cancellation application form type
Then I can move the reclassified K7 form back to a LRRABO form



