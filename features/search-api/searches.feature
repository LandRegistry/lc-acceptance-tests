@search_api_2

Feature: Submit a Search

Scenario: Complete Full and Bankruptcy searches

  Given I have submitted a singular company name
  When I submit a full search for th plural of the company
    And I query the search result using the plural company name
  Then the response contains the registration details for the singular company registered

  Given  I have submitted a new registration for a private individual
  When I submit a full search for a private individual
    And I query the search result using a private individual
  Then the response contains the registration details

  Given  I have submitted a new registration for a company
  When I submit a full search for a company
    And I query the search result using a company
  Then the response contains the registration details

  Given  I have submitted a new registration for a council
  When I submit a full search for a council
    And I query the search result using a council
  Then the response contains the registration details

  Given  I have submitted a new registration for a complex name
  When I submit a full search for a complex name
    And I query the search result using a complex name
  Then the response contains the complex name registration details

  Given  I have submitted a new registration for a other
  When I submit a full search for a other
    And I query the search result using a other
  Then the response contains the registration details

  # test that a PA search ignores incorrect county
  Given I have submitted a registration for a C1 and PA
  When I submit a combined C1 and PA search
    And I query the C1 and PA search result
  Then the PA returns a hit but the C1 does not

  # test that a WO search ignores incorrect county
  Given I have submitted a registration for a C1 and WO
  When I submit a combined C1 and WO search
    And I query the C1 and WO search result
  Then the WO returns a hit but the C1 does not

  # test that a PA search ignores incorrect date
  Given I have submitted a registration for a C2 and PA
  When I submit a combined C2 and PA search with search period pre registration
    And I query the C2 and PA search result
  Then the PA returns a hit but the C2 does not

   # test that a WO search ignores incorrect date
  Given I have submitted a registration for a C2 and WO
  When I submit a combined C2 and WO search with search period pre registration
    And I query the C2 and WO search result
  Then the WO returns a hit but the C2 does not

  # test that search on a name returns registrations for full name, initials & surname and surname only
  Given I have submitted registration for all private individual variations
  When I submit a full search for a private individual
    And I query the search result using a private individual
  Then all 3 private individual names are returned

  # test that search on initials and surname only return the initials and surname registration
  Given I have submitted registration for all private individual variations
  When I have requested a search using initials and surname
  When I query the initials and surname searched result
  Then only the initials and surname appear in the result

  # test that search on surname only return the surname registration
  Given I have submitted registration for all private individual variations
  When I have requested a search using surname only
  When I query the surname only searched result
  Then only the surname only appear in the result