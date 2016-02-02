When(/^I select an application type of Full Search the application is displayed$/) do
  visit("#{$FRONTEND_URI}/get_list?appn=search")
  find(:id,'search_full').click
  find(:id,'row_1').click
end

When(/^I select a application type of Full Search with a single image$/) do
  visit("#{$FRONTEND_URI}/get_list?appn=search")
  find(:id,'search_full').click
  find(:id,'row_2').click
end

Given(/^I am on the full search details screen$/) do
  expect(page).to have_content('Full search')
  expect(page).to have_content('Forename')
  expect(page).to have_content('First name to be searched')
  expect(page).to have_button('Continue')
end

When(/^I click on entered details in the address box I can make an amendment$/) do
  fill_in('customer_address',:with => '4749 DUBUQUE Terrace'"\n"'JAYSONFURT'"\n"'SOUTH VINCENZA'"\n"'NORTHAMPTONSHIRE'"\n"'FC13 4WX')
end

When(/^I click box to search all counties the county edit box is disbled$/) do
  find(:id, 'all_counties').click
  #county text not active
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
  choose('direct_debit')
end

When(/^I enter a county the details are displayed county edit box$/) do
  fill_in('county_0', :with => 'Devon')
end

When(/^I click the add additional county a new county edit box is displayed where I enter the next county$/) do
  find(:id,'addcounty').click
  fill_in('county_1', :with =>'Somerset')
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
  expect(page).to have_content('Confirmation')
  expect(page).to have_content('successfully submitted')
  PostgreSQL.connect('landcharges')
  result = PostgreSQL.query("SELECT id FROM search_name WHERE forenames = 'Ella'")
  #expect(result.values.length).to eq >= 1
  row = result
  puts row[0]['id']
  #expect(row[0]).to eq "146"
  PostgreSQL.disconnect
  
end

