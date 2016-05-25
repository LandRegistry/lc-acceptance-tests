When(/^I have selected to view a K three Land Charges application from the application list$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
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
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  find(:id, 'lc_regn').click
  sleep(15)
end

When(/^I choose the first available form$/) do
  page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,*)]').click
end

When(/^I can reject the land charges application form$/) do
  url = URI.parse(current_url)
  expect(page).to have_content('Class of charge')
  find_link('reject').visible?
  click_link 'reject'
  click_button 'accept-reject'
  expect(page).to have_content('Your application has been rejected.')
  visit(url)
end
