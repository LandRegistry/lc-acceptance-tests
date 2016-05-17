When(/^I have selected to view a K four Land Charges application from the application list$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  within(:xpath, ".//*[@id='row_7']/td[2]") do
  page.should have_content('K4')
  @formtype = 'K4'
  puts(@formtype)
  end
  find(:id, "row_7").click
end

When(/^I access the application screen for a K(\d+) the class type is set to WO$/) do |arg1|
 #expect class
end

When(/^I navigate to Land Charge application store page$/) do 
 find(:id, "lc_stored").click
end

Then(/^I can validate number displayed before and after a Land Charge application is stored$/) do
  bnkstre = all('#work-list').count
   find(:id, "lc_regn").click
   page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
   if @formtype == 'K1'
    select 'LC', from:  "class"
  elsif  @formtype == 'K2'
    select 'F', from:  "class"
  elsif  @formtype == 'K3'
    select 'PA', from:  "class"
  elsif  @formtype == 'K4'
    select 'WO', from:  "class"  
  elsif  @formtype == 'K6'
    select 'LC', from:  "class"    
  else
    nil
  end  
  fill_in('pri_notice',:with =>'127')
  fill_in('county_0', :with => 'Poole')
  fill_in('District',:with => 'Devon')
  fill_in('short_desc', :with =>'free format2werslkfxdlkf')
  fill_in('forename', :with => 'Joyce')
  fill_in('Surname', :with => 'Mayer')
  fill_in('occupation',:with => 'preacher')
  click_button "continue"
  fill_in('forename', :with => 'Joyce')
    fill_in('Surname', :with => 'Mayer')
    select 'C1', from:  "class"
    click_button "continue"
    fill_in('key_number', :with =>'2244095')
    find(:xpath, "//*[@id='store']").click
  expect(page).to have_content('Store application')
  fill_in('store_reason', :with => 'Amazing QAs!')
  click_button('store')
  find(:id, "lc_stored").click
  bnkstre2 = all('#work-list').count
  expect(bnkstre2).to eq bnkstre + 1
end

When(/^I store a new Land Charge application$/) do
  find(:id, "lc_regn").click
   page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
   if @formtype == 'K1'
    select 'LC', from:  "class"
  elsif  @formtype == 'K2'
    select 'F', from:  "class"
  elsif  @formtype == 'K3'
    select 'PA', from:  "class"
  elsif  @formtype == 'K4'
    select 'WO', from:  "class"  
  elsif  @formtype == 'K6'
    select 'LC', from:  "class"    
  else
    nil
  end  
  fill_in('pri_notice',:with =>'127')
  fill_in('county_0', :with => 'Poole')
  fill_in('District',:with => 'Devon')
  fill_in('short_desc', :with =>'free format2werslkfxdlkf')
  fill_in('forename', :with => 'Joyce')
  fill_in('Surname', :with => 'Mayer')
  fill_in('occupation',:with => 'preacher')
  click_button "continue"
  fill_in('forename', :with => 'Joyce')
    fill_in('Surname', :with => 'Mayer')
    select 'C1', from:  "class"
    click_button "continue"
    fill_in('key_number', :with =>'2244095')
    find(:xpath, "//*[@id='store']").click
  expect(page).to have_content('Store application')
  fill_in('store_reason', :with => 'Amazing QAs!')
  click_button('store')
  find(:id, "lc_stored").click
end

When(/^I retrieve and submit the newly stored applcation$/) do
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  click_button "continue"
  fill_in('forename', :with => 'Joyce')
  fill_in('Surname', :with => 'Mayer')
  select 'C1', from:  "coc"
  click_button "continue"
  fill_in('key_number', :with =>'2244095')
  choose 'direct_debit'
  click_button('submit')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  find(:id, "lc_rect").click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  fill_in('reg_no', :with => results)
end

When(/^I can rectify the newly registered application$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  click_button('continue')
  click_button('continue')
  click_link 'change_class'
   select 'LC', from:  "class"
   click_button('continue')
   click_button('continue')
   fill_in('key_number', :with =>'2244095')
  choose 'direct_debit'
  click_button('submit')
  expect(page).to have_content('Your application has been successfully completed. Registration number is:')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  find(:xpath, "//*[@id='side-nav']/li[5]/a").click
  find(:id, 'canc').click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  fill_in('reg_no', :with => results) 
end

When(/^I can cancel the rectified application$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  find(:id, 'full_cans').click
  click_button('continue')
  click_button('continue')
  click_button('continue')
   fill_in('key_number', :with =>'2244095')
  fill_in('customer_ref', :with =>'213/REC')
  find(:id, 'direct_debit').click
  click_button('submit')
  results = page.find(:id, "conf_reg_numbers").text
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  fill_in('reg_no', :with => results) 
end

When(/^I cannot cancel the Land Charge application a second time$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  click_button('continue')
  expect(page).to have_content('Registration has been cancelled - please re-enter')
end

When(/^I cannot renew the Land Charge application a second time$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  click_button('continue')
end

When(/^I am on Land Charge and Bankruptcy services login page$/) do
  maximise_browser
  visit("#{$FRONTEND_URI}/login")
end

