@ds

Feature: Document Storage

As a service
I want to be able to store retrieve amend an image
So that images of application forms and associated documents may be retained

Scenario: Document storage

#DS-US002 ADD A DOCUMENT
Given I have a document that has been scanned onto the system	
When document is added retrieved deleted replaced the system returns a positive response code	
When I access the DB2 table to confirm row exists
