

Given(/^I am on the rectification screen$/) do
  maximise_browser
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
   #page.should have_content('Devon')
  #page.should have_content('South Hams')
  page.should have_content('1 The Lane, Some Village')
  #page.should have_content('Johnson')
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
  find(:id, 'change_addl_info').click  
  fill_in('addl_info', :with  =>'new additional information')
  find(:id, 'continue').click
end

