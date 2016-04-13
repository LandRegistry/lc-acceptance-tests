@Beta @lcrk2

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a land charges application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: BUS-099 BUS-130 Verify mandatory two stage name re-entry when completing a Land Charges registration application
  Given I am on the view application screen
  When I have selected to view a K2 Land Charges application from the application list
  When I access the application screen for a K2 the class type is set to F
  When I access the application screen I can enter the priority notice
  When I access the application screen the county Unitary Authority dropdown box is visible
  When I access the application screen the district box is visible as a free format
  When I access the application screen the known as text box is visible
    And I can enter the free format details
  When Private Individual is selected I can complete the names details
    And I have a trade title profession I can complete the details
    And I have additional information I can enter it in the free format text box
  When I can click on Continue button to submit the form
  When I am on the verification screen I can rekey estate owner's full name
  When I can select the class of charge
  When I can click on Continue button to submit the form
  When I am on the Conveyancer and fees screen I can enter a valid key number
  When I enter fee details I can choose prepaid
    And I change it to choose direct debit
    And I set the address type to DX
  When I can click the complete search button
  Then the successfully completed Registration banner and number is displayed

