@search_api

Feature: Return Valid Search Results

Scenario: Search API Behaviour

Given a land charges register containing the following records:
	| date       | nametype           | name                     | counties     | class  | pnoticeexp |
	| 2014-01-01 | Private Individual | Test User One            | Devon        | PAB    |            |
    | 2014-01-11 | Private Individual | T U One                  | Devon        | WOB    |            |
	| 2014-02-02 | Private Individual | Test User Two            | Dorset       | C1     |            |
    | 2014-01-03 | Private Individual | Test User Two            | Devon        | PA     |            |
	| 2014-05-15 | Private Individual | Test User Two            | Lancashire   | A      |            |
    | 2014-03-03 | Private Individual | Test User Three          | Lancashire   | C4     | 2015-03-03 |
    | 2014-03-15 | Private Individual | Test User Four           | Lancashire   | C2     |            |
    | 2014-03-01 | Private Individual | Test User Four           | Lancashire   | C2     | 2015-01-01 |
    | 2014-05-15 | Private Individual | Test User Five           | Lancashire   | C3     |            |
    | 2014-04-15 | Private Individual | Test User Five           | Devon        | C3     |            |
    | 2015-01-01 | Private Individual | Test User Six            | Devon        | C3     |            |
    | 2015-01-03 | Private Individual | Test User Six            | Dorset       | C1     |            |
    | 2015-01-05 | Private Individual | Test User Six            | Lancashire   | WO     |            |
    | 2015-01-07 | Private Individual | Test User Six            | Hampshire    | DA     |            |
    | 2015-01-08 | Private Individual | Test User Six            | NO COUNTY    | D1     |            |
    | 1915-01-09 | Private Individual | Test User Seven          | Hampshire    | C1     |            |
    | 2015-01-11 | Private Individual | Test User Seven          | Hampshire    | C1     |            |
    | 1915-01-13 | Private Individual | Test User Seven          | Hampshire    | DA     |            |
    | 2015-01-15 | Private Individual | Test User Seven          | Hampshire    | DA     |            |
    | 2015-02-01 | Private Individual | Test User Eight          | Swansea      | C2     |            |
    | 2015-02-02 | Private Individual | Test User Eight          | Devon        | C3     |            |
    

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
    | 2014-01-03 | PA    |
    
When I full search for the Private Individual Test User Six in Devon
Then the result will contain the entries:
    | date       | class | 
    | 2015-01-01 | C3    |
    | 2015-01-05 | WO    |
    | 2015-01-07 | DA    |
    | 2015-01-08 | D1    |
    
When I full search for the Private Individual Test User Seven in all counties
Then the result will contain the entries:
    | date       | class | 
    | 2015-01-11 | C1    |
    | 2015-01-15 | DA    |
    | 1915-01-13 | DA    |

When I full search for the Private Individual Test User Eight in Swansea
Then the result will contain the entries:
    | date       | class | 
    | 2015-02-01 | C2    |

When I full search for the Private Individual Test User Eight in Sir Abertawe
Then the result will contain the entries:
    | date       | class | 
    | 2015-02-01 | C2    |

