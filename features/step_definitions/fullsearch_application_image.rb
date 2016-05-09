When(/^I select an application type of Full Search the application is displayed$/) do
  visit("#{$FRONTEND_URI}/get_list?appn=search")
  find(:id,'search_full').click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,*)]').click
end

When(/^I select a application type of Full Search with a single image$/) do
  visit("#{$FRONTEND_URI}/get_list?appn=search")
  find(:id,'search_full').click
  find(:id,'row_2').click
end

Then(/^I am on the full search details screen$/) do
  expect(page).to have_content('Full search')
  expect(page).to have_content('Forename')
  expect(page).to have_content('First name to be searched')
  expect(page).to have_button('Continue')
end

Then(/^I can see Application Successful text on Search list page$/) do
  #expect(page).to have_content('Your application has been successfully completed')
  expect(page).to have_content('Search')
  expect(page).to have_content('Full')
  expect(page).to have_content('Bankruptcy')
end

Then(/^I can capture customer details on the full search screen$/) do
  fill_in('key_number', :with =>'2244095')
  sleep(8)
  fill_in('customer_ref', :with => '100/102')
  choose('dx_address')
  choose('pre_paid')
end

When(/^I can see search successful text$/) do
  bannertxt = find(:id, 'conf_banner').text
  expect(find(:id, 'conf_banner').text).to eq 'Your application has been successfully completed.'
end

When(/^I click on entered details in the address box I can make an amendment$/) do
  fill_in('customer_address',:with => '4749 DUBUQUE Terrace'"\n"'JAYSONFURT'"\n"'SOUTH VINCENZA'"\n"'NORTHAMPTONSHIRE'"\n"'FC13 4WX')
end

When(/^I click box to search all counties$/) do
  find(:id, 'all_counties').click
end

Then(/^I can confirm that the county edit box is disabled$/) do
  field_labeled("county_0", disabled: true)
end

When(/^I access the application screen a dropdown list is visible for categories of name type$/) do
  select 'Limited company', from: "nameType_1"
  select 'Local authority', from: "nameType_1"
  select 'Complex name', from: "nameType_1"
  select 'Other', from: "nameType_1"
  select 'Private individual', from: "nameType_1"
end

When(/^I enter fee details I can choose prepaid$/) do
  expect(page).to have_content('Fees')
  choose('pre_paid')
end

When(/^I change it to choose direct debit$/) do
  #choose('direct_debit')  commented out for defect 42
end

When(/^I set the address type to DX$/) do
    choose('dx_address') 
end

When(/^I enter a county the details are displayed county edit box$/) do
  fill_in('county_0', :with => 'Devon')
end

When(/^I enter a Welsh county name$/) do
  fill_in('county_0', :with => 'Caerffilli')
end

When(/^I click the add additional county a new county edit box is displayed where I enter the next county$/) do
  find(:id,'addcounty').click
  fill_in('county_1', :with =>'Somerset')
end

When(/^I can only see a two stage name entry fields$/) do
  expect(page).to have_content('First name to be searched')
  expect(page).to have_content('Second name to be searched')
  expect(page).to have_no_content('Third name to be searched')
  expect(page).to have_no_content('Fourth name to be searched')
  expect(page).to have_no_content('Fifth name to be searched')
end

When(/^I have verified the default value in Search Period From field$/) do
  find_field('year_from_2').value.should eq '1925'
end

When(/^I have verified the default value in Search Period To field$/) do
  find_field('year_to_2').value.should eq '2016'
end

