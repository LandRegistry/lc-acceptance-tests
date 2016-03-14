@Beta @sai

Feature: search application images

As a land charges caseworker 
I want to be able to view images of a search request that has been posted to LR
So that I can use the search request details when capturing a search application

Scenario: #BUS-010 View multiple images on a full search application screen
Given I am on the bankruptcy searches screen
When I select an application type of Full Search the application is displayed
When I click on a thumbnail the image is expanded to large image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-010 View single image on a full search application screen
Given I am on the bankruptcy searches screen
When I select a application type of Full Search with a single image
And I should not see the thumbnail on the image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out

Scenario: #BUS-009 View a single image on a Bankruptcy Search application screen
Given I am on the view application screen
When I have selected to view specific Bankruptcy application
When the image of the application is displayed I can click on all available pages
And I should not see the thumbnail on the image
When I am on a Large image I can zoom in
Then I am on a Large image I can zoom out
