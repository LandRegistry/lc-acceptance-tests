@search_api

Feature: Return Valid Search Results

Scenario: Search API Behaviour

Given a land charges register containing the following records:
	| date       | nametype           | name                     | counties   | class  | pnoticeexp |
	| 2014-01-01 | Private Individual | Test User One            | Devon      | PAB    |            |
	| 2014-02-02 | Private Individual | Test User Two            | Dorset     | C1     |            |
	| 2014-03-03 | Private Individual | Test User Three          | Lancashire | C1     | 2015-03-03 |
When I full search for the Private Individual Test User Three in all counties
Then the result will contain no entries

When I banks search for the Private Individual Test User One
Then the result will contain the entries:
	| date       | class | 
	| 2014-01-01 | PAB   |