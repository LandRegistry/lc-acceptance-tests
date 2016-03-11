Given(/^I am on the view application screen$/) do
  visit($FRONTEND_URI)
  maximise_browser
end

When(/^I have selected to view specific Bankruptcy application$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  find(:id, 'row_1').click
end

When(/^the image of the application is displayed I can click on all available pages$/) do
  expect(page).to have_xpath("//*[@id='container0']/img")
end

Given(/^I am on the debtors name and details screen$/) do
  expect(page).to have_content('Debtor details')
  puts('screen shows')
end

When(/^I complete the Forename and Surname details remain visible$/) do
  fill_in('forename', :with => 'Nicola')
  fill_in('surname', :with => 'Andrews')
end

When(/^I click add alternative name Alternative name is displayed with Forename\(s\) and Surname fields$/) do
  click_link('addname')
  fill_in('aliasforename0', :with =>'Nichola')
  fill_in('aliassurname0', :with => 'Andrews')
  click_link('addname')
  fill_in('aliasforename1', :with =>'Nicola')
  fill_in('aliassurname1', :with => 'Andrewson')
end

When(/^I amend a Forename the new details remain visable$/) do
  fill_in('forename', :with => 'Nicola Jayne')
end

Then(/^I amend the Surname of the Alias Surname and the new details remain visible$/) do
  fill_in('aliasforename0', :with => 'Nicola')
end

When(/^I enter an Occupation the details remain visible$/) do
  fill_in('occupation', :with => 'civil servant')
end

Given(/^I am on the debtors address screen$/) do
  expect(page).to have_content('Debtor address')
end

When(/^I supply the address details in the address fields they remain visible$/) do
  fill_in('add_0_line1', :with => '1 Addison Square')
  fill_in('add_0_line2', :with => 'Ringwood')
  fill_in('add_0_line3', :with => '')
  fill_in('add_0_county', :with => 'Hants')
  fill_in('add_0_postcode', :with => 'BH23 1NY')
end

When(/^I click the add address button further address fields are displayed$/) do
  find(:xpath, "//*[@id='form_panel']/fieldset/div[1]/label").click
  #check that address is displayed at top
end

When(/^I supply additional address details$/) do
  fill_in('add_1_line1', :with => '1 Longview Terrace')
  fill_in('add_1_line2', :with => 'Ringwood')
  fill_in('add_1_line3', :with => 'New Forest')
  fill_in('add_1_county', :with => 'Hants')
  fill_in('add_1_postcode', :with => 'BH23 1NY')
end

Given(/^I am on the case information screen$/) do
  expect(page).to have_content('Court details')
end

When(/^I first see the class of charge neither PAB or WOB are checked$/) do
  find_field("PA(B)").checked?
  find_field("WO(B)").checked?

end

When(/^I select a Class of Charge of PAB this becomes checked$/) do

  choose('PA(B)')
end

Then(/^I select a Class of Charge of WOB this becomes checked and PAB becomes unchecked$/) do
  choose('WO(B)')

end

When(/^I enter the key number the details remain visible$/) do
  fill_in('keyno', :with => '1357729')
end

When(/^I enter a court name the details remain visible$/) do
  fill_in('court', :with => 'Bournemouth County court')
end

When(/^I enter a court number and year the details remain visible$/) do
  fill_in('court_no', :with => '123')
  fill_in('court_year', :with => '2015')
end

When(/^I click the continue button the application verification page is displayed$/) do
  click_button('continue')
  expect(page).to have_content('Verify registration')
end

When(/^I click the verification checkbox$/) do
  find(:id, 'check_box').click
end


Then(/^I click the submit button and the application complete screen is displayed$/) do
  click_button('submit')
end


When(/^the Application has been submitted the unique identifier is displayed to the user on the screen$/) do
  expect(page).to have_content('Confirmation')
  #expect(page).to have_content('Reference(s)')
end

When(/^the Application has been submitted the date is displayed to the user on the screen$/) do
  current_date = Date.today
  date_format = current_date.strftime('%d.%m.%Y')
  puts(current_date)
  puts(date_format)
  registerdate = find(:id, 'registereddate').text
  puts(registerdate)
  expect(registerdate).to eq 'Registered on '+ date_format
end

Then(/^the user can return to the worklist$/) do
  click_link('worklist')
  sleep(1)
end
