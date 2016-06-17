When(/^I have selected to view a K(\d+) Land Charges application from the application list$/) do |arg1|
  
  maximise_browser
  visit( "#{$FRONTEND_URI}/login" )
  fill_in('username', :with => $LOGIN_USERID)
  fill_in('password', :with => $LOGIN_PASSWORD)
  click_button('login_button')
  
  find(:id, 'lc_regn').click
  within(:id, "work-list") do
    if page.has_content?"K2"
    page.first(:xpath, '//*[@id="work-list"]/tbody["2"]/tr//td[contains(.,"K2")]').click
    else
      nil
    end
     @formtype = 'K2'
    end
  end

When(/^I access the application screen for a K(\d+) the class type is set to F$/) do |arg1|
  #@class = class_display
  #expect(@class).to eq("F")
  #puts(class_display)
end


When(/^I access the application screen I can enter the priority notice$/) do
  fill_in('pri_notice',:with =>'')
end


When(/^I access the application screen the known as text box is visible$/) do
  expect(page).to have_content('Known as')
end

Then(/^the successfully completed Registration banner and number is displayed$/) do
    expect(page).to have_content('successfully completed')
    expect(page).to have_content('Registration number')
end
