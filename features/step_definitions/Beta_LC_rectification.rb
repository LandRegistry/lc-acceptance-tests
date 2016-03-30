

Given(/^I am on the rectification screen$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_rect" )
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K9')
  @formtype = 'K9'
  puts(@formtype)
  end
  find(:id, "row_1").click
end

Given(/^I am on Land Charge rectification screen$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_rect" )
end

When(/^I can classify the form to a PAB Registration type$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
    page.should have_content('K9')
  end
  rwcount = all('#work-list>tbody').count
  find(:id, "row_1").click
  within('#wrong_form') do
    click_link 'Choose the correct form type'
  end
  choose('pab_regn')
  find_button('continue').click
  expect(page).to have_content('Your application has been moved to Bankruptcy Registrations')
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_rect" )
  page.all('#work-list>tbody').count.should == rwcount -1
end

When(/^I can classify the K9 form to a K4 form type$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K9')
  end
  rwcount = all('#work-list>tbody').count
  find(:id, "row_1").click
  within('#wrong_form') do
  click_link 'Choose the correct form type'
  end
  choose('k4')
  find_button('continue').click
  expect(page).to have_content('Your application has been moved to Land Charge Registrations')
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_rect" )
  page.all('#work-list>tbody').count.should == rwcount -1
end

Then(/^I can restore the reclassified PAB form back to a K9 Rectification form$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  rwcount = all('#work-list>tbody').count
  find(:id, "row_1").click
  within('#wrong_form') do
  click_link 'Choose the correct form type'
  end
  choose('k9')
  find_button('continue').click
  expect(page).to have_content('Your application has been moved to Land Charge Rectifications')
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  page.all('#work-list>tbody').count.should == rwcount -1
end

Then(/^I can restore the reclassified K4 form back to a K9 Rectification form$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  rwcount = all('#work-list>tbody').count
  find(:id, "row_1").click
  within('#wrong_form') do
  click_link 'Choose the correct form type'
  end
  choose('k9')
  find_button('continue').click
  expect(page).to have_content('Your application has been moved to Land Charge Rectifications')
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  page.all('#work-list>tbody').count.should == rwcount -1
end

When(/^I return to LR Rectification screen$/) do
  fill_in('reg_no',:with =>'1003')
end

When(/^I supply the registration number$/) do
  fill_in('reg_no',:with =>'1003')
end

When(/^I select the Wrong form link$/) do
  within('#wrong_form') do
  click_link 'Choose the correct form type'
  end
end

When(/^I choose PAB registration form type$/) do
 choose('pab_regn')
end

When(/^I move the form$/) do
 choose('pab_regn')
end
  
  
When(/^the date of registration$/) do
  fill_in('reg_date', :with =>'01/08/2014')
  find_field('reg_date').value.should eq '01/08/2014'
  puts('reg_date')
end

When(/^I am on the view amend screen I can see infilled details$/) do
    expect(find(:id, 'short_desc').text).to eq '1 The Lane, Some Village'
end


When(/^I am on the check details screen I can choose to amend the district$/) do
  find(:id, 'change_class').click  
  select 'C2', from:  "class"
  find(:id, 'continue').click
  find(:id, 'change_particulars').click  
  fill_in('district', :with  =>'Plymouth')
  find(:id, 'continue').click
  find(:id, 'change_name').click  
  fill_in('forename', :with  =>'Joe John')
  find(:id, 'continue').click
end

When(/^I parse a Land Charge application details for rectification$/) do
  fill_in('forename', :with => 'Joyce')
  fill_in('Surname', :with => 'Mayer')
  select 'C1', from:  "class"
  click_button "continue"
  fill_in('key_number', :with =>'2244095')
  fill_in('customer_ref', :with =>'2244095')
  choose "direct_debit"
    choose "dx_address"
  click_button "submit"
    
  results = page.find(:id, "conf_reg_numbers").text
  visit("#{$FRONTEND_URI}/get_list?appn=lc_rect")
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K9')
  end
  find(:id, "row_1").click
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  fill_in('reg_no', :with => results)
  click_button('continue')
end
