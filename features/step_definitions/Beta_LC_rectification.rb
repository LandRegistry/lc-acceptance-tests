
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

When(/^I supply the registration number$/) do
  fill_in('reg_no',:with =>'1003')
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
  #click()
end

