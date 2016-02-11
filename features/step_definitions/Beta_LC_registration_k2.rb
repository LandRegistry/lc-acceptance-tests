When(/^I have selected to view a K(\d+) Land Charges application from the application list$/) do |arg1|
  visit( "#{$FRONTEND_URI}/get_list?appn=lc_regn" )
  within(:xpath, ".//*[@id='row_2']/td[2]") do
  page.should have_content('K2')
  @formtype = 'K2'
  puts(@formtype)
  end
  find(:id, "row_2").click
end



When(/^I access the application screen for a K(\d+) the class type is set to F$/) do |arg1|
  #@class = class_display
  #expect(@class).to eq("F")
  #puts(class_display)
end


When(/^I access the application screen I can enter the priority notice$/) do
  fill_in('pri_notice',:with =>'abcde')
end


When(/^I access the application screen the known as text box is visible$/) do
  expect(page).to have_content('Known as')
end
