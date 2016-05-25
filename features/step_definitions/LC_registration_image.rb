When(/^I have selected to view a specific Land Charges application from the application list$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  find(:xpath, "//*[@id='login_button']").click
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K1')
  @formtype = 'K1'
  puts(@formtype)
  end
  find(:id, "row_1").click
end
When(/^I log in  Land Charges application from the application list$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  find(:xpath, "//*[@id='login_button']").click
end

When(/^I select a specific Land Charges application form$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  find(:xpath, "//*[@id='login_button']").click
  
end

When(/^viewing the application screen a dropdown list is visible for class of charge$/) do
  expect(page).to have_content('Class and subclass')
end

When(/^I can select the appropiate class of charge$/) do
  select 'ANN', from:  "class"
  select 'A', from:  "class"
  select 'B', from:  "class"
  select 'C1', from:  "class"
  select 'C2', from:  "class"
  select 'C3', from:  "class"
  select 'C4', from:  "class"
  select 'D1', from:  "class"
  select 'D2', from:  "class"
  select 'D3', from:  "class"
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
  elsif  @formtype == 'K2'
    expect(page).to have_content('County or unitary authority area')
    expect(page).to have_content('District')
    fill_in('county_0', :with => "Portsmouth")
    find(:id, 'addcounty').click
    fill_in('county_1', :with => 'Poole') 
  elsif  @formtype == 'K3'
    expect(page).to have_content('County or unitary authority area')
    expect(page).to have_content('District')
    fill_in('county_0', :with => "Portsmouth")
    find(:id, 'addcounty').click
    fill_in('county_1', :with => 'Poole') 
  elsif  @formtype == 'K4'
    expect(page).to have_content('County or unitary authority area')
    expect(page).to have_content('District')
    fill_in('county_0', :with => "Portsmouth")
    find(:id, 'addcounty').click
    fill_in('county_1', :with => 'Poole')   
  elsif  @formtype == 'K6'
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

When(/^I am on the verification screen I can rekey estate owner's full name$/) do
  expect(page).to have_content('Re-key estate owner details')
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forename', :with => 'Nicola')
  fill_in('Surname', :with => 'Andrews')
end

When(/^Limited Company is selected I can complete the company details$/) do
  select 'Limited company', from: "estateOwnerTypes"
  expect(page).to have_content('company')
  fill_in('company', :with  => 'Barrington Storage Ltd')
end

When(/^Local authority is selected I can complete the local authority details$/) do
  select 'Local authority', from: "estateOwnerTypes"
  expect(page).to have_content('Local authority full name')
  fill_in('loc_auth', :with => 'City of Plymouth')
end

When(/^Complex name is selected I can complete the complex name details$/) do
  select 'Complex Name', from: "estateOwnerTypes"
  #expect(page).to have_content('Complex name')
  #fill_in('complex_name_field',:with => 'king stark')
  #expect(page).to have_content('Look up complex name')
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


Then(/^I can click on Continue button to submit the form$/) do
    find(:id,'continue').click
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
   #choose('comp_name_1')
   #choose('comp_name_3')
   choose('comp_name_2')
end

When(/^I enter Complex name in given field$/) do
  fill_in('complex_name_field', :with =>'king stark')
end

When(/^I can then click the close button$/) do
  find(:id,'close').click
  #commenting the line below out because it isn't relevant to the description
  #expect(page).to have_content('KING STARK OF THE NORTH (1000167)')
end

When(/^I can select the class of charge$/) do
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
end

When(/^I am on the Conveyancer and fees screen I can enter a valid key number$/) do
  fill_in('key_number', :with =>'2244095')
  sleep(10)
  expect(find(:id, 'customer_address').value).to eq 'DX 8249' "\n" 'PLYMOUTH 3'
end

When(/^I parse a new land charge registration for cancellation$/) do
    fill_in('forename', :with => 'Joyce')
    fill_in('Surname', :with => 'Mayer')
    select 'C1', from:  "class"
    click_button "continue"
    fill_in('key_number', :with =>'2244095')
    sleep(10)
    fill_in('customer_ref', :with =>'2244095')
    choose "direct_debit"
    choose "dx_address"
    click_button "complete"
    results = page.find(:id, "conf_reg_numbers").text
    visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
    find(:xpath,'//*[@id="row_1"]').click
    fill_in('reg_no', :with => results)
    today = Date.today.strftime("%d/%m/%Y")
    fill_in('reg_date', :with => today)
end

When(/^I submit input details for land charge registration$/) do
  select 'C1', from:  "class"
  fill_in('pri_notice',:with =>'127')
  fill_in('county_0', :with => 'Poole')
  fill_in('District',:with => 'Devon')
  fill_in('short_desc', :with =>'free format2werslkfxdlkf')
  fill_in('forename', :with => 'Joyce')
  fill_in('Surname', :with => 'Mayer')
  fill_in('occupation',:with => 'preacher')
  click_button "continue"
end

When(/^I can classify the form to a WOB Registration type$/) do
  within(:xpath, "//*[@id='work-list']") do
  page.should have_content('K3')
  end
  rwcount = all('#work-list>tbody').count
  find(:id, "row_1").click
  within('#wrong_form') do
  click_link 'Choose the correct form type'
  end
  choose('wob_regn')
  find_button('continue').click
  expect(page).to have_content('Your application has been moved to Bankruptcy Registrations')
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  page.all('#work-list>tbody').count.should == rwcount -1
end

Then(/^I can restore the reclassified WOB Registration form to a K1 LC Registration form$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  rwcount = all('#work-list>tbody').count
  find(:id, "row_1").click
  within('#wrong_form') do
  click_link 'Choose the correct form type'
  end
  choose('k1')
  find_button('continue').click
  expect(page).to have_content('Your application has been moved to Land Charge Registrations')
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  page.all('#work-list>tbody').count.should == rwcount -1
end

When(/^I input standard data for LC registration$/) do
if @formtype == 'K1'
    select 'LC', from:  "class"
    fill_in('county_0', :with => "Portsmouth")
  elsif  @formtype == 'K2'
    select 'F', from:  "class"
    fill_in('county_0', :with => "Portsmouth")
  elsif  @formtype == 'K3'
    select 'PA', from:  "class"
    fill_in('county_0', :with => "Portsmouth")
  elsif  @formtype == 'K4'
    select 'WO', from:  "class"  
    fill_in('county_0', :with => "Portsmouth")
  elsif  @formtype == 'K6'
    select 'LC', from:  "class"   
    fill_in('county_0', :with => "Portsmouth") 
  else
    nil
  end 
  fill_in('pri_notice',:with =>'LCR/234')
  fill_in('District',:with => 'Devon')
  fill_in('short_desc', :with =>'free format2werslkfxdlkf')
end

Then(/^I can proceed and process fees$/) do
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
  click_button 'continue'
  fill_in 'key_number', :with =>'2244095'
  fill_in 'customer_ref', :with => '100/102'
  choose 'dx_address'
  choose 'pre_paid'
  click_button 'complete'
end

 When(/^I can choose (.+) estate owner type and verify the details$/) do |name_type|
  if name_type == 'private individual'
    fill_in('forename', :with => 'Jonelle')
    fill_in 'surname', :with => 'Goodwin'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'forename', :with => 'Jonelle'
     fill_in 'surname', :with => 'Goodwin'
  elsif name_type == 'complex names'
    select 'Complex Name', from: 'estateOwnerTypes'
    fill_in 'complex_name_field', :with => 'king stark'
    click_link 'name_lookup_link'
    choose 'comp_name_3'
    click_button 'close'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
  elsif name_type == 'rural district council'
    select 'Rural District Council', from: 'estateOwnerTypes'
    fill_in 'loc_auth', :with => 'South Hams Rural District Council'
    fill_in 'loc_auth_area', :with => 'South Hams'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'fullname', :with => 'South Hams Rural District Council'
    fill_in 'area', :with => 'South Hams'
  elsif name_type == 'county council'
    select 'County Council or Greater London or Manchester Council', from: 'estateOwnerTypes'
    fill_in 'loc_auth', :with => 'Leicester County Council'
    fill_in 'loc_auth_area', :with => 'Leicestershire'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'fullname', :with => 'Leicester County Council'
    fill_in 'area', :with => 'Leicestershire'
  elsif name_type == 'development corporation'
    select 'Development Corporation', from: 'estateOwnerTypes'
    fill_in 'other_name', :with => 'London Thames Gateway Development Corporation'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'corpname', :with => 'London Thames Gateway Development Corporation'
  elsif name_type == 'other council'
    select 'Other Council', from: 'estateOwnerTypes'
    fill_in 'loc_auth', :with => 'South Hams District Council'
    fill_in 'loc_auth_area', :with => 'South Hams'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'fullname', :with => 'South Hams District Council'
     fill_in 'area', :with => 'South Hams'
  elsif name_type == 'parish council'
    select 'Parish, Town or Community Council', from: 'estateOwnerTypes'
    fill_in 'loc_auth', :with => 'Caddington Parish Council'
    fill_in 'loc_auth_area', :with => 'Bedfordshire'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'fullname', :with => 'Caddington Parish Council'
     fill_in 'area', :with => 'Bedfordshire'
  elsif name_type == 'other'
    select 'Other', from: 'estateOwnerTypes'
    fill_in 'other_name', :with => 'Fremington Parish Council'
    fill_in 'occupation', :with => 'Dentist'
    click_button 'continue'
    fill_in 'corpname', :with => 'Fremington Parish Council'
  end
end
  
When(/^I select Other council from estate owner list$/) do 
  select 'Other Council', from: "estateOwnerTypes"
end
 
Then(/^I can submit entries for a (.*)$/) do |form_type|
  if form_type == 'borough council'
    la = 'Northampton Borough Council'
    laa = 'Northamptonshire'
    fill_in('loc_auth', :with  => la )
    fill_in('loc_auth_area', :with  => laa )
    fill_in 'occupation', :with => 'Painter'
    click_button 'continue'
    fill_in 'fullname', :with => la
    fill_in 'area', :with => laa
  elsif form_type == 'unitary authority'
     la = 'Bristol City'
    laa = 'Bristol'
    fill_in('loc_auth', :with  => la )
    fill_in('loc_auth_area', :with  => laa )
    fill_in 'occupation', :with => 'Farmer'
    click_button 'continue'
    fill_in 'fullname', :with => la
    fill_in 'area', :with => laa
  elsif form_type == 'borough council'
    la = 'Wellingborough Borough Council'
    laa = 'Northamptonshire'
    fill_in('loc_auth', :with  => la )
    fill_in('loc_auth_area', :with  => laa )
    fill_in 'occupation', :with => 'Farmer'
    click_button 'continue'
    fill_in 'fullname', :with => la
    fill_in 'area', :with => laa
  elsif form_type == 'borough councils'
    la = 'Borough Council of Wellingborough'
    laa = 'Northamptonshire'
    fill_in('loc_auth', :with  => la )
    fill_in('loc_auth_area', :with  => laa )
    fill_in 'occupation', :with => 'Farmer'
    click_button 'continue'
    fill_in 'fullname', :with => la
    fill_in 'area', :with => laa
  elsif form_type == 'metropolitan borough council'
    la = 'Stockport Metropolitan Borough Council'
    laa = 'Greater Manchester'
    fill_in('loc_auth', :with  => la )
    fill_in('loc_auth_area', :with  => laa )
    fill_in 'occupation', :with => 'Farmer'
    click_button 'continue'
    fill_in 'fullname', :with => la
    fill_in 'area', :with => laa
  elsif form_type == 'metropolitan borough council v2'
    la = 'Metropolitan Borough Council of Stockport'
    laa = 'Greater Manchester'
    fill_in('loc_auth', :with  => la )
    fill_in('loc_auth_area', :with  => laa )
    fill_in 'occupation', :with => 'Farmer'
    click_button 'continue'
    fill_in 'fullname', :with => la
    fill_in 'area', :with => laa
  end
end

Then(/^I can submit the LC application$/) do
verify_classes
click_button 'continue'
 fill_in 'key_number', :with =>'2244095'
  choose 'dx_address'
  choose 'pre_paid'
  sleep(10)
  find(:id, "submit").click
  #if conveyancer section still exists, enter customer ref and submit again
  if page.has_css?"#lc_customer"
    fill_in 'customer_ref', :with => '100/102'
    sleep(10)
    find(:id, "submit").click
  end
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  find(:xpath, "//*[@id='side-nav']/li[7]/a").click 
  find(:xpath, "//*[@id='content']/div[3]/div[3]/a/p").click
  fill_in('reg_no', :with => results)
  submit_new_reg
  end
  
When(/^I amend the LC application form$/) do 
change_estate_owner_to_county_council
click_to_continue
end

When(/^I can choose to print centrally$/) do 
select_needK22_yes
expect(page).to have_button('complete', :disabled => true)
select_print_centrally
complete_transaction
expect(page).to have_content("Your application has successfully corrected.")
end

When(/^I can choose to print locally$/) do 
select_needK22_yes
select_print_locally
complete_transaction
expect(page).to have_content("Your application has successfully corrected.")
end

When(/^I can opt not to print K22$/) do 
select_needK22_no
page.should have_no_content("Where should the K22 be printed?")
complete_transaction
expect(page).to have_content("Your application has successfully corrected.")
end
