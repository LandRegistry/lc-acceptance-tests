Given(/^I am on the bankruptcy correction screen$/) do
  
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
  visit( "#{$FRONTEND_URI}/correction" )
 
end

When(/^I submit data to retrieve the registration details$/) do
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
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  visit( "#{$FRONTEND_URI}/correction" )
  maximise_browser
  fill_in('reg_no', :with => results)
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  click_button('continue')
end


Then(/^I can validate data returned on Orginal bankruptcy details page$/) do
  expect(page).to have_content('Bankruptcy details')
  expect(page).to have_content('Please view application in Image Retrieval if required')
  expect(page).to have_field('forenames_1', :with => 'Johnny')
  expect(page).to have_field('surname_1', :with => 'Lee')
  expect(page).to have_field('add_1_line1', :with => '123 New Street')
  expect(page).to have_field('court', :with => 'Northants County Court')
  expect(page).to have_field('ref_no', :with => '911')
end

When(/^I can amend relevant details on Original bankruptcy details page$/) do
  fill_in('forenames_1', :with => 'Peter')
  fill_in('surname_1', :with => 'Piper')
  find(:id, 'addname').click
  fill_in('forenames_2', :with => 'John')
  fill_in('surname_2', :with => 'Taylor')
  #find(:id, 'add_address').click
  #find(:id, 'remove_address_1').click  
  fill_in('court', :with => 'Orange County Court')
  fill_in('ref_no', :with => '999')
end

When(/^I validate details submitted on Check details page$/) do
   within '#court' do
    page.should have_content 'Orange County Court'
  end
  within '#court_no' do
    page.should have_content '999'
  end
end

Then(/^I can verify K22 option is selected by default on Check details page/) do
  expect(find_field("generate_K22_no")).to be_checked
end

Then(/^I can choose option to suppress K22$/) do
  find(:id, 'generate_K22_yes').click
end


Then(/^I can click on Complete button$/) do
  find(:id, 'complete').click
end

Then(/^I can confirm the correction was successful$/) do
  expect(page).to have_content('Your application has been successfully corrected!')
end

Then(/^I can confirm the correction was successful$/) do
  expect(page).to have_content('Your application has been successfully corrected!')
end