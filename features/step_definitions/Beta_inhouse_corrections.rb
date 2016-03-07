Given(/^I am on the bankruptcy correction screen$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=correction" )
  maximise_browser
end


When(/^I enter the registration number$/) do
  fill_in('reg_no', :with => '1001')
  fill_in('reg_date', :with => '01.08.2014')
end

When(/^the correction data$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I can see all the orginal bankruptcy details$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
