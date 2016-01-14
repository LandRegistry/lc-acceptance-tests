When(/^I have selected to view a specific Land Charges application from the application list$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  find(:id, "row_1").click
  sleep(1)
end

When(/^viewing the application screen a dropdown list is visible for class of charge$/) do
  expect(page).to have_content('Class and subclass')
  fill_in('class', :with =>'A')
  #select 'ANN', from:  "charge"
  #expect(page).to have_select("charge", options: ["A","B","C(II)","C(II)","D(I)","D(I),D(III)","E","F","PA","WO","DA","ANN","LC"])

  #select 'Private individual', from: "estateOwnerTypes"
end

When(/^I can select the appropiate class of charge$/) do
   # Write code here that turns the phrase above into concrete actions
end

When(/^I access the application screen the county Unitary Authority dropdown box is visible$/) do
  # Write code here that turns the phrase above into concrete actions
end

When(/^I can select the correct location$/) do
 # Write code here that turns the phrase above into concrete actions
end

When(/^I access the application screen the district dropdown box is visible$/) do
  # Write code here that turns the phrase above into concrete actions
end

When(/^I access the application screen the short description text box is visible$/) do
  expect(page).to have_content('Short description')
  
end

When(/^I can enter the free format details$/) do
  fill_in('short_desc', :with =>'free format2werslkfxdlkf')
end

When(/^I access the application screen a dropdown list is visible for categories of estate owner$/) do
  select 'Private individual', from: "estateOwnerTypes"
  select 'Limited company', from: "estateOwnerTypes"
  select 'Local authority', from: "estateOwnerTypes"
  select 'Complex name', from: "estateOwnerTypes"
  select 'Other', from: "estateOwnerTypes"
end

When(/^Private Individual is selected I can complete the names details$/) do
  select 'Private individual', from: "estateOwnerTypes"
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forename', :with => 'Nicola')
  fill_in('Surname', :with => 'Andrews')
end

When(/^Limited Company is selected I can complete the company details$/) do
  select 'Limited company', from: "estateOwnerTypes"
  expect(page).to have_content('Company name')
  fill_in('company', :with  => 'Barrington Storage Ltd')
end

When(/^Local authority is selected I can complete the local authority details$/) do
  select 'Local authority', from: "estateOwnerTypes"
  expect(page).to have_content('Local authority full name')
  fill_in('loc_auth', :with => 'City of Plymouth')
end

When(/^Complex name is selected I can complex the complex name details$/) do
  select 'Complex name', from: "estateOwnerTypes"
  expect(page).to have_content('Complex name')
  fill_in('complex_name',:with => 'hrh king stark')
  expect(page).to have_content('Look up complex name')
end

When(/^other is selected I can complete the name$/) do
  select 'Other', from: "estateOwnerTypes"
  expect(page).to have_content('Name')
  fill_in('other_name', :with =>'LC Charity')
end

When(/^I have a trade title profession I can complete the details$/) do
  expect(page).to have_content('Trade, title or profession')
  fill_in('occupation',:with => 'plumber')
end


When(/^I have additional information I can enter it in the free format text box$/) do
  expect(page).to have_content('Additional information')
  fill_in('addl_info',:with => 'this is a free format field and I can enter anything  I like !@£$%^&*€#12344567')
end

Given(/^I am on the Land Charges Application complete screen$/) do
   # Write code here that turns the phrase above into concrete actions
end
