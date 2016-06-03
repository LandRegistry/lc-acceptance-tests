Given(/^I am on the bankruptcy registration screen$/) do
  
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')

  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  maximise_browser
end

When(/^I navigate to bankruptcy application storage page$/) do
    find(:id,'bank_stored').click
end

When(/^I navigate to bankruptcy registration worklist$/) do
    find(:id,'bank_regn').click
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

When(/^I choose the first available WOB form$/) do
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,"WOB")]').click
end

When(/^I choose the first available application form$/) do
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,"")]').click
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
  find_link("reject").visible?
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
  #find(:id, 'change_debtor').click
  fill_in('forename_2', :with => 'Barry')
  fill_in('surname_2', :with => 'Scottie')
end

When(/^I am on the verification screen I can view reference numbers$/) do
  sleep(10)
  expect(page).to have_content('384')
  #expect(page).to have_content('2013')
end

When(/^I am on the verification screen I can rekey debtor's AKA name$/) do
  fill_in('forename_2', :with => 'Barry')
  fill_in('surname_2', :with => 'Scottie')
  #click_button('continue')
end

When(/^I am on the verification screen I can rekey court name$/) do
  fill_in('court_name', :with => 'County Court of Portsmouth')
end

When(/^I can rekey court name on the verification screen$/) do
  fill_in('court_name', :with => 'Derby County Court')
end

When(/^I am on the Court screen I can enter a valid key number$/) do
  fill_in('key_number', :with =>'2244095')
end


When(/^I can click button to continue$/) do
  sleep(2)
  click_button('continue')
end

When(/^I enter the specific court details$/) do
   fill_in('court', :with => 'Plympton County Court')
   fill_in('ref_no', :with => '111')
   #fill_in('ref_year', :with => '2016')
   click_button('continue') 
end

Then(/^the registered names are displayed on the screen$/) do
  expect(page).to have_content('John Smith')
  expect(page).to have_content('John Alan Smithe')
end

When(/^I can confirm successful submission of details for a bankruptcy application$/) do
  fill_in('court', :with => 'Northants County Court')
  fill_in('ref_no', :with => '911')
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
end

When(/^I parse the new registration number as Original registration number$/) do
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
    visit( "#{$FRONTEND_URI}/get_list?appn=cancel" )
    find(:xpath,'//*[@id="row_1"]').click
    fill_in('reg_no', :with => results)
end

When(/^I register the application$/) do
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  fill_in('occupation', :with => 'Dancer')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
end

When(/^I register a PAB application without court name$/) do
  fill_in('ref_no', :with => '888')
  click_button('continue')
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  fill_in('occupation', :with => 'Dancer')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
end

When(/^I register a PAB application with AKA$/) do
  fill_in('court', :with => 'Banana County Court')
  fill_in('ref_no', :with => '888')
  click_button('continue')
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  find(:id, 'addname').click
  fill_in('forenames_2', :with => 'Benny')
  fill_in('surname_2', :with => 'Hinn')
  fill_in('occupation', :with => 'Clergy')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
   fill_in('forename_2', :with => 'Benny')
  fill_in('surname_2', :with => 'Hinn')
  fill_in('court_name', :with => 'Banana County Court')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
end

When(/^I re-register with the previous registration details$/) do
  click_button('continue')
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  find(:id, "row_1").click
  fill_in('court', :with => 'Banana County Court')
  fill_in('ref_no', :with => '888')
  find_link("reject_2").visible?
  click_button('continue')
end

Then(/^I can confirm that court details have already been used$/) do
 expect(page).to have_content('The particulars of court have already been used to register:')
 expect(page).to have_button('yes')
 expect(page).to have_button('no')
end

When(/^I click Yes to continue with the bankruptcy registration$/) do
  find(:id, "yes").click
end

When(/^I click No to discontinue with the bankruptcy registration$/) do
  find(:id, "no").click
end

When(/^I can choose a name$/) do
  choose("radio_2")
end

When(/^I can assign immage to the application$/) do
  click_button('continue')
end

When(/^I can submit debtor details$/) do
  fill_in('forenames_1', :with => 'George')
  fill_in('surname_1', :with => 'Bush')
  find(:id, 'addname').click
  fill_in('forenames_2', :with => 'Randy')
  fill_in('surname_2', :with => 'Moore')
  fill_in('occupation', :with => 'Clergy')
  enter_bank_address_details
  find_link("reject").visible?
  click_button('continue')
end

When(/^I can re-key debtor details$/) do
  fill_in('forename_1', :with => 'George')
  fill_in('surname_1', :with => 'Bush') 
  fill_in('forename_2', :with => 'Randy')
  fill_in('surname_2', :with => 'Moore')
  fill_in('court_name', :with => 'County Court of Portsmouth')
  find_link("reject").visible?
end

When(/^I can submit a new particulars of details$/) do
  fill_in('forenames_1', :with => 'George')
  fill_in('surname_1', :with => 'Bush')
  find(:id, 'addname').click
  fill_in('forenames_2', :with => 'Randy')
  fill_in('surname_2', :with => 'Moore')
  fill_in('occupation', :with => 'Clergy')
  enter_bank_address_details
  find_link("reject").visible?
  click_button('continue')
end

When(/^I can re-key and submit debtor details$/) do
  fill_in('forename_1', :with => 'George')
  fill_in('surname_1', :with => 'Bush') 
  fill_in('forename_2', :with => 'Randy')
  fill_in('surname_2', :with => 'Moore') 
  fill_in('court_name', :with => 'Banana County Court')
  find_link("reject").visible?
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
end

When(/^I can enter name details$/) do
  fill_in('forenames_1', :with => 'George')
  fill_in('surname_1', :with => 'Bush')
end

When(/^I select option to return to the application later$/) do
  find(:xpath, "//*[@id='store']").click
end

When(/^I can click to store the reason$/) do
  click_button('store')
end

When(/^I can enter a reason$/) do
  fill_in('store_reason', :with => 'These testers are amazing!')
end

Then(/^I am on Store application page$/) do
  expect(page).to have_content('Store application')
end

When(/^I click on the link to reject application$/) do
  click_link('reject_2')
end

When(/^I click Ok on the pop up$/) do
    click_button('accept-reject')
end

Then(/^I can validate number displayed before and after an application is stored$/) do
   find(:id, "bank_stored").click
   bnkstre = all('#work-list').count
   find(:id, "bank_regn").click
   page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,"PAB")]').click
   fill_in('court', :with => 'Banana County Court')
  fill_in('ref_no', :with => '888')
  click_button('continue')
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  find(:id, 'addname').click
  fill_in('forenames_2', :with => 'Benny')
  fill_in('surname_2', :with => 'Hinn')
  fill_in('occupation', :with => 'Clergy')
  enter_bank_address_details
  click_to_continue
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
   fill_in('forename_2', :with => 'Benny')
  fill_in('surname_2', :with => 'Hinn')
  fill_in('court_name', :with => 'Banana County Court')
  find(:xpath, "//*[@id='store']").click
  expect(page).to have_content('Store application')
  fill_in('store_reason', :with => 'Amazing QAs!')
  click_button('store')
  find(:id, "bank_stored").click
  bnkstre2 = all('#work-list').count
  expect(bnkstre2).to eq bnkstre + 1
