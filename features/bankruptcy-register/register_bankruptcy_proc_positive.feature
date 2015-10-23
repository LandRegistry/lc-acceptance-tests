@register_process_pos

Feature: Register a Bankruptcy & Process Name Search With Match

Scenario: Register a standard bankruptcy & process name search with match

Given anything
When I submit Steven Smith to the registration system
Then it returns a 200 OK response
And it returns the new registration number
And a new record is stored on the database
And the debtor details are recorded on the IOPN DB2 tables
And positive search results are recorded on the IOPN DB2 tables
