
Given(/^I am on the bankruptcy amendments screen$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_amend" )
  maximise_browser
end


When(/^I select an application type of WOB with a single image to amend$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('WOB')
  @formtype = 'WOB'
  puts(@formtype)
  end
  find(:id, "row_1").click
end


When(/^I enter the WOB reference number the details are visible$/) do
  fill_in('wob_ref', :with => '1004')
end

When(/^the wob date is visible$/) do
   fill_in('wob_date', :with => '28/02/2016')
end

When(/^I enter the PAB reference number the details are visible$/) do
  fill_in('pab_ref', :with => '1001')
end


When(/^the pab date is visible$/) do
   fill_in('pab_date', :with => '02/01/2016')
end

When(/^I enter the wrong WOB reference number the details are visible$/) do
    fill_in('wob_ref', :with => '1010')
end

Then(/^the wob error message is displayed$/) do
  expect(page).to have_content('No details held for WOB entered, please check and re-key')
end

When(/^I enter the wrong PAB reference number the details are visible$/) do
  fill_in('pab_ref', :with => '1010')
end

Then(/^the pab error message is displayed$/) do
  expect(page).to have_content('No details held for PAB entered, please check and re-key')
end


When(/^I click on the WOB change button I can rekey the wob details$/) do
 find(:id,'change_wob').click
end

When(/^I click on the PAB change button I can rekey the wob details$/) do
 find(:id,'change_pab').click
end

Then(/^I am on the registration check screen$/) do
  expect(page).to have_content('Please check the registrations affected by this amendment')
end

When(/^I am on the original bankruptcy details screen I can see the details are all completed$/) do
  pending # Write code here that turns the phrase above into concrete actions
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