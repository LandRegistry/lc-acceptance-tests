Given(/^I am on the bankruptcy amendments screen$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_amend" )
  maximise_browser
end


When(/^I select an application type of WOB with a single image to amend$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('WO(B) Amend')
  end
  find(:id, "row_1").click
end


When(/^I retrieve a newly created WOB select an application type of WOB with a single image to amend$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('WO(B) Amend')
  @formtype = 'WOB'
  puts(@formtype)
  end
  find(:id, "row_1").click
end


When(/^I enter the WOB reference number the details are visible$/) do
  fill_in('wob_ref', :with => '1006')
end

When(/^I enter a PAB reference number for the amendment$/) do
  fill_in('pab_ref', :with => '1003')
end

When(/^the wob date is visible$/) do
   fill_in('wob_date', :with => '04/03/2016')
end


When(/^I enter the PAB reference number the details are visible$/) do
  fill_in('pab_ref', :with => '1001')
end

When(/^the pab date is visible$/) do
   fill_in('pab_date', :with => '02/01/2016')
end

When(/^I enter date for the PAB amendment$/) do
   fill_in('pab_date', :with => '02/01/2016')
end

When(/^I amend the registration record$/) do
   fill_in('forenames_2', :with => '')
   fill_in('surname_2', :with => '')
end
 
When(/^I enter the wrong WOB reference number the details are visible$/) do
    fill_in('wob_ref', :with => '1010')
end

Then(/^the wob error message is displayed$/) do
  expect(page).to have_content('No details held for WOB entered, please check and re-key')
end

When(/^I enter the wrong PAB reference number the details are visible$/) do
  fill_in('pab_ref', :with => '1010')
end

Then(/^the pab error message is displayed$/) do
  expect(page).to have_content('No details held for PAB entered, please check and re-key')
end


When(/^I click on the WOB change button I can rekey the wob details$/) do
 find(:id,'change_wob').click
end

When(/^I click on the PAB change button I can rekey the wob details$/) do
 find(:id,'change_pab').click
end

Then(/^I am on the registration check screen$/) do
  expect(page).to have_content('Please check the registrations affected by this amendment')
end

When(/^I am on the original bankruptcy details screen I can see the details are all completed$/) do
  expect(page).to have_content('Original bankruptcy details')
  #expect(page).to have_content('John Alan')
  #expect(page).to have_content('Smithe')
  fill_in('forenames_2', :with => 'John')
  fill_in('surname_2', :with => 'Smythe') 
end

When(/^I click on the remove address the details are no longer visible$/) do
  #expect(page).to have_content('2 new street')
 # page.should have_content('2 new street')
  
  find(:id,'remove_address_0').click
  
  #page.should have_no_content('2 new street')
  #expect(page).not_to have_content('2 new street')

end

When(/^I click the change details button on the check details screen$/) do
  find(:id, 'change_debtor').click
end

When(/^I amend an AKA name the new details are visible$/) do
  fill_in('forenames_3', :with => 'Barrington Boy')
  fill_in('surname_3', :with => 'Scottie-Dottie')
end

When(/^I click add AKA  on amendments a new fields are displayed$/) do
  find(:id, 'addname').click
end


When(/^I am returned to the confirm details screen I can then click continue$/) do
  expect(page).to have_content('Particulars of court')
  find(:id, 'continue').click
end

When(/^I click add AKA  on amendments a new fields are displayed and I can enter them$/) do
   find(:id, 'addname').click
  fill_in('forenames_3', :with => 'Barrington')
  fill_in('surname_3', :with => 'Scottie-Dottie')
end

When(/^I amend Court name and number$/) do
   fill_in('court', :with => '')
  fill_in('court', :with => 'Exeter County Court')
  fill_in('ref_no', :with => 'Bournemouth County court')
end

Then(/^I can submit amended form and verify the new api updates for the amendment$/) do
  fill_in('key_number', :with =>'1234567')
   click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  newregs = page.find(:id, "conf_reg_numbers").text
  todaysdate = Date.today.strftime("%Y-%m-%d")
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{todaysdate}/#{newregs}")
  expect(@pab_data['class_of_charge']).to eql 'PAB'
  expect(@pab_data['revealed']).to eql true
  expect(@pab_data['status']).to eql 'current'
end

Then(/^I can verify api output for a newly amended PAB registration$/) do
  fill_in('court', :with => 'Mango County Court')
  fill_in('ref_no', :with => '932')
  #fill_in('ref_year', :with => '2016')
  click_button('continue')
  fill_in('forenames_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Depp')
  fill_in('occupation', :with => 'Dancer')
  fill_in('add_1_line1', :with => '123 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Winchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'SO14 1AA')
  click_button('continue')
  fill_in('forename_1', :with => 'Johnny')
  fill_in('surname_1', :with => 'Depp') 
  fill_in('court_name', :with => 'Mango County Court')
  click_button('continue')
  fill_in('key_number', :with =>'1234567')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  newregs = page.find(:id, "conf_reg_numbers").text
  todaysdate = Date.today.strftime("%Y-%m-%d")
  find(:id, 'bank_amend').click
  find(:id, "row_1").click
  fill_in('pab_ref', :with => newregs)
  fill_in('pab_date', :with => todaysdate)
  click_button('continue')
  #expect(page).to have_content('Original bankruptcy details')
  #fill_in('court', :with => 'Orange County Court')
  #fill_in('ref_no', :with => '777')
  #fill_in('key_number', :with =>'1234567')
  #click_button('continue')
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{todaysdate}/#{newregs}")
  expect(@pab_data['class_of_charge']).to eql 'PAB'
  expect(@pab_data['revealed']).to eql true
  expect(@pab_data['status']).to eql 'current'
end

Then(/^I can verify api output for a newly amended PAB registration$/) do
  
  page.find(:id, "conf_reg_numbers").text
  newregs = page.find(:id, "conf_reg_numbers").text
  todaysdate = Date.today.strftime("%Y-%m-%d")
  find(:id, 'bank_amend').click
  find(:id, "row_1").click
  fill_in('pab_ref', :with => newregs)
  fill_in('pab_date', :with => todaysdate)
  click_button('continue')
  #expect(page).to have_content('Original bankruptcy details')
  #fill_in('court', :with => 'Orange County Court')
  #fill_in('ref_no', :with => '777')
  #fill_in('key_number', :with =>'1234567')
  #click_button('continue')
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @pab_data = @reg_api.get("/registrations/#{todaysdate}/#{newregs}")
  expect(@pab_data['class_of_charge']).to eql 'PAB'
  expect(@pab_data['revealed']).to eql true
  expect(@pab_data['status']).to eql 'current'
end