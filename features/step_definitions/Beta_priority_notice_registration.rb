When(/^I have selected to view a priority notice Land Charges application from the application list$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_pn" )
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('K6')
  @formtype = 'K6'
  puts(@formtype)
  end
  find(:id, "row_1").click
end


When(/^I can select the appropiate Particulars of intended registration$/) do
  choose('wo')
  choose('pa')
  choose('lc')
end