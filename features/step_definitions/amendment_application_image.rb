Given(/^I have selected to view a specific record on the amendments application list the individual record is displayed$/) do
   #$regnote = create_registration
   $regnote = '50011'
  visit('http://localhost:5010')
  maximise_browser
  visit( "http://localhost:5010/get_list?appn=amend" )
    #find(:id,'amend_total').click
    find(:xpath,'html/body/div[1]/div/div/div[3]/div/table/tbody/tr[1]/td[1]').click
                 
end 

When(/^I am on the retrieve original documents  screen  the accompanying evidence is visible as thumbnails$/) do 
 page.should have_xpath('//*[@id="container0"]/img[1]')

end 

When(/^I must have a registration number before the continue button can be clicked$/) do 
   fill_in('reg_no', :with => $regnote)
   sleep(1)
end  

Given(/^I am on the bankruptcy details screen$/) do #amend details screen
  expect(page).to have_content('Amend details')
end 

When(/^I click on the reject button the next screen is displayed$/) do
  click_button('reject')
  expect(page).to have_content('Application Rejected')
  sleep(1)
end

When(/^I can click the amend button the system will go next screen$/) do
  expect(page).to have_content('Date Received')

end

Given(/^I am on the bankruptcy details worklist screen with amendments still listed$/) do
   #$regnote2 = create_registration
   $regnote2 = '50013'
   #find(:xpath,'html/body/div[1]/div/div/div[3]/div/table/tbody/tr[1]/td[1]').click
end

When(/^I must have a different registration number before the continue button can be clicked$/) do
  fill_in('reg_no', :with => $regnote2)
end

When(/^I am on the amend details screen I can click on the amend name button$/) do 
  find(:id, 'amend_name').click
end 


When(/^I click the add button for alias name the debtor alias name screen is displayed$/) do 
  find(:id, 'add_alias').click
end 

When(/^I enter the alias names$/) do 
  fill_in('forenames', :with => 'Sue')
  fill_in('surname', :with => 'Watchman')
end 

When(/^I enter the additional alias names$/) do
   fill_in('forenames', :with => 'Jack')
  fill_in('surname', :with => 'Jones')
end

When(/^I select an alias name and click the remove button the name is removed from the screen$/) do
  find(:id,'remove_alias_1').click
end

When(/^I click on the add button for address the address details screen is displayed$/) do 
  find(:id, 'add_address').click
end 

When(/^I enter the address details$/) do 
  fill_in('address1', :with => '1 long Street')
  fill_in('address2', :with => 'Plymouth')
  fill_in('county', :with => 'DEVON')
  fill_in('postcode', :with => 'PL1 1AB')
end

When(/^I am on the amend details screen I can click on the amend address button$/) do 
  find(:id,'amend_address_1').click 
end 

When(/^the address details screen is displayed I can overtype the details$/) do 
  fill_in('address1', :with => '1 longer changed Street') 
end 

When(/^I select an address and click the remove button the address is removed from the screen$/) do
  find(:id,'remove_address_1').click
end

When(/^I am on the amend details screen I can click on the amend court button$/) do 
 find(:id, 'amend_court').click 
end 

When(/^the court details screen is displayed I can overtype the details$/) do 
  fill_in('court', :with => 'Devon County Court')
  fill_in('ref', :with =>'123 2015')
  
end 

Then(/^I can click submit button to save all new information$/) do 
  find(:id, 'save_changes').click
end 

When(/^the amendments application has been submitted the unique identifier is displayed to the user on the screen$/) do
  date_format = Date.today.strftime('%d.%m.%Y')
  registereddate = find(:id, 'registereddate').text
  puts(registereddate)
  expect(registereddate).to eq 'Registered on '+ date_format
end

Given(/^the application has been amended$/) do
   $regnote3 = '50016'
   find(:id,'app_type1').click
   fill_in('reg_no', :with => $regnote3)
   click_button('continue')
   click_button('save_changes')
   step "the user can return to the worklist"
end

When(/^we check the bankruptcy database record there must be a indicator for amended$/) do
  #pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the indicator must have a value for amended$/) do
  PostgreSQL.connect('landcharges')
  result = PostgreSQL.query("SELECT a.cancelled_by FROM register_details a, register b WHERE b.registration_no=#{$regnote2} AND b.details_id = a.id")
  expect(result.values[0][0]).not_to be_empty
end

When(/^I can click on the submit button to go to the next screen$/) do
  click_button('Submit')
end

Given(/^I have selected to view a specific record from the worklist$/) do
  find(:id,'app_type1').click
end
