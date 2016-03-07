@Beta @binc

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to view the original application data 
So that I can identify where the correction is needs to be made and make said correction

Scenario: BUS-128 CRX view original data
Given I am on the bankruptcy correction screen
When I enter the registration number
And the correction data
Then I can see all the orginal bankruptcy details