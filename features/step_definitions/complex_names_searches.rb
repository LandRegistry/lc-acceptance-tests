When(/^a complex name checkbox is available I can click it to confirm that the input name is complex$/) do
  fill_in('fullname0', :with => 'Barry Scott')
  find(:id, 'comp0').set(true)
end

When(/^I can submit the completed search the complex name indicator is saved with all the search details$/) do
  #step"I click on the name details tab I can enter six names"
  step"I click continue the customer details screen is displayed"
  step"I can click the complete search button"
  step"I am on the Application complete screen"
  step"the user can return to the worklist"
end

When(/^I select Complex names from First name section$/) do
  select 'Complex name', from: "nameType_1"
end

When(/^I select Complex names from Second name section$/) do
  select 'Complex name', from: "nameType_2"
end


When(/^I can confirm the exact variation of names for my first search name$/) do
  within_table('name_results_1') do
    should have_xpath("//tr", :count => 6)
  end
  expect(page).to have_content('KING STARK OF THE NORTH') 
  expect(page).to have_content('HRH KING STARK') 
  expect(page).to have_content('THE KING IN THE NORTH') 
  expect(page).to have_content('HRH KING STARK') 
  expect(page).to have_content('HRH KING STARKE') 
  expect(page).to have_content('His Royal Highness Robert Stark of Winterfell and King in the North') 
end

When(/^I can confirm the exact variation of names for my second search name$/) do
  within_table('name_results_2') do
    should have_xpath("//tr", :count => 6)
  end
  expect(page).to have_content('KING STARK OF THE NORTH') 
  expect(page).to have_content('HRH KING STARK') 
  expect(page).to have_content('THE KING IN THE NORTH') 
  expect(page).to have_content('HRH KING STARK') 
  expect(page).to have_content('HRH KING STARKE') 
  expect(page).to have_content('His Royal Highness Robert Stark of Winterfell and King in the North') 
end

When(/^I can confirm there is no match for the second name search$/) do
  expect(page).to have_content('No match found for the name entered.') 
end

When(/^I enter Complex name for the first name search$/) do
  fill_in('complex_name_field_1', :with =>'king stark')
end

When(/^I enter Complex name for the second name search$/) do
  fill_in('complex_name_field_2', :with =>'stark')
end

When(/^I enter an unknown Complex name for the second name search$/) do
  fill_in('complex_name_field_2', :with =>'dusty')
end

When(/^I click on the first look up complex name link$/) do
  click_link('name_lookup_link_1')
end

When(/^I click on the second look up complex name link$/) do
  click_link('name_lookup_link_2')
end

Then(/^I can see the Complex name results table$/) do
  expect(page).to have_content('Complex name result') 
  expect(page).to have_content('Please select a complex name from the list')
end

Then(/^I can see the Complex name results pop up$/) do
  expect(page).to have_content('Complex name result') 
end
