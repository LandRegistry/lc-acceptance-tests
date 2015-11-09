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
  expect(page).to have_content('Bankruptcy Search')
  expect(page).to have_content('Full Name')
  expect(page).to have_content('Complete the debtor')
  expect(page).to have_button('Complete Search')

end

When(/^I click on the name details tab I can enter six names$/) do
  sleep(1)
  fill_in('fullname0', :with => 'Miss Piggy')
  fill_in('fullname1', :with => 'Gonzo')
  fill_in('fullname2', :with => 'Kermit T Frog')
  fill_in('fullname3', :with => 'Rolfe')
  fill_in('fullname4', :with => 'Animal')
  fill_in('fullname5', :with => 'Beaker')
end

When(/^I click on the Customer details tab I can enter the key number Customer Name Customer Address Customer Reference$/) do
  click_link('Customer Details')
  expect(page).to have_content('Key Number')
  expect(page).to have_content('Customer Name')
  expect(page).to have_content('Customer Address')
  expect(page).to have_content('Customer Reference')
  expect(page).to have_button('Complete Search')
  fill_in('Key Number', :with => '1234567')
  fill_in('customer_ref', :with => '100/102')
end

Then(/^I can click the complete search button$/) do
  sleep(1)
  click_button('search')
  sleep(1)
end


