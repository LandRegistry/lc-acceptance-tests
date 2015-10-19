When(/^I select an application type of Full Search the application is displayed$/) do
  visit( "http://localhost:5010/get_list?appn=search" )
  find(:id,'app_type3').click
end

Given(/^I am on the bankruptcy full search details screen$/) do
  expect(page).to have_content('Full Search')
  expect(page).to have_content('Full Name')
  expect(page).to have_content('Complete the debtor')
  expect(page).to have_button('Complete Search')
end

When(/^I click on entered details in the address box I can make an amendment$/) do
  fill_in('customer_address',:with => '4749 DUBUQUE Terrace'"\n"'JAYSONFURT'"\n"'SOUTH VINCENZA'"\n"'NORTHAMPTONSHIRE'"\n"'FC13 4WX')
end

When(/^I click on the search areas tab all counties check box search area  List of Areas to search is displayed$/) do
  click_link('Search Areas')
  check('all_counties')
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
   click_button('Complete Search')
end





