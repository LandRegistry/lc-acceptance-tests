
Given(/^I have selected to view a specific record on the cancellation application list the individual record is display$/) do
  @regnote = create_registration
  visit($FRONTEND_URI)
  maximise_browser
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'//*[@id="app_type1"]').click
end 

Given(/^I launch Application Cancellation page$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
   maximise_browser
end 

When(/^I select the first registration application$/) do
  find(:xpath,'//*[@id="row_1"]').click
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
  #ALL CODE COMMENTED OUT AS div:nth-child(?) CHANGES DEPENDING ON WHICH PC/MAC THE CUCUMBER SCRIPT IS BEING RUN ON
 
  #sleep(1)
  #if is_gui?
   # find(:xpath, '//*[@id="container0"]/img[2]').click
  #else
   # find(:xpath, '//*[@id="container0"]/img[2]').trigger('click')
 # end
  

  #thing = find(:csspath, '#container0 > div:nth-child(5)')
  #expect(thing.text).to eq "2x Magnify"
  
  #expect(page).to have_content("Zoom In")

  find(:id, 'zoom_button').click
  
end 

When(/^I am on a Large image I can zoom out$/) do 
  
  #ALL CODE COMMENTED OUT AS div:nth-child(?) CHANGES DEPENDING ON WHICH PC/MAC THE CUCUMBER SCRIPT IS BEING RUN ON
  # if is_gui?
     #  find(:xpath, '//*[@id="container0"]/img[3]').click
 #  else
   #    find(:xpath, '//*[@id="container0"]/img[3]').trigger('click')
  # end
   #thing = find(:csspath, '#container0 > div:nth-child(5)')
 # expect(thing.text).to eq "1x Magnify"
 
  #OLD CODE THAT MIGHT HAVE WORKED BUT DOESN'T IN THIS PLACE
  #container0>div
  #all('.zoomcontrols')[0].click
  #container0 > div:nth-child(2)
  
  #expect(page).to have_content('Zoom Out')
  find(:id, 'zoom_button').click 

end 

When(/^I must have a registration number value before the continue button can be clicked$/) do 
  fill_in('reg_no', :with => @regnote)
 
end

When(/^I can click the Register cancellation button to go to the next screen$/) do
  click_button('submit')
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
  fill_in('key_number', :with =>'1234567')
  fill_in('customer_ref', :with => '911')
  find(:id, 'full_cans').click
  find(:id, 'direct_debit').click
  click_button('continue')
end

When(/^I attempt to resubmit a cancelled new application number$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
  #fill_in('ref_year', :with => '2013')
  click_button('continue')
  fill_in('forenames_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee')
  fill_in('occupation', :with => 'Dancer')
  fill_in('add_1_line1', :with => '123 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Winchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'SO14 1AA')
  click_button('continue')
  fill_in('forename_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee') 
  fill_in('court_name', :with => 'Northants County Court')
  click_button('continue')
  fill_in('key_number', :with =>'1234567')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
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

Then(/^I can see successful cancellation registration number$/) do
   find(:xpath,'//*[@id="row_1"]').click
   results = page.find(:id, "conf_reg_numbers").text
   fill_in('reg_no', :with => results)
end

Then(/^I can verify API output for a cancelled PAB application$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
  #fill_in('ref_year', :with => '2013')
  click_button('continue')
  fill_in('forenames_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee')
  fill_in('occupation', :with => 'Dancer')
  fill_in('add_1_line1', :with => '123 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Winchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'SO14 1AA')
  click_button('continue')
  fill_in('forename_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Lee') 
  fill_in('court_name', :with => 'Northants County Court')
  click_button('continue')
  fill_in('key_number', :with =>'1234567')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  thisday = Date.today.strftime("%Y-%m-%d")
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{thisday}/#{results}")
  expect(@pab_data['revealed']).to eql true
  expect(@pab_data['status']).to eql 'current'
  expect(@pab_data['class_of_charge']).to eql 'PAB'
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'//*[@id="row_1"]').click
  fill_in('reg_no', :with => results)
  Today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => Today)
  find(:id, 'full_cans').click
  click_button('continue')
  opage = "Original registration details"
  if ('//*[@id="form_panel"]/h2' == opage)
    click_button('continue')
    fill_in('key_number', :with =>'1234567')
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
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{thisday}/#{results}")
  expect(@pab_data['number']).to eql results
end

When(/^I select part cancellation option$/) do
  find(:id, 'part_cans').click
end

When(/^I choose the C4 cancellation option$/) do 
  pending #ensure D2 is deselected
end

When(/^I choose the D2 cancellation option$/) do 
  pending 
end

Then(/^I can enter additional information$/) do
  pending 
end

Then(/^I can attach a file$/) do
  pending 
end
