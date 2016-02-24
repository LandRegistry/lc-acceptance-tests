
Given(/^I am on the bankruptcy amendments screen$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_amend" )
  maximise_browser
end


When(/^I select an application type of LRRABO with a single image$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('LRRABO')
  @formtype = 'LRRABO'
  puts(@formtype)
  end
  find(:id, "row_1").click
end

When(/^I select an amendment application type the application images are displayed$/) do
  within(:xpath, ".//*[@id='row_2']/td[2]") do
  page.should have_content('6.14')
  @formtype = '6.14'
  puts(@formtype)
  end
  find(:id, "row_2").click
end

When(/^I click on the remove address the details are no longer visible$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I overtype a new with blanks and click continue an error message is displayed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I amend an AKA name the new details are visible$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


When(/^I enter the PAB reference number the details are visible$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I am on the original bankruptcy details screen I can see the details are all completed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I enter the WOB reference number the details are visible$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the date is visible$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

