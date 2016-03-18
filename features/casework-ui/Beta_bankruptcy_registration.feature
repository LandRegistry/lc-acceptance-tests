@Beta @breg

Feature: Land Charges Registration

As a land charges caserworker
I want to be able to process a bankruptcy application form
So that I can ensure that details are captured correctly onto the land charges register database

Scenario: BUS-045 View images of bankruptcy registration forms 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
#When I click on a thumbnail the image is expanded to large image
#When I am on a Large image I can zoom in
#Then I am on a Large image I can zoom out

Scenario: #BUS-045 View single image on a bankruptcy registration screen
Given I am on the bankruptcy registration screen
When I select an application type of WOB with a single image
#And I should not see the thumbnail on the image
#When I am on a Large image I can zoom in
#Then I am on a Large image I can zoom out

Scenario: #BUS-046 #BUS-043 #BUS-042 #BUS-132 #BUS-131 Input bankruptcy registration details
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
Then I can click on Continue button to submit the form

Scenario: #BUS-132 #BUS-131 Input particulars of debtor
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I can click on Continue button to submit the form
When I can confirm that I am on the debtors details screen 
When I enter debtors name the details are visible
When I enter occupation the details are visible
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the second AKA the details are visible
When I enter the address the details are visible
When I click to add additional address new fields are visible
And can be completed
Then I can click on Continue button to submit the form

#EA: Step 4 of this test is no longer valid. Step commented out
Scenario: Return registered names
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter the specific court details
#Then the registered names are displayed on the screen

Scenario: #BUS-139 #BUS-130 #BUS-038 #BUS-053 Verify mandatory two stage name re-entry when completing a bankruptcy registration application 
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
When I enter court name the details are visible
When I enter court reference the details are visible
When I can click on Continue button to submit the form
When I can confirm that I am on the debtors details screen 
When I enter debtors name the details are visible
When I enter occupation the details are visible
When I click add AKA new fields are displayed
When I enter the first AKA the details are visible
When I enter the address the details are visible
When I can click on Continue button to submit the form
When I am on the verification screen I can rekey debtor's name
When I am on the verification screen I can change debtor's AKA name
When I am on the verification screen I can rekey court name
When I can click on Continue button to submit the form
#Then the susuccessfully completed Registration number is banner is displayed

Scenario: BUS-038 Confirm Bankruptcy registration number
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
Then I can confirm successful submission of details for a bankruptcy application

#Defect No:41
#Scenario: BUS-167 Verify two stage mandatory re-key 
#Given I am on the bankruptcy registration screen
#And I select an application type of PAB with a single image
#And I register a PAB application with AKA
#When I re-register with the previous registration details
#Then I can confirm that court details have already been used

#Defect No:41
#Scenario: BUS-167.0 Proceed to register bankruptcy even if two keyed details already exists
#Given I am on the bankruptcy registration screen
#And I select an application type of PAB with a single image
#And I register a PAB application with AKA
#And I re-register with the previous registration details
#When I can confirm that court details have already been used
#And I click Yes to continue with the bankruptcy registration
#Then I can confirm that I am on the debtors details screen 
#And I can submit a new bankruptcy registration 

#Defect No:41
#Scenario: BUS-165 Associate image of duplicate bankruptcy application
#Given I am on the bankruptcy registration screen
#And I select an application type of PAB with a single image
#And I register a PAB application with AKA
#And I re-register with the previous registration details
#When I can confirm that court details have already been used
#And I click No to discontinue with the bankruptcy registration
#Then I can choose a name
#And I can assign immage to the application

Scenario: BUS-082 Store application on Particulars of Debtor page of bank registration
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court name the details are visible
And I enter court reference the details are visible
And I can click on Continue button to submit the form
And I can enter name details
When I select option to return to the application later
Then I am on Store application page
And I can enter a reason
And I can click to store the reason

Scenario: BUS-082.1 Store application on details verification screen of bank registration
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court name the details are visible
And I enter court reference the details are visible
And I can click button to continue
And I can submit debtor details
And I can re-key debtor details
#EA: Next line needs to be included when IH deploys code for it
#When I select option to return to the application later
#Then I am on Store application page
#And I can enter a reason
#And I can click to store the reason

Scenario: BUS-082.2 Store application on Key Number page of bank registration
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court name the details are visible
And I enter court reference the details are visible
And I can click button to continue
And I can submit debtor details
And I can re-key debtor details
And I can click button to continue
#EA: Next line needs to be included when IH deploys code for it
#And I am on the Court screen I can enter a valid key number
#When I select option to return to the application later
#Then I am on Store application page
#And I can enter a reason
#And I can click to store the reason

Scenario: BUS-120 Reject Bankruptcy registration application
Given I am on the bankruptcy registration screen
And I select an application type of PAB with a single image
And I enter court name the details are visible
When I click on the link to reject application
Then I click Ok on the pop up
And I can see Confirmation message indicating the application has been rejected
#And I can confirm the number of applications remaining on worklist is one less

Scenario: Register WOB issued by adjudicator
Given I am on the bankruptcy registration screen
When I select an application type of WOB with a single image
And I enter court reference the details are visible
And I can click button to continue
Then I register the application
And I can click button to continue
And I can see the application successful message 

Scenario: Register PAB issued by adjudicator
Given I am on the bankruptcy registration screen
When I select an application type of PAB with a single image
And I enter court reference the details are visible
And I can click button to continue
Then I register the application
And I can click button to continue
And I can see the application successful message 




