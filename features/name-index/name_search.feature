@iopn_search
Feature: IOPN Searching

Scenario: Perform name searches

Given a populated name database
When I search the name database for 'Stephen Todd Smith'
Then the search result will contain 'Stephen Todd Smith'
And the search result will contain 'Stephan Todd Smith'
And the search result will not contain 'Simon Trett Smith'