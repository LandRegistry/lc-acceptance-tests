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
  
  Given an existing land charge
  When I submit a type 1 rectifcation to the charge
  Then a 200 response is returned
  And the response contains the new registration numbers as well as the old
  And the old registration is no longer revealed
  
  Given an existing land charge
  When I submit a type 2 rectifcation to the charge
  Then a 200 response is returned
  And the response contains the new registration numbers as well as the old
  And the old registration is still revealed
  
  Given an existing land charge
  When I submit a type 3 rectifcation to the charge
  Then a 200 response is returned
  And the response contains the new registration numbers as well as the old
  And the old registration is no longer revealed