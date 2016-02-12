@reg_bank

Feature: Register a Bankruptcy

Scenario: Register a standard bankruptcy

Given anything
When I submit valid data to the registration system
Then it returns a 200 OK response
And it returns the new registration number
And a new record is stored on the database

Given anything
When I submit valid data with an alias to the registration system
Then it returns a 200 OK response
And it returns the 2 new registration numbers
And 2 new records are stored on the database