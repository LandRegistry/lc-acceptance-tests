@register_process_neg

Feature: Register a Bankruptcy & Process Name Search No Match

Scenario: Register a standard bankruptcy & process name search no match

Given anything
When I submit valid data to the registration system
Then it returns a 200 OK response
And it returns the new registration number
And a new record is stored on the database
And the debtor details are recorded on the IOPN DB2 tables
And negative search results are recorded on the IOPN DB2 tables
