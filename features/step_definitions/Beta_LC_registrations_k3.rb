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