@ds

Feature: Document Storage

As a service
I want to be able to store retrieve amend an image
So that images of application forms and associated documents may be retained

Scenario: Document storage
Given I have a document that has been scanned onto the system	
When I use the system to view the scanned document	
Then I access the DB2 table to confirm row exists

bbbbb