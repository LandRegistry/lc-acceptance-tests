@lc_registration

Feature: Submit a Land Charge Registration

Scenario: Register Land Charge


  Given a land charge against a private individual
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the registration number and request id

  Given a land charge against a company
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the registration number and request id

  Given a land charge against a local_authority
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the registration number and request id

  Given a land charge against a complex_name
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the registration number and request id

  Given a land charge against a other name
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the registration number and request id

  Given a land charge against 2 counties
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the registration number and request id
  And the response has 2 registrations
  
  Given a priority notice against a private individual
  When I submit the data to the registrations API
  Then a 200 response is returned
  And the response contains the priority notice registration number and request id