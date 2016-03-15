When(/^I have selected to view a priority notice Land Charges application from the application list$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login-button')
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_pn" )
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K6')
  @formtype = 'K6'
  puts(@formtype)
  end
  find(:id, "row_1").click
end

