Given(/^I have selected to view a specific record on the cancellation application list the individual record is display$/) do
  @regnote = create_registration
  visit($FRONTEND_URI)
  maximise_browser
  visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
  find(:xpath,'/html/body/div/div/div/div[3]/div/table/tbody/tr[1]/td[1]/a').click              
end 

When(/^I click on a thumbnail the image is expanded to large image$/) do 
  #find(:id, 'thumbnail_1').click
 find(:xpath, '//*[@id="thumbnails"]/img[1]').click
end



When(/^I am on a Large image I can zoom in$/) do 
  sleep(1)
  if is_gui?
    find(:xpath, '//*[@id="container0"]/img[2]').click
  else
    find(:xpath, '//*[@id="container0"]/img[2]').trigger('click')
  end

  thing = find(:csspath, '#container0 > div:nth-child(2)')
  expect(thing.text).to eq "2x Magnify"
end 

When(/^I am on a Large image I can zoom out$/) do 
   if is_gui?
       find(:xpath, '//*[@id="container0"]/img[3]').click
   else
       find(:xpath, '//*[@id="container0"]/img[3]').trigger('click')
   end
   
  #container0>div
  #all('.zoomcontrols')[0].click
  #container0 > div:nth-child(2)
   
 thing = find(:csspath, '#container0 > div:nth-child(2)')
  expect(thing.text).to eq "1x Magnify"
end 

When(/^I must have a registration number value before the continue button can be clicked$/) do 
  fill_in('reg_no', :with => @regnote)
 
end

Then(/^I can click the continue button to go to the next screen$/) do 
  click_button('continue')
end 

Given(/^I am on the Application details screen$/) do 
 sleep(1)
  expect(page).to have_content('Application details')
end 

When(/^the application details become visible they must be the correct ones for the registration number detailed on the previous screen$/) do 
  PostgreSQL.connect('landcharges')
  # puts(@regnote)
  result = PostgreSQL.query("SELECT a.surname FROM party_name a, register b WHERE 
    b.registration_no=#{@regnote} AND b.debtor_reg_name_id = a.id")
  expect(page).to have_content(result.values[0][0])
end 

When(/^the cancellation application has been submitted the unique identifier is displayed to the user on the screen$/) do 
  expect(page).to have_content('been cancelled:')
  date_format = Date.today.strftime('%d.%m.%Y')
  canceldate = find(:id, 'canceldate').text
  # puts(canceldate)
  expect(canceldate).to eq 'Cancelled on '+ date_format
  # page.has_content?('Cancelled on '+ date_format)
end 

Given(/^the application has been cancelled$/) do
  step "I have selected to view a specific record on the cancellation application list the individual record is display"
  step "I must have a registration number value before the continue button can be clicked"
  step "I can click the continue button to go to the next screen" #continue button of first screen
  step "I can click the continue button to go to the next screen" #continue button on second screen
end

When(/^we check the bankruptcy database record there must be a indicator for cancelled$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the indicator must have a value for cancelled$/) do
  PostgreSQL.connect('landcharges')
  result = PostgreSQL.query("SELECT a.cancelled_by FROM register_details a, register b WHERE 
    b.registration_no=#{@regnote} AND b.details_id = a.id")
  expect(result.values[0][0]).not_to be_empty
end 
