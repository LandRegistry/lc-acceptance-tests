When(/^I have selected to view a K four Land Charges application from the application list$/) do
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login-button')
  
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  within(:xpath, ".//*[@id='row_7']/td[2]") do
  page.should have_content('K4')
  @formtype = 'K4'
  puts(@formtype)
  end
  find(:id, "row_7").click
end

When(/^I access the application screen for a K(\d+) the class type is set to WO$/) do |arg1|
 #expect class
end