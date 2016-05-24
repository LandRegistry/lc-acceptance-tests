Given(/^I am on the Land Charges renewal applications screen$/) do
  
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  maximise_browser
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_renewal" )
end


When(/^I select an application from the first row$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K7')
  end
  find(:id, "row_1").click
end

When(/^I can validate data presented on Original Registration details page$/) do
   within '#court' do
    page.should have_content 'Orange County Court'
  end
  within '#court_no' do
    page.should have_content '999'
  end
end

When(/^I parse a Land Charge application details for renewal$/) do
  fill_in('forename', :with => 'Joyce')
  fill_in('Surname', :with => 'Mayer')
  select 'C1', from:  "class"
  click_button "continue"
  fill_in('key_number', :with =>'2244095')
  fill_in('customer_ref', :with =>'2244095')
  choose "direct_debit"
    choose "dx_address"
  click_button "complete"
    
  results = page.find(:id, "conf_reg_numbers").text
  visit("#{$FRONTEND_URI}/get_list?appn=lc_renewal")
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K7')
  end
  find(:id, "row_1").click
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  fill_in('reg_no', :with => results)
  click_button('continue')
end

Then(/^I am on Conveyancer page$/) do
  expect(page).to have_content("Conveyancer")
end

Then(/^I can submit conveyancer details for the renewal$/) do
  fill_in('key_number', :with =>'2244095')
  fill_in('customer_ref', :with => '911')
  find(:id, 'direct_debit').click
    choose "dx_address"
end

Then(/^I can see the application successful message$/) do
 expect(page).to have_content("Your application has been successfully completed. Registration number is:")
end

