@b2b_link

Feature: Submit a Bankruptcy Electronically

Scenario: Receive and register an INS bankruptcy

Given anything
When I submit a valid INS request
Then it returns a 202 ACCEPTED response
And it returns the new registration number (in result format)
And a new record is stored on the database
