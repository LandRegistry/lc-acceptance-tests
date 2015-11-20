When(/^I select an application type of Full Search the application is displayed$/) do
  visit("#{$FRONTEND_URI}/get_list?appn=search")
  find(:id,'app_type1').click
end

Given(/^I am on the full search details screen$/) do
  expect(page).to have_content('Land charge and bankruptcy search')
  expect(page).to have_content('Full name')
  expect(page).to have_content('Name(s) to be searched')
  expect(page).to have_button('Continue')
end

When(/^I click on entered details in the address box I can make an amendment$/) do
  fill_in('customer_address',:with => '4749 DUBUQUE Terrace'"\n"'JAYSONFURT'"\n"'SOUTH VINCENZA'"\n"'NORTHAMPTONSHIRE'"\n"'FC13 4WX')
end

When(/^I click yes to search all counties$/) do
  find(:id, 'hide').click
end

When(/^I click continue the county details screen is displayed$/) do
  click_button('continue')
end

When(/^I enter details into the search area edit box I can click on the add area button$/) do
  fill_in('search_area',:with =>'Plymouth')
  click_link('Add Area')
  fill_in('search_area',:with =>'Saltash')
  click_link('Add Area')
end

When(/^add area button is clicked the search area details are added to the List of areas to search box$/) do
  #expect('area_list').to have_content('Plymouth')

end

When(/^I click on entered details in the list of areas search box I can make an amendment$/) do
  fill_in('area_list',:with =>'Plymouth')
end



When(/^I click in the search to field I can add the current year$/) do
  fill_in('year_from0',:with =>'1975')
  fill_in('year_to0',:with =>'1976')
  fill_in('year_from3',:with =>'1969')
  fill_in('year_from4',:with =>'2000')
end

Then(/^I can click the complete search button when the customer address field is complete$/) do
   click_button('submit')
end