end

Then(/^I can verify that worklist reduces by one when application is rejected$/) do
 rwcount = all('#work-list>tbody').count
 find(:id, "row_1").click
 fill_in('court', :with => 'County Court of Portsmouth')
 click_link('reject_2')
 page.driver.browser.switch_to.alert.accept
 page.all('#work-list>tbody').count.should == rwcount -1
end

Then(/^I can see Confirmation message indicating the application has been rejected$/) do
  expect(page).to have_content('Your application has been rejected.')
end

Then(/^I can log out$/) do
  click_link('logout_link')
end

When(/^I leave login fields empty$/) do 
   fill_in('username', :with => '')
  fill_in('password', :with => '')
end

Given(/^I launch the login page$/) do
  visit( "#{$FRONTEND_URI}/login" )
  expect(page).to have_field('username', with: '')
end

When(/^I enter valid login details$/) do 
   submit_valid_creds
end

When(/^I click on the login button$/) do 
   click_button('login_button')
end

Then(/^I can see username and password fields$/) do
  expect(page).to have_field('username', with: '')
  expect(page).to have_field('password', with: '')
end

Then(/^I will see invalid data error message$/) do
  expect(page).to have_content('User name or password invalid.')
end

Then(/^I can verify remaining forms on worklist after submitting two out of three applications$/) do
 page.evaluate_script('window.history.back()') 
 sleep(5)
  countA = all('#work-list>tbody').count
   find(:id, "row_1").click
  fill_in('court', :with => 'Banana County Court')
  fill_in('ref_no', :with => '888')
  click_button('continue')
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  find(:id, 'addname').click
  fill_in('forenames_2', :with => 'Benny')
  fill_in('surname_2', :with => 'Hinn')
  fill_in('occupation', :with => 'Clergy')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
   fill_in('forename_2', :with => 'Benny')
  fill_in('surname_2', :with => 'Hinn')
  fill_in('court_name', :with => 'Banana County Court')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  countB = all('#work-list>tbody').count
  find(:id, "row_1").click
  fill_in('court', :with => 'Jollof County Court')
  fill_in('ref_no', :with => '778')
  click_button('continue')
  fill_in('forenames_1', :with => 'George')
  fill_in('surname_1', :with => 'Lucas')
  fill_in('occupation', :with => 'Dancer')
  fill_in('add_1_line1', :with => '123 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Winchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'SO14 1AA')
  click_button('continue')
  fill_in('forename_1', :with => 'George')
  fill_in('surname_1', :with => 'Lucas') 
  fill_in('court_name', :with => 'Jollof County Court')
  click_button('continue') 
  page.evaluate_script('window.history.back()') 
  page.evaluate_script('window.history.back()') 
  page.evaluate_script('window.history.back()') 
  page.evaluate_script('window.history.back()') 
  find(:id, "row_1").click
  fill_in('court', :with => 'Plantain Chips County')
  fill_in('ref_no', :with => '288')
  click_button('continue')
  fill_in('forenames_1', :with => 'Frank')
  fill_in('surname_1', :with => 'Bruno')
  fill_in('occupation', :with => 'Dancer')
  fill_in('add_1_line1', :with => '123 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Manchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'SO14 1AA')
  find_link("reject").visible?
  click_button('continue')
  fill_in('forename_1', :with => 'Frank')
  fill_in('surname_1', :with => 'Bruno') 
  fill_in('court_name', :with => 'Plantain Chips County')
  find_link("reject").visible?
  click_button('continue') 
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  countC = countA -2
  puts(countC)
end

When(/^I can reject the bank reg application form$/) do
  url = URI.parse(current_url)
  expect(page).to have_content('Official details')
  find_link('reject_2').visible?
  click_link 'reject_2'
  click_button 'accept-reject'
  expect(page).to have_content('Your application has been rejected.')
  visit(url)
end

Then(/^I can confirm the form no longer exists$/) do
  expect(page).not_to have_content('Official details')
end

When(/^I register a newly stored bankruptcy application$/) do
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  fill_in('court', :with => 'Banana County Court')
  fill_in('ref_no', :with => '888')
  click_button('continue')
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  fill_in('occupation', :with => 'Clergy')
  enter_bank_address_details
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
  fill_in('court_name', :with => 'Banana County Court')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  find(:xpath, "//*[@id='store']").click
  expect(page).to have_content('Store application')
  fill_in('store_reason', :with => 'Amazing QAs!')
  click_button('store')
  find(:id, "bank_stored").click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,"Amazing QAs!")]').click
  click_button('continue')
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas') 
  fill_in('court_name', :with => 'Banana County Court')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  find(:id, 'bank_amend').click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('pab_ref', :with => results)
  fill_in('pab_date', :with => today)
  click_button('continue')
