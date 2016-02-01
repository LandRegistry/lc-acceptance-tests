@verification

Feature: Double Keying

Scenario: Double Keying

Given a 'C1' registration in progress for private individual 'Bob Oscar Francis Howard'
When I get to the verification screen
When I enter the forename 'Roberto'
And I enter the surname 'Harold'
And I enter the class 'C4'
When I click continue
Then I will be informed that the names are wrong
And I will be informed that the class of charge is wrong