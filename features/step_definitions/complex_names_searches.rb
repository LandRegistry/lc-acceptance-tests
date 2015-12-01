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

