Given(/^I am on the bankruptcy searches screen$/) do
  #@regnote = create_registration
  #puts @regnote
  visit($FRONTEND_URI)
  maximise_browser
  visit("#{$FRONTEND_URI}/get_list?appn=search" )
end

When(/^the image of the search application is displayed I can click on all available pages$/) do
  #find(:xpath, '//*[@id="container0]/img[1]').click
                 
end

Given(/^I am on the bankruptcy search details screen$/) do
  expect(page).to have_content('search')
  expect(page).to have_content('Forename')
  expect(page).to have_content('Second name to be searched')
  expect(page).to have_button('Continue')

end

When(/^I click on the name details tab I can enter six names for a bankruptcy search$/) do
    expect(page).to have_content('First name to be searched')
  fill_in('forename_1', :with => 'Ella')
  fill_in('surname_1', :with => 'Piggy')
  
  expect(page).to have_content('Second name to be searched')
  fill_in('forename_2', :with => 'Gonzo')
  fill_in('surname_2', :with => 'Great')
  
  find(:id,'add_name').click
  
  expect(page).to have_content('Third name to be searched')
  fill_in('forename_3', :with => 'Kermit')
  fill_in('surname_3', :with => 'Frog')
  find(:id,'add_name').click
  
  expect(page).to have_content('Fourth name to be searched')
  fill_in('forename_4', :with => 'Benjamin')
  fill_in('surname_4', :with => 'Fawkes')


  find(:id,'add_name').click

  expect(page).to have_content('Fifth name to be searched')
  fill_in('forename_5', :with => 'Kermit')
  fill_in('surname_5', :with => 'Frogson')
 find(:id,'add_name').click
  
  expect(page).to have_content('Sixth name to be searched')
  fill_in('forename_6', :with => 'Benjamin')
  fill_in('surname_6', :with => 'Fawkeson') 
end

When(/^I click continue the applicant details screen is displayed$/) do
  click_button('continue')
  expect(page).to have_content('Key number')
  expect(page).to have_content('Applicant name')
  expect(page).to have_content('Applicant address')
  expect(page).to have_content('Applicant reference')
  expect(page).to have_button('Complete')
  fill_in('key_number', :with => '1234567')
  fill_in('customer_ref', :with => '100/102')
end

Then(/^I can click the complete search button$/) do
  click_button('submit')
end

When(/^I select an application type of Search the application is displayed$/) do
  find(:id,'search_bank').click
  find(:id,'row_1').click
end