end

When(/^I can amend the newly registered application$/) do
  fill_in('forenames_1', :with => '')
  fill_in('forenames_1', :with => 'Frank')
  fill_in('surname_1', :with => '')
  fill_in('surname_1', :with => 'Mansford')
  find_link('reject').visible?
  click_link 'reject'
  click_button 'cancel-reject'
  click_button('continue')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  find_link('reject').visible?
  click_link 'reject'
  click_button 'cancel-reject'
  click_button('continue')
  page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  find(:xpath, "//*[@id='side-nav']/li[5]/a").click
  find(:id, 'canc').click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_no', :with => results)
  fill_in('reg_date', :with => today)
end

Then(/^I cancel the amended application$/) do
  find(:id, 'full_cans').click
  click_button('continue')
  click_button('continue')
  click_button('continue')
  fill_in('key_number', :with =>'2244095')
  sleep(5)
  fill_in('customer_ref', :with =>'213/REC')
  find(:id, 'direct_debit').click
  click_button('complete')
end

Then(/^I cannot cancel the bankruptcy application a second time$/) do
   page.find(:id, "conf_reg_numbers").text
  results = page.find(:id, "conf_reg_numbers").text
  #find(:id, 'canc').click
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]').click
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_no', :with => results)
  fill_in('reg_date', :with => today)
  find(:id, 'full_cans').click
  expect(page).to have_content('Retrieve original')
  expect(page).to have_content('Is this a full or part cancellation?')
  click_button('continue')
  expect(page).to have_content('Registration has been cancelled - please re-enter')
