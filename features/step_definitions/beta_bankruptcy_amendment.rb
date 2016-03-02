
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
  expect(page).to have_content('Original bankruptcy details')
  #expect(page).to have_content('John Alan')
  #expect(page).to have_content('Smithe')
  fill_in('forenames_2', :with => 'John')
  fill_in('surname_2', :with => 'Smythe') 
end

When(/^I click on the remove address the details are no longer visible$/) do
  #expect(page).to have_content('2 new street')
 # page.should have_content('2 new street')
  
  find(:id,'remove_address_0').click
  
  #page.should have_no_content('2 new street')
  #expect(page).not_to have_content('2 new street')

end

When(/^I click the change details button on the check details screen$/) do
  find(:id, 'change_debtor').click
end

When(/^I amend an AKA name the new details are visible$/) do
  fill_in('forenames_3', :with => 'Barrington Boy')
  fill_in('surname_3', :with => 'Scottie-Dottie')
end

When(/^I click add AKA  on amendments a new fields are displayed$/) do
  find(:id, 'addname').click
end


When(/^I am returned to the confirm details screen I can then click continue$/) do
  expect(page).to have_content('Particulars of court')
  find(:id, 'continue').click
end

When(/^I click add AKA  on amendments a new fields are displayed and I can enter them$/) do
   find(:id, 'addname').click
  fill_in('forenames_3', :with => 'Barrington')
  fill_in('surname_3', :with => 'Scottie-Dottie')
end
