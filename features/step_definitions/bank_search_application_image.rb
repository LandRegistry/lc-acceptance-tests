Given(/^I am on the bankruptcy searches screen$/) do
  #@regnote = create_registration
  #puts @regnote
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
  visit($FRONTEND_URI)
  maximise_browser
  visit("#{$FRONTEND_URI}/get_list?appn=search" )
end

Given(/^I am on the LR searches screen$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  visit($FRONTEND_URI)
  maximise_browser
  visit("#{$FRONTEND_URI}/get_list?appn=search" )
end

When(/^I click to launch Bankruptcy search and select a record$/) do
  find(:id,'search_bank').click
  find(:id,'row_1').click
end

When(/^I click on the Pre paid button$/) do
  find(:id, 'pre_paid').click
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

When(/^I enter Names in all fields on Input details page$/) do
    expect(page).to have_content('First name to be searched')
  fill_in('forename_1', :with => 'Ella')
  fill_in('surname_1', :with => 'Piggy')
  
  expect(page).to have_content('Second name to be searched')
  fill_in('forename_2', :with => 'Gonzo')
  fill_in('surname_2', :with => 'Great')
end

When(/^I enter Name in one of the fields on Input details page$/) do
    expect(page).to have_content('First name to be searched')
  fill_in('forename_1', :with => 'Ella')
  fill_in('surname_1', :with => 'Piggy')
end

When(/^I enter an Applicant reference number$/) do
  fill_in('customer_ref', :with => 'B123/239')
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

When(/^I click on continue button$/) do
  find(:id, 'continue').click
end

When(/^I can see Specify County error message flagged up$/) do
  expect(page).to have_content('Please specify a county choice')
end

Then(/^I can see Applicant data input fields for the Bankruptcy search request$/) do
  expect(page).to have_content('Key number')
  expect(page).to have_content('Applicant name')
  expect(page).to have_content('Applicant address')
  expect(page).to have_content('Applicant reference')
end

When(/^I click continue the applicant details screen is displayed$/) do
  click_button('continue')
  expect(page).to have_content('Key number')
  expect(page).to have_content('Applicant name')
  expect(page).to have_content('Applicant address')
  expect(page).to have_content('Applicant reference')
  expect(page).to have_button('Complete')
  fill_in('key_number', :with => '2244095')
  fill_in('customer_ref', :with => '100/102')
end

When(/^I enter valid values in Key number field$/) do
  fill_in('key_number', :with => '2244095')
end

Then(/^I can override it with new address details$/) do
  fill_in('customer_name', :with => '13 Shambles Street')
end

When(/^I enter invalid values in Key number field$/) do
  fill_in('key_number', :with => '123U1')
end

Then(/^I can see the expected values prepopulated in Applicant name field$/) do
    sleep(5)
    expect(find(:id, 'customer_name').value).to include('LOUIS LEY & MAYCOCK NON CREDIT')
end

Then(/^I can see the expected values prepopulated in Address field$/) do 
  expect(find(:id, 'customer_address').value).to eq 'DX 8249' "\n" 'PLYMOUTH 3'
end

When(/^I enter an invalid value in Key number field$/) do
  fill_in('key_number', :with => '123U1')
end

Then(/^I can see NO values prepopulated in Applicant name field$/) do
  name = '' 
  expect(name).to eq page.find_field("customer_name").value  
end

Then(/^I can see NO values prepopulated in Address field$/) do
  address = ''
  expect(address).to eq page.find_field("customer_address").value
end

Then(/^I can click the complete search button$/) do
  click_button('submit')
end

Then(/^I can confirm via api that certificate stored date is in the past$/) do
  date = Date.today
  tday = date.strftime("%Y-%m-%d")
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @search_result = @reg_api.get("/last_search")
  rqst_id = @search_result['request_id']
  @srch_details = @reg_api.get("/request_details/#{rqst_id}")
  expect(@srch_details['request_id']).to eq rqst_id
  expect(@srch_details['certificate_date']).to be < tday
end

When(/^I select an application type of Search the application is displayed$/) do
  find(:id,'search_bank').click
  find(:id,'row_1').click
end

Then(/^I can confirm that certificate date stored in database SHOULD NOT be today's$/) do
  PostgreSQL.connect('landcharges')
  cert_date = PostgreSQL.query("SELECT certificate_date FROM search_details")
  today = (Date.today).strftime("%Y-%m-%d")
  row = cert_date.values[0]
  expect(row[0]).should_not eq today #should be less than today
  PostgreSQL.disconnect
end

Then(/^I can confirm that the search expiry date stored in database should be in the future$/) do
  PostgreSQL.connect('landcharges')
  cert_date = PostgreSQL.query("SELECT expiry_date FROM search_details ORDER BY search_timestamp DESC LIMIT 1")
  today = (Date.today).strftime("%Y-%m-%d")
  row = cert_date.values[0]
  expect(row[0]).to be > today
  PostgreSQL.disconnect
end

Then(/^I am returned to the LR searches screen$/) do
  expect(page).to have_content('Search')
  expect(page).to have_content('Full')
  expect(page).to have_content('Bankruptcy')
end
