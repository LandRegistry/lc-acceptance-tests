@amendment_api

Feature: Submit an amendment

Scenario: Request an amendment of a bankruptcy registration

  Given I have submitted a PAB
    And I have submitted a WOB
  When I submit an amendment application with the same names
    And I request details of the amended PAB and WOB
#  Then both applications are set to cancelled and not revealed on a search
# No longer the case

  Given I have submitted a PAB
    And I have submitted a WOB with a different name
  When I submit an amendment application with an additional name
    And I request details of the amended PAB and WOB
  Then both applications are set to cancelled but the PAB is set to reveal on a search

#  Given I have submitted a WOB
#  And I have submitted a PAB with a different name
#  When I submit an amendment application with an additional name
#  And I request details of the amended PAB and WOB
#  Then both applications are set to cancelled but the WOB is set to reveal on a search

  Given I have submitted a PAB
    And I have submitted a WOB
  When I submit an amendment application with an additional name
    And I request details of the amended PAB and WOB
  Then both applications are set to cancelled and both revealed on a search

  Given I have submitted a PAB
  When I submit a PAB only amendment application with a different name
    And I request details of the amended PAB
  Then the PAB is cancelled but is set to revealed on a search
