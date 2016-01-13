@ds

Feature: Document Storage

As a service
I want to be able to store retrieve amend an image
So that images of application forms and associated documents may be retained

Scenario: Document storage

#DS-US002 ADD A DOCUMENT
Given I have a document that has been scanned onto the system	
When document is added the correct response code is returned
When document is retrieved the correct response code is returned
When document is deleted the correct response code is returned
When document is added the correct response code is returned
When document is replaced the correct response code is returned	
When document is retrieved the correct response code is returned
When I access the DB2 table to confirm row exists
