  @search_api
  
  Feature: Return Valid Search Results
  
  Scenario: Search API Behaviour
  
  Given a land charges register containing the following records:
     | date       | nametype           | name                                      | counties   | class | pnoticeexp |
     | 2014-01-01 | Private Individual | Test User One                             | Devon      | PAB   |            |
     | 2014-01-11 | Private Individual | T U One                                   | Devon      | WOB   |            |
     | 2014-02-02 | Private Individual | Test User Two                             | Dorset     | C1    |            |
     | 2014-01-03 | Private Individual | Test User Two                             | Devon      | PA    |            |
     | 2014-05-15 | Private Individual | Test User Two                             | Lancashire | A     |            |
     | 2014-03-03 | Private Individual | Test User Three                           | Lancashire | C4    | 2015-03-03 |
     | 2014-03-15 | Private Individual | Test User Four                            | Lancashire | C2    |            |
     | 2014-03-01 | Private Individual | Test User Four                            | Lancashire | C2    | 2015-01-01 |
     | 2014-05-15 | Private Individual | Test User Five                            | Lancashire | C3    |            |
     | 2014-04-15 | Private Individual | Test User Five                            | Devon      | C3    |            |
     | 2015-01-01 | Private Individual | Test User Six                             | Devon      | C3    |            |
     | 2015-01-03 | Private Individual | Test User Six                             | Dorset     | C1    |            |
     | 2015-01-05 | Private Individual | Test User Six                             | Lancashire | WO    |            |
     | 2015-01-07 | Private Individual | Test User Six                             | Hampshire  | DA    |            |
     | 2015-01-08 | Private Individual | Test User Six                             | NO COUNTY  | D1    |            |
     | 1915-01-09 | Private Individual | Test User Seven                           | Hampshire  | C1    |            |
     | 2015-01-11 | Private Individual | Test User Seven                           | Hampshire  | C1    |            |
     | 1970-01-13 | Private Individual | Test User Seven                           | Hampshire  | DA    |            |
     | 2015-01-15 | Private Individual | Test User Seven                           | Hampshire  | DA    |            |
     | 2015-02-01 | Private Individual | Test User Eight                           | Swansea    | C2    |            |
     | 2015-02-02 | Private Individual | Test User Eight                           | Devon      | C3    |            |
     | 2015-02-03 | Private Individual | Test User Nine, Test User Ten             | Devon      | PAB   |            |
     | 2001-01-01 | Other              | Beauty Without Cruelty                    | Devon      | C1    |            |
     | 2001-01-02 | Other              | Bob Ross and Brothers Associated          | Devon      | C1    |            |
     | 2001-01-08 | Other              | Governors of Town School                  | Devon      | C1    |            |
     | 2001-01-03 | Limited Company    | Dave's Fancy Builders Limited             | Devon      | C1    |            |
     | 2001-01-04 | Limited Company    | The Happy Pie Company Limited             | Devon      | C1    |            |
     | 2001-01-05 | Limited Company    | Messrs Bill and Ted PLC                   | Devon      | C1    |            |
     | 2001-01-06 | Limited Company    | Daves Hotels Incorporated PLC             | Devon      | C1    |            |
     | 2001-01-07 | Limited Company    | Dave and Sons Builders and Decorators Ltd | Devon      | C1    |            |
     | 2001-01-09 | County Council     | Devon County Council, Devon               | Devon      | C1    |            |
     | 2001-01-10 | Rural Council      | Over Rural Council, Over                  | Devon      | C1    |            |
     | 2001-01-11 | Rural Council      | Upon Rural Council, Upon                  | Devon      | C1    |            |
     | 2015-02-03 | Private Individual | Test User Eh                              | Devon      | WOB   |            |
     | 1990-02-03 | Private Individual | Test User Eh                              | Devon      | WOB   |            |
    

  When I full search for the Private Individual Test User Three in all counties
  Then the result will contain no entries

  When I banks search for the Private Individual Test User Eh
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-03 | WOB   |

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
     # Because: C1 1915 is before 1925 (default date range)
     # and DA is > 5 years old

  When I full search for the Private Individual Test User Eight in Swansea
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-01 | C2    |

  When I full search for the Private Individual Test User Eight in Sir Abertawe
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-01 | C2    |
    
  When I banks search for the Private Individual Test User Nine
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-03 | PAB   |

  When I banks search for the Private Individual Test User Ten
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-03 | PAB   |
    
  When I full search for the Private Individual Test User Nine in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-03 | PAB   |
    
  When I full search for the Private Individual Test User Nine in Devon
  Then the result will contain the entries:
     | date       | class |
     | 2015-02-03 | PAB   |
    
  When I full search for the Other Bob Ross and Brothers Associated in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-02 | C1    |
    
  When I full search for the Other Bob Ross and Bros Assocs in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-02 | C1    |
    
  When I full search for the Other Beauty Without Cruelty in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-01 | C1    |
    
  When I full search for the Other Beauty With Cruelty in all counties
  Then the result will contain no entries

  When I full search for the Limited Company Dave's Fancy Builders Limited in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-03 | C1    |
    
  When I full search for the Limited Company Daves Fancy Builder Cyf in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-03 | C1    |
    
  When I full search for the Other Governors of Town School in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-08 | C1    |
    
  When I full search for the Other Town School Governors in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-08 | C1    |
    
  When I full search for the Limited Company The Happy Pie Co Ltd in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-04 | C1    |
    
  When I full search for the Limited Company Happy Pie Company Ltd in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-04 | C1    |
    
  When I full search for the Limited Company Messrs Bill and Ted Ltd in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-05 | C1    |
    
  When I full search for the Limited Company Bill Ted Ltd in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-05 | C1    |
    
  When I full search for the Limited Company Daves Hotels Incorporated Ltd in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-06 | C1    |
    
  When I full search for the Limited Company Daves Hotel Cyfyngedig in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-06 | C1    |
    
  When I full search for the Limited Company Dave and Sons Builders and Decorators Ltd in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-07 | C1    |
    
  When I full search for the Limited Company Dave Son Builder Decorator Limited in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-07 | C1    |
    
  When I full search for the County Council Devon County Council (Devon) in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-09 | C1    |

  When I full search for the Rural Council Over County Council (Over) in all counties
  Then the result will contain the entries:
     | date       | class |
     | 2001-01-10 | C1    |
     | 2001-01-11 | C1    |
