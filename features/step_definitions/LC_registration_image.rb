When(/^I have selected to view a specific Land Charges application from the application list$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K1')
  @formtype = 'K1'
  puts(@formtype)
  end
  find(:id, "row_1").click
end

When(/^viewing the application screen a dropdown list is visible for class of charge$/) do
  expect(page).to have_content('Class and subclass')
end

When(/^I can select the appropiate class of charge$/) do
  select 'ANN', from:  "class"
  select 'A', from:  "class"
  select 'B', from:  "class"
  select 'C(I)', from:  "class"
  select 'C(II)', from:  "class"
  select 'C(III)', from:  "class"
  select 'C(IV)', from:  "class"
  select 'D(I)', from:  "class"
  select 'D(II)', from:  "class"
  select 'D(III)', from:  "class"
  select 'E', from:  "class"
  select 'F', from:  "class"
  select 'PA', from:  "class"
  select 'WO', from:  "class"
  select 'DA', from:  "class"
  select 'LC', from:  "class"
end

When(/^I access the application screen the county Unitary Authority dropdown box is visible$/) do
  if @formtype == 'K1'
    expect(page).to have_content('County or unitary authority area')
    expect(page).to have_content('District')
    fill_in('county_0', :with => "Portsmouth")
    find(:id, 'addcounty').click
    fill_in('county_1', :with => 'Poole')
  else
    nil
  end
end

When(/^I access the application screen the district box is visible as a free format$/) do
  fill_in('District',:with => 'Devon')
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

When(/^Complex name is selected I can complete the complex name details$/) do
  select 'Complex name', from: "estateOwnerTypes"
  expect(page).to have_content('Complex name')
  fill_in('complex_name_field',:with => 'king stark')
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
  fill_in('addl_info',:with => 'this is a free format field and I can enter anything  I like 12344567')
end


Then(/^I can click the land charges continue button to go to the next screen$/) do
  find(:id,'continue').click
  expect(page).to have_content('Verification page placeholder')
  find(:id,'continue').click 
  expect(page).to have_content('Conveyancer and fee page placeholder')
  find(:id,'complete').click  
  sleep(1)
end



When(/^a row is added to the Land charges database$/) do
  #@registration_api = RestAPI.new($LAND_CHARGES_URI)
  #@registration_api.post("/registrations", no_alias)
     #if @registration_api.data['result']
      #  data = @registration_api.data['result']['new_registrations']#
    #else
       # data = @registration_api.data["new_registrations"]
    #end

    get_api = RestAPI.new($LAND_CHARGES_URI)
    reg = '1000'
    reg_date = Time.new.strftime("%Y-%m-%d")
    
    regn = get_api.get("/registrations/#{reg_date}/#{reg}")
    expect(get_api.response.code).to eql "200"
    expect(regn['registration']['numb']).to eq reg_no
      
end

When(/^I click on look up complex name a new screen is displayed$/) do
  click_link('name_lookup_link')
end

When(/^I select a complex name then radio button is highlighted$/) do
  expect(page).to have_content('Complex name result')
   choose('comp_name_1')
   choose('comp_name_0')
   choose('comp_name_1')
end

When(/^I can then click the close button$/) do
  find(:id,'close').click
  expect(page).to have_content('KING STARK OF THE NORTH (1000167)')
end
