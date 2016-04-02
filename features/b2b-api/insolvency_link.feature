@b2b_link

Feature: Submit a Bankruptcy Electronically

Scenario: Receive and register an INS bankruptcy

  Given valid registration data with 1 name
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains the new registration details
    And the response contains 1 registration

  Given registration data without a debtor name field
  When I submit the data to the public API
  Then it returns a 400 BAD REQUEST response
    And the response contains 1 error
    And the error indicates that the name is missing
  
  Given valid registration data with 2 names
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains the new registration details
    And the response contains 2 registrations
  
  Given registration data without application reference or type
  When I submit the data to the public API
  Then it returns a 400 BAD REQUEST response
    And the response contains 2 errors
    And the error indicates that the reference is missing
    And the error indicates that the type is missing
  
  Given registration data where the debtor names are strings
  When I submit the data to the public API
  Then it returns a 400 BAD REQUEST response
    And the response contains 2 errors
    And the error indicates that the name is not an object
  
  Given registration data where the keynumber contains letters
  When I submit the data to the public API
  Then it returns a 400 BAD REQUEST response
    And the response contains 1 error
    And the error indicates that the keynumber is malformed
  
  Given registration data where the keynumber and date are missing
  When I submit the data to the public API
  Then it returns a 400 BAD REQUEST response
    And the response contains 2 errors
    And the error indicates that the keynumber is missing
    And the error indicates that the date is missing

  Given a successfully submitted registration
  When I query the land charge API for the registration
  Then the registration is returned
    And the details match

  Given a successfully submitted registration with residence withheld
  When I query the land charge API for the registration
  Then the registration is returned
    And the details match
  
  Given a successfully submitted registration with all of the data
  When I query the land charge API for the registration
  Then the registration is returned
    And the details match
  
  Given registration data in XML
  When I submit the XML data to the public API
  Then it returns a 415 INVALID MEDIA TYPE response

  Given sample submission 1
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 1 registration
    
  Given sample submission 2
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 1 registration
    
  Given sample submission 3
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 1 registration
    
  Given sample submission 4
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 2 registrations

  Given sample submission 6
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 1 registration
    
  Given sample submission 7
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 2 registrations
    
  Given sample submission 8
  When I submit the data to the public API
  Then it returns a 201 CREATED response
    And the response contains 2 registrations