end

When(/^I can login and choose an application type:$/) do |table|
  table.hashes.each do |row|
    fill_in('username', :with => row['user'])
    fill_in('password', :with => row['pword'])
    click_button 'login_button'
    sleep(2)
    if page.has_xpath?".//*[@id='b']/form/div[3]"
       sleep(2)
    puts"Oops! Invalid login details!!"
    elsif row['page'] == 'bankreg' 
    find(:id, 'bank_regn').click
    expect(page).to have_content('Bankruptcy')
    page.should have_xpath(".//*[@id='content-with-side-nav']/h1")
    expect(page).to have_no_content('Amendment applications')
    expect(page).to have_no_content('Stored applications')
      click_link 'logout_link'
    elsif row['page'] == 'lcreg' 
    find(:id, 'lc_regn').click
      sleep(2)
      click_link 'logout_link'
    elsif row['page'] == 'flsrch' 
    find(:id, 'search_full').click
      click_link 'logout_link'
    elsif row['page'] == 'bksrch' 
    find(:id, 'search_bank').click
      sleep(2)
      click_link 'logout_link'
    elsif row['page'] == '' 
      sleep(2)
      click_link 'logout_link'
    else
      nil
    end
end
end

Then(/^I can submit multiple Bank application forms:$/) do |table|
  table.hashes.each do |row|
    fill_in('username', :with => row['user'])
    fill_in('password', :with => row['pword'])
    click_button 'login_button'
    sleep(2)
    if page.has_xpath?".//*[@id='b']/form/div[3]"
       sleep(2)
    puts"Oops! Invalid login details!!"
    elsif row['page'] == 'bankreg' 
    find(:id, 'bank_regn').click
    if page.has_xpath?".//*[@id='content-with-side-nav']/h1"
      page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,*)]').click
      fill_in('court', :with => row['crtname'])
      fill_in('ref_no', :with => row['crtref'])
      click_button 'continue'
      fname = row['forename']
      fill_in('forenames_1', :with => fname)
      fill_in('surname_1', :with => row['surname'])
      if row['forename2'] != ''
        click_link"addname"
        fill_in('forenames_2', :with => row['forename2'])
        fill_in('surname_2', :with => row['surname2'])
      else
        nil
      end
      fill_in('occupation', :with => row['occupation'])
      fill_in('add_1_line1', :with => row['address1'])
      fill_in('county_1', :with => row['county'])
      fill_in('postcode_1', :with => row['pcode'])
      click_button 'continue'
      fill_in('forename_1', :with => row['chckforename'])
      fill_in('surname_1', :with => row['chcksurname']) 
       if page.has_css?"#forename_2"
          fill_in('forename_2', :with => row['forename2'])
          fill_in('surname_2', :with => row['surname2'])
        else
          nil
        end
        if page.has_css?"#court_name"
         fill_in('court_name', :with => row['crtname'])
        else
          nil
        end
      click_button('continue')
      fill_in('key_number', :with =>row['keyno'])
      click_button('continue')
      regnumber = page.find(:id, "conf_reg_numbers").text
      puts(regnumber)
    end
      click_link 'logout_link'
    elsif row['page'] == 'lcreg' 
    find(:id, 'lc_regn').click
    puts("Land Charge Registrations Page")
      click_link 'logout_link'
    elsif row['page'] == 'flsrch' 
    find(:id, 'search_full').click
    puts("Full Search Applications Page")
      click_link 'logout_link'
    elsif row['page'] == 'bksrch' 
    find(:id, 'search_bank').click
    puts("Bankruptcy Search Applications Page")
      click_link 'logout_link'
    elsif row['page'] == '' 
      sleep(2)
      click_link 'logout_link'
    else
      nil
  end
