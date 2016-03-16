Given(/^I am on the Land Charges renewal applications screen$/) do
  #maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login-button')
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_renewal" )

end


When(/^I select an application from the first row$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K7')
  end
  find(:id, "row_1").click
end

When(/^I can retrieve the Renewal application details with valid data submitted$/) do
  today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => today)
  fill_in('reg_no', :with => 'something')
  click_button('continue')
end

When(/^I can validate data presented on Original Registration details page$/) do
   within '#court' do
    page.should have_content 'Orange County Court'
  end
  within '#court_no' do
    page.should have_content '999'
  end
end

Then(/^I am on Conveyancer page$/) do
  expect(page).to have_content("Conveyancer")
end
