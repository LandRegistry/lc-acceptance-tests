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