Given(/^I have selected to view a specific record on the cancellation application list the individual record is display$/) do
  @regnote = create_registration
  visit($FRONTEND_URI)
  maximise_browser
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'//*[@id="app_type1"]').click
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
