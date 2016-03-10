When(/^I have selected to view a K three Land Charges application from the application list$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  within(:xpath, ".//*[@id='row_3']/td[2]") do
  page.should have_content('K3')
  @formtype = 'K3'
  puts(@formtype)
  end
  find(:id, "row_3").click
end

When(/^I access the application screen for a K(\d+) the class type is set to PA$/) do |arg1|
  #expect(page).to have_content('PA')
end

Given(/^I am on Land Charge Registration applications screen$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
end

When(/^I can classify the form to a WOB Registration type$/) do
  within(:xpath, "//*[@id='work-list']") do
  page.should have_content('K3')
  end
  rwcount = all('#work-list>tbody').count
  puts(rwcount)
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