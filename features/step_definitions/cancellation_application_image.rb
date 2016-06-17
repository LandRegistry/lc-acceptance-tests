
Given(/^I have selected to view a specific record on the cancellation application list the individual record is display$/) do
  @regnote = create_registration
  visit($FRONTEND_URI)
  maximise_browser
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'//*[@id="app_type1"]').click
end 

Given(/^I launch Application Cancellation page$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  
end 

When(/^I select the first available application form$/) do
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,*)]').click
end

When(/^I select a K13 registration application$/) do
  find(:xpath, "//*[@id='row_7']/td[2]").click
end

When(/^I click on a thumbnail the image is expanded to large image$/) do 
  find(:id, 'thumbnail1').click
  find(:id, 'thumbnail2').click
end

When(/^I should not see the thumbnail on the image$/) do 
  page.should have_no_selector(:xpath, "//img[@id='thumbnail1']")
end


When(/^I am on a Large image I can zoom in$/) do 
  find(:id, 'zoom_button').click
end 

When(/^I am on a Large image I can zoom out$/) do 
  find(:id, 'zoom_button').click 
end 

When(/^I must have a registration number value before the continue button can be clicked$/) do 
  fill_in('reg_no', :with => @regnote)
 
end

When(/^I submit the data$/) do
  click_button('complete')
end

Then(/^I can click the continue button to go to the next screen$/) do 
  if is_gui?
    find(:id, 'continue').click
  else
    find(:id, 'continue').trigger('click')
  end
end

Given(/^I am on the Application details screen$/) do 
 sleep(1)
  expect(page).to have_content('Review registration details')
end 

Given(/^I am on the Application retrieval screen$/) do 
  expect(page).to have_content('Retrieve original')
end 


When(/^the application details become visible they must be the correct ones for the registration number detailed on the previous screen$/) do 
  api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
  data = api.get("/registrations/#{@regnote}")
  forename = data['debtor_name']['forename']
  expect(page).to have_content(forename)
end 

When(/^the cancellation application has been submitted the unique identifier is displayed to the user on the screen$/) do 
  expect(page).to have_content('Confirmation')
  expect(page).to have_content('successfully submitted')
end 

Given(/^the application has been cancelled$/) do
  step "I have selected to view a specific record on the cancellation application list the individual record is display"
  step "I must have a registration number value before the continue button can be clicked"
  step "I can click the continue button to go to the next screen"
  step "I click the check box to confirm verification"
  step "I can click the Register cancellation button to go to the next screen"
end

When(/^we check the bankruptcy database record there must be a indicator for cancelled$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the indicator must have a value for cancelled$/) do
  api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
  data = api.get("/registration/#{@regnote}")
  expect(data['status']).to eql 'cancelled'
end 

When(/^I can retrieve the application details with valid data submitted$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  find(:id, 'full_cans').click
  click_button('continue')
  sleep(2)
end

When(/^I cannot retrieve the application details with Part Cancelation option selected$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  find(:id, 'part_cans').click
  click_button('continue')
end

Then(/^I can see Original registration details page$/) do
  expect(page).to have_content("Original registration details")
end

Then(/^I can submit conveyancer details$/) do
  fill_in('key_number', :with =>'2244095')
  fill_in('customer_ref', :with => '911')
  find(:id, 'full_cans').click
  find(:id, 'direct_debit').click
  click_button('continue')
end

Then(/^I can submit conveyancer details for the part cancellation$/) do
  fill_in('key_number', :with =>'2244095')
  sleep(5)
  fill_in('customer_ref', :with => '911')
  find(:id, 'direct_debit').click
end

When(/^I attempt to cancel the new application$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
  click_button('continue')
  fill_in('forenames_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee')
  fill_in('occupation', :with => 'Dancer')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee') 
  fill_in('court_name', :with => 'Northants County Court')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  #sleep(10)
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'//*[@id="row_1"]').click
  fill_in('reg_no', :with => results)
  Today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => Today)
  find(:id, 'full_cans').click
  click_button('continue')#first screen
  sleep(10)
  find(:id, 'continue').click
  #click_button('continue')#validation screen
  sleep(10)
  #click_button('continue')
  fill_in('key_number', :with =>'2244095')
  sleep(10)
  fill_in('customer_ref', :with => '911')
  find(:id, 'direct_debit').click
end

Then(/^I attempt to cancel the application a second time$/) do
  click_button('complete')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  sleep(20)
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'//*[@id="row_1"]').click
  fill_in('reg_no', :with => results)
  Today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => Today)
  find(:id, 'full_cans').click
  click_button('continue')
end

Then(/^I will still be on the application retrieval page$/) do
expect(page).to have_content("Retrieve original")
end

Then(/^I can see text to confirm the cancellation$/) do
expect(find(:id, 'regn_error').text).to have_content("Application has been cancelled or amended - please re-enter")
end

Then(/^I can see successful cancellation registration number$/) do
   find(:xpath,'//*[@id="row_1"]').click
   results = page.find(:id, "conf_reg_numbers").text
   fill_in('reg_no', :with => results)
end

Then(/^I can verify API output for a cancelled PAB application$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
  click_button('continue')
  fill_in('forenames_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee')
  fill_in('occupation', :with => 'Dancer')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee') 
  fill_in('court_name', :with => 'Northants County Court')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  thisday = Date.today.strftime("%Y-%m-%d")
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{thisday}/#{results}")
  #expect(@pab_data['revealed']).to eql true
    if @pab_data['expired_date'].nil?
        expect(true).to be_truthy
    else
        exdate = Date.strptime(@pab_data['expired_date'], '%Y-%m-%d')
        expect(exdate).to be > Date.today
    end
  expect(@pab_data['status']).to eql 'current'
  expect(@pab_data['class_of_charge']).to eql 'PAB'
  find(:xpath, "//*[@id='side-nav']/li[5]/a").click
  find(:id, 'canc').click
  find(:xpath,'//*[@id="row_1"]').click
  fill_in('reg_no', :with => results)
  Today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => Today)
  find(:id, 'full_cans').click
  click_button('continue')
  sleep(2)
  opage = "Original registration details"
  if ('//*[@id="form_panel"]/h2' == opage)
    click_button('continue')
    fill_in('key_number', :with =>'2244095')
    find(:id, 'full_cans').click
    find(:id, 'direct_debit').click
    fill_in('customer_ref', :with => '911')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  newresults = page.find(:id, "conf_reg_numbers").text
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{thisday}/#{newresults}")
  expect(@pab_data['revealed']).to eql true
  expect(@pab_data['status']).to eql 'superseded'
  expect(@pab_data['class_of_charge']).to eql 'PAB'
  end
end

Then(/^I can match the cancellation data with the api API output$/) do
  thisday = Date.today.strftime("%Y-%m-%d")
  results = page.find(:id, "conf_reg_numbers").text
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{thisday}/#{results}")
  expect(@pab_data['number']).to eql results
end

When(/^I select part cancellation option$/) do
  find(:id, 'part_cans').click
end

When(/^I choose the D2 cancellation option$/) do 
  pending 
end

When(/^I can opt to confirm plan attached$/) do 
   find(:id, "plan_attached").click
end

When(/^I can enter additional information$/) do 
   fill_in "part_cans_text", :with => "smile smile smile!"
end

When(/^I can reject the cancellation application form$/) do
  url = URI.parse(current_url)
  expect(page).to have_content('Retrieve original')
  expect(page).to have_content('Is this a full or part cancellation')
  find_link('reject').visible?
  click_link 'reject'
  click_button 'accept-reject'
  expect(page).to have_content('Your application has been rejected.')
  visit(url)
end