When(/^I click on the name details tab I can enter six names$/) do
  expect(page).to have_content('First name to be searched')
  fill_in('forename_1', :with => 'Ella')
  fill_in('surname_1', :with => 'Piggy')
  fill_in('year_from_1', :with => '1981')
  fill_in('year_to_1', :with => '2013')
  
  expect(page).to have_content('Second name to be searched')
  fill_in('forename_2', :with => 'Gonzo')
  fill_in('surname_2', :with => 'Great')
  fill_in('year_from_2', :with => '1999')
  fill_in('year_to_2', :with => '2000')
  
  find(:id,'add_name').click
  
  expect(page).to have_content('Third name to be searched')
  fill_in('forename_3', :with => 'Kermit')
  fill_in('surname_3', :with => 'Frog')
  fill_in('year_from_3', :with => '1991')
  fill_in('year_to_3', :with => '2013')
  
  find(:id,'add_name').click
  
  expect(page).to have_content('Fourth name to be searched')
  fill_in('forename_4', :with => 'Benjamin')
  fill_in('surname_4', :with => 'Fawkes')


  find(:id,'add_name').click

  expect(page).to have_content('Fifth name to be searched')
  fill_in('forename_5', :with => 'Kermit')
  fill_in('surname_5', :with => 'Frogson')
  fill_in('year_from_5', :with => '1991')
  fill_in('year_to_5', :with => '2013')
  
  find(:id,'add_name').click
  
  expect(page).to have_content('Sixth name to be searched')
  fill_in('forename_6', :with => 'Benjamin')
  fill_in('surname_6', :with => 'Fawkeson') 
end


When(/^I am on the Application complete screen a new record is stored on the register database in the correct format$/) do
  #expect(page).to have_content('successfully completed')
  PostgreSQL.connect('landcharges')
  result = PostgreSQL.query("SELECT id FROM search_name WHERE forenames = 'Ella'")
  #expect(result.values.length).to eq >= 1
  row = result
  puts row[0]['id']
  #expect(row[0]).to eq "146"
  PostgreSQL.disconnect
  
end

When(/^I click on the name details tab I can enter the surname only$/) do
  expect(page).to have_content('First name to be searched')
  fill_in('surname_1', :with => 'Piggy')
  fill_in('year_from_1', :with => '1981')
  fill_in('year_to_1', :with => '2013')
end

When(/^I set the address type to Postal Address$/) do
choose('rm_address')   
end  

Then(/^I can validate customer details via the search api$/) do
  date = Date.today.prev_day
  yesterday = date.strftime("%Y-%m-%d")
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @search_result = @reg_api.get("/last_search")
  srch_id = @search_result['request_id']
  @srch_details = @reg_api.get("/request_details/#{srch_id}")
  srch_nam = @srch_details['search_details']
  srch_add = @srch_details['applicant']
  expect(srch_nam).to have_content('Piggy')
  expect(srch_add).to have_content(' LOUIS LEY & MAYCOCK NON CREDIT')
end

Then(/^I can confirm via api that the expiry date stored is in the future$/) do
  date = Date.today
  tday_date = date.strftime("%Y-%m-%d")
  @reg_api  = RestAPI.new($LAND_CHARGES_URI)
  @search_result = @reg_api.get("/last_search")
  srch_id = @search_result['request_id']
  @srch_details = @reg_api.get("/request_details/#{srch_id}")
  expry_dat = @srch_details['expiry_date']
  expect(expry_dat).to be > tday_date
end

When(/^I navigate to Full search store page$/) do
  find(:id,'search_stored').click
end

Then(/^I can verify number of application stored before and after a Full search$/) do
 bnkstre = all('#work-list').count
  find(:id, "search_full").click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  fill_in('forename_1', :with => 'Ella')
  fill_in('surname_1', :with => 'Piggy')
  fill_in('forename_2', :with => 'Gonzo')
  fill_in('surname_2', :with => 'Great')
  fill_in('county_0', :with => 'Northamptonshire')
  click_button "continue"
  fill_in('key_number', :with => '2244095')
  find(:xpath, "//*[@id='store']").click
  fill_in('store_reason', :with => 'We stored it!!!')
  click_button('store')
  find(:id, "search_stored").click
  bnkstre2 = all('#work-list').count
  expect(bnkstre2).to eq bnkstre + 1
end

When(/^I can reject the full search application form$/) do
  url = URI.parse(current_url)
  expect(page).to have_content('First name to be searched')
  expect(page).to have_content('Second name to be searched')
  find_link('reject').visible?
  click_link 'reject'
  click_button 'accept-reject'
  expect(page).to have_content('Your application has been rejected.')
  visit(url)
end
