Given(/^I am on the Land Charges worklist$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  maximise_browser
end

When(/^there are applications available$/) do
  expect(page).to have_xpath(".//*[@id='lc_regn']")
end

Then(/^I can view the totals on the worklist$/) do
  page.should have_xpath(".//*[@id='lc_regn']", :text => '12')
end

When(/^I click on the Registration Application link there are applications visible$/) do
  find(:id,'lc_regn').click
 
end

Then(/^an error message is displayed stating that the current application is being processed$/) do
  # Write code here that turns the phrase above into concrete actions
end

When(/^I can view the application on their worklist$/) do
  expect(page).to have_content('Registration applications')
end

Then(/^the applications are displayed in descending order by date time$/) do
   within(:xpath, ".//*[@id='work-list']/tbody[1]/tr/td[1]") do
  page.should have_content('05 November 2015 14:01')
  end

  within(:xpath, ".//*[@id='work-list']/tbody[2]/tr/td[1]") do
  page.should have_content('05 November 2015 14:03')
  end
end

Given(/^two users are accessing the same application at the same time$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the selected application is accessed by the second user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