end
end

Then(/^I can submit bankruptcy registration forms$/) do |table|
  table.hashes.each do |row|
    #fill Official details xpath exists, enter name/reference and continue
    if page.has_xpath?".//*[@id='bank_reg_form']/h2"
      fill_in('court', :with => row['crtname'])
      fill_in('ref_no', :with => row['crtref'])
      click_button 'continue'
      #if Particulars of debtor xpath does not exists, do nothing, else if it does, fill out and submit form
      if !page.has_xpath?".//*[@id='rectify_form']/h2"
        nil
      elsif page.has_xpath?".//*[@id='rectify_form']/h2"
      fname = row['forename']
      fill_in('forenames_1', :with => fname)
      fill_in('surname_1', :with => row['surname'])
      #if forename2 column is empty, execute code, else do nothing 
      if row['forename2'] != ''
        click_link"addname"
        fill_in('forenames_2', :with => row['forename2'])
        fill_in('surname_2', :with => row['surname2'])
      else
        nil
      end
      fill_in('occupation', :with => row['occupation'])
      fill_in('add_1_line1', :with => row['address1'])
      fill_in('county_1', :with => row['county'])
      fill_in('postcode_1', :with => row['pcode'])
      click_button 'continue'
      fill_in('forename_1', :with => row['chckforename'])
      fill_in('surname_1', :with => row['chcksurname']) 
      #if Official details xpath exists, enter name/reference and continue
       if page.has_css?"#forename_2"
          fill_in('forename_2', :with => row['forename2'])
          fill_in('surname_2', :with => row['surname2'])
        else
          nil
        end
        #if Official details xpath exists, enter name/reference and continue
        if page.has_css?"#court_name"
         fill_in('court_name', :with => row['crtname'])
        else
          nil
        end
      click_button('continue')
      fill_in('key_number', :with =>row['keyno'])
      sleep(10)
      click_button('continue')
      regnumber = page.find(:id, "conf_reg_numbers").text
      puts(regnumber)
      page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,*)]').click
    end
  end 
end
end

When(/^I register a new bankruptcy application$/) do
  bank_reg_details
  fill_in('key_number', :with =>'2244095')
  click_button('continue')
  @results = page.find(:id, "conf_reg_numbers").text
  navigate_to_homepage
  launch_correction_pge
  fill_in('reg_no', :with => @results)
end

 When(/^I can validate registration details for correction$/) do
   submit_new_reg
 end
 
  Then(/^I can amend debtor details$/) do
  amend_add_debtor
 end
 
  Then(/^I can proceed to bankruptcy verification page$/) do
  goto_bank_verification_page
  end
  
  Then(/^I can submit corrections$/) do
  complete_transaction
  expect(page).to have_content("Your application has successfully corrected.")
  end
