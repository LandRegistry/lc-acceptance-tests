@oc_api

Feature: Submit a Office Copy

Scenario: Request an Office Copy of insolvency data

  Given I have submitted a b2b request
  When I request an office copy
  Then I receive the office copy result