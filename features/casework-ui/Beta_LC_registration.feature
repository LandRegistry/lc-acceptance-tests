@Beta @lcr

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a land charges application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: BUS-099 Verify mandatory two stage name re-entry when completing a Land Charges registration application
  Given I am on the view application screen
  When I have selected to view a specific Land Charges application from the application list
  When I can select the class of charge
  When I access the application screen I can enter the priority notice
  When I access the application screen the county Unitary Authority dropdown box is visible
  When I access the application screen the district box is visible as a free format
  When I access the application screen the short description text box is visible
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

Scenario: BUS-095 Reclassify a LC Registration form to a WOB and vice versa
  Given I am on Land Charge Registration applications screen
  When I can classify the form to a WOB Registration type
  Then I can restore the reclassified WOB Registration form to a K1 LC Registration form

Scenario: BUS-120.2 Reject Land charge registration application
  Given I am on the view application screen
  When I have selected to view a specific Land Charges application from the application list
  When I can select the appropiate class of charge
  When I can reject the application
  Then I click Ok on the pop up
  And I can see Confirmation message indicating the application has been rejected
  
Scenario: BUS-120.3 Confirm that a rejected Land charges registration form no longer exists
  Given I am on Land Charge Registration applications screen
  When I choose the first available form
  Then I can reject the land charges application form
  And I can confirm the form no longer exists
  
Scenario: Submit LC Registration with Other estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose other estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed
  
Scenario: Submit LC Registration with Complex Names estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose complex names estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Rural District Council estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose rural district council estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with County Council estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose county council estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Development Corporation estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose development corporation estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Council estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose other council estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Parish Council estate owner type
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose parish council estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Councils: County Councils
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I can choose other council estate owner type and verify the details
  Then I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Councils: Unitary Authorities 
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I select Other council from estate owner list
  Then I can submit entries for a unitary authority
  And I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Councils: Borough Councils v.1
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I select Other council from estate owner list
  Then I can submit entries for a borough council
  And I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Councils: Borough Councils v.2
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I select Other council from estate owner list
  Then I can submit entries for a borough councils
  And I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Councils: Metropolitan Borough Councils v.1
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I select Other council from estate owner list
  Then I can submit entries for a metropolitan borough council
  And I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

Scenario: Submit LC Registration with Other Councils: Metropolitan Borough Councils v.2
  Given I am on Land Charge Registration applications screen
  When I have selected to view a specific Land Charges application from the application list
  When I input standard data for LC registration
  When I select Other council from estate owner list
  Then I can submit entries for a metropolitan borough council v2
  And I can proceed and process fees
  And the successfully completed Registration banner and number is displayed

#Scenario: Submit LC Registration with Other Councils: Parish Councils
#Scenario: Submit LC Registration with Other Councils: Community Councils 
#Scenario: Submit LC Registration with Other Councils: Town Councils

Scenario: BUS-082.4 Verify display of a stored Land Charges application 
  Given I am on Land Charge Registration applications screen
  When I navigate to Land Charge application store page
  Then I can validate number displayed before and after a Land Charge application is stored
  
#Scenario: E2E Regression: Amend and cancel a stored new Land Charge application
  #Given I am on Land Charge Registration applications screen
  #And I store a new Land Charge application
  #When I retrieve and submit the newly stored applcation
  #Then I can rectify the newly registered application
  #Then I can cancel the rectified application
  #And I cannot cancel the Land Charge application a second time
  
Scenario: Validate login 
Given I am on Land Charge and Bankruptcy services login page
Then I can login and choose an application type:
|user    |pword   |page	   |
|        | labour |		   |
|cssyt2c |        |lcreg   |
|cssyt2c | labour |bankreg |
|cssyt2c | labour |lcreg   |
|cssyt2c | labour |flsrch  |
|cssyt2c | labour |bksrch  |
|cssyt2c | labour |jiji33  |

#Scenario: LUS001/2 Correction of Land charge registration with central print option
#Given I am on Land Charge Registration applications screen
#When I have selected to view a specific Land Charges application from the application list
#When I input standard data for LC registration
#When I can choose complex names estate owner type and verify the details
#Then I can submit the LC application
#And I amend the LC application form
#And I can choose to print centrally

#Scenario: LUS001/2.1 Correction of Land charge registration with local print option
#Given I am on Land Charge Registration applications screen
#When I have selected to view a specific Land Charges application from the application list
#When I input standard data for LC registration
#When I can choose complex names estate owner type and verify the details
#Then I can submit the LC application
#And I amend the LC application form
#And I can choose to print locally

#Scenario: LUS001/2.2 Correction of Land charge registration with no option to print K22
#Given I am on Land Charge Registration applications screen
#When I have selected to view a specific Land Charges application from the application list
#When I input standard data for LC registration
#When I can choose complex names estate owner type and verify the details
#Then I can submit the LC application
#And I amend the LC application form
#And I can opt not to print K22





