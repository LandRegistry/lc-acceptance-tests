@lcc

feature: internal functions corrections

As a land charges caseworker 
I want to be able to make corrections
So that changes can be applied where required

Scenario: Access a bankruptcy registration record for correction
Given I launch the land charges internal functions page
And I enter valid registration number
And I enter valid date of registration
When I click on button to continue
Then I can see the bankruptcy details page
And I can edit the registration record
And I can successfullu submit the record
