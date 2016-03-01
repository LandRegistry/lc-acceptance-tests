Given(/^I am on the bankruptcy registration screen$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  maximise_browser
end

When(/^I select an application type of PAB with a single image$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('PAB')
  @formtype = 'PAB'
  puts(@formtype)
  end
  find(:id, "row_1").click
end


When(/^I select an application type of WOB with a single image$/) do
  within(:xpath, ".//*[@id='row_4']/td[2]") do
  page.should have_content('WOB')
  @formtype = 'WOB'
  puts(@formtype)
  end
  find(:id, "row_4").click
end


When(/^I enter court name the details are visible$/) do
  fill_in('court', :with => 'County Court of Portsmouth')
end

When(/^I enter court reference the details are visible$/) do
  fill_in('ref_no', :with => '384')
end

When(/^I enter case year the details are visible$/) do
    fill_in('ref_year', :with => '2013')
end

When(/^I can confirm that I am on the debtors details screen$/) do
  expect(page).to have_content('Particulars of debtor')
end


When(/^I enter debtors name the details are visible$/) do
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forenames_1', :with => 'Javon')
  fill_in('surname_1', :with => 'Ryan')
    
end

When(/^I enter debtors name$/) do
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forenames_1', :with => 'John')
  fill_in('surname_1', :with => 'Paddy') 
end

When(/^I enter occupation the details are visible$/) do
    fill_in('occupation', :with => 'singer')
end

When(/^I click add AKA new fields are displayed$/) do
  find(:id, 'addname').click
end

When(/^I enter the first AKA the details are visible$/) do
  fill_in('forenames_2', :with => 'Barry')
  fill_in('surname_2', :with => 'Scottie')
end

When(/^I enter the second AKA the details are visible$/) do
  find(:id, 'addname').click
  fill_in('forenames_3', :with => 'Barrington')
  fill_in('surname_3', :with => 'Scottie-Dottie')
end

When(/^I enter the address the details are visible$/) do
  fill_in('add_1_line1', :with => '123 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Winchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'SO14 1AA')
end

When(/^I click to add additional address new fields are visible$/) do
  find(:id, 'add_address').click
end

When(/^can be completed$/) do
  fill_in('add_1_line1', :with => '123 Stoke Newington Church Street')
  fill_in('add_1_line2', :with => 'Middlebrooking')
  fill_in('add_1_line3', :with => 'Chinchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_2', :with => 'Hants')
  fill_in('postcode_2', :with => 'SO14 11AA')
end

When(/^I am on the verification screen I can rekey debtor's name$/) do
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forename_1', :with => 'Javon')
  fill_in('surname_1', :with => 'Ryan')
end

When(/^I can rekey debtor's name on the verification screen$/) do
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forename_1', :with => 'John')
  fill_in('surname_1', :with => 'Paddy')
end

When(/^I am on the verification screen I can change debtor's AKA name$/) do
  find(:id, 'change_debtor').click
  fill_in('forenames_2', :with => 'Javine')
  fill_in('surname_2', :with => 'Ryan')
end

When(/^I am on the verification screen I can view reference numbers$/) do
  expect(page).to have_content('384')
  expect(page).to have_content('2013')
end

When(/^I am on the verification screen I can rekey debtor's AKA name$/) do
  fill_in('forenames_2', :with => 'Javine')
  fill_in('surname_2', :with => 'Ryan')
  click_button('continue')
end

When(/^I am on the verification screen I can rekey court name$/) do
  fill_in('court_name', :with => 'County Court of Portsmouth')
end

When(/^I can rekey court name on the verification screen$/) do
  fill_in('court_name', :with => 'Northamptonshire County Court')
end

When(/^I am on the Court screen I can enter a valid key number$/) do
  fill_in('key_number', :with =>'1234567')
end


When(/^I can click the complete bankruptcy button$/) do
  click_button('continue')
end

When(/^I can confirm successful submission of details for a bankruptcy application$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
  fill_in('ref_year', :with => '2013')
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
end

When(/^I parse a new registration number as Original registration number$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
  fill_in('ref_year', :with => '2013')
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
   sleep(2)
   fill_in('reg_no', :with => results)
end
