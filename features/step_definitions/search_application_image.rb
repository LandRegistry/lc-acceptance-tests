Given(/^I am on the bankruptcy searches screen$/) do
  @regnote = create_registration
  visit($FRONTEND_URI)
  maximise_browser
  visit("#{$FRONTEND_URI}/get_list?appn=search" )
end

When(/^the image of the search application is displayed I can click on all available pages$/) do
  #find(:xpath, '//*[@id="container0]/img[1]').click
                 
end

Given(/^I am on the bankruptcy search details screen$/) do
  expect(page).to have_content('search')
  expect(page).to have_content('Full name')
  expect(page).to have_content('Name(s) to be searched')
  expect(page).to have_button('Continue')

end

When(/^I click on the name details tab I can enter six names$/) do
  sleep(1)
  fill_in('fullname0', :with => 'Miss Piggy')
  fill_in('fullname1', :with => 'Gonzo T Great')
  fill_in('fullname2', :with => 'Kermit T Frog')
  fill_in('fullname3', :with => 'Rolfe')
  fill_in('fullname4', :with => 'Animal')
  fill_in('fullname5', :with => 'Beaker')
end

When(/^I click continue the customer details screen is displayed$/) do
  click_button('continue')
  expect(page).to have_content('Key number')
  expect(page).to have_content('Customer name')
  expect(page).to have_content('Customer address')
  expect(page).to have_content('Customer reference')
  expect(page).to have_button('Submit search')
  fill_in('key_number', :with => '1234567')
  fill_in('customer_ref', :with => '100/102')
end

Then(/^I can click the complete search button$/) do
  sleep(1)
  click_button('search')
  sleep(1)
end

When(/^I select an application type of Search the application is displayed$/) do
  find(:id,'app_type3').click
end
