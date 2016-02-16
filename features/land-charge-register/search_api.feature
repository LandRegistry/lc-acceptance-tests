@search_api

Feature: Return Valid Search Results

Scenario: Search API Behaviour

Given a land charges register containing the following records:
	| date       | nametype           | name                     | counties   | class  | pnoticeexp |
	| 2014-01-01 | Private Individual | Test User One            | Devon      | PAB    |            |
    | 2014-01-11 | Private Individual | T U One                  | Devon      | WOB    |            |
	| 2014-02-02 | Private Individual | Test User Two            | Dorset     | C1     |            |
	| 2014-05-15 | Private Individual | Test User Two            | Lancashire | A      |            |
    | 2014-03-03 | Private Individual | Test User Three          | Lancashire | C4     | 2015-03-03 |
    | 2014-03-15 | Private Individual | Test User Four           | Lancashire | C2     |            |
    | 2014-03-01 | Private Individual | Test User Four           | Lancashire | C2     | 2015-01-01 |
    | 2014-05-15 | Private Individual | Test User Five           | Lancashire | C3     |            |
    | 2014-04-15 | Private Individual | Test User Five           | Devon      | C3     |            |
    

When I full search for the Private Individual Test User Three in all counties
Then the result will contain no entries

When I banks search for the Private Individual Test User One
Then the result will contain the entries:
	| date       | class | 
	| 2014-01-01 | PAB   |
    | 2014-01-11 | WOB   |

When I banks search for the Private Individual T U One
Then the result will contain the entries:
    | date       | class | 
    | 2014-01-11 | WOB   |

When I full search for the Private Individual Test User Four in all counties
Then the result will contain the entries:
	| date       | class | 
	| 2014-03-15 | C2    |
    
When I full search for the Private Individual Test User Five in Devon
Then the result will contain the entries:
	| date       | class | 
	| 2014-04-15 | C3    |

When I full search for the Private Individual Test User Two in Dorset
Then the result will contain the entries:
    | date       | class | 
    | 2014-02-02 | C1    |
    | 2014-05-15 | A     |