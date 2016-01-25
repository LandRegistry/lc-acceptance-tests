@amrs

Feature: Errors to be reported to AMRS

Scenario: Create an error

Given the system has created an error
When the error is returned to the system
Then a report is sent to AMRS