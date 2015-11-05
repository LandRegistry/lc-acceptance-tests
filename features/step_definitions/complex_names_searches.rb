When(/^a complex name checkbox is available I can click it to confirm that the input name is complex$/) do
  fill_in('fullname0', :with => 'Barry Scott')
  find(:id, 'comp0').set(true)
end

When(/^I can submit the completed search the complex name indicator is saved with all the search details$/) do
  step"I click on the name details tab I can enter six names"
  step"I click on the Customer details tab I can enter the key number Customer Name Customer Address Customer Reference"
  step"I can click the complete search button"
  step"I am on the Application complete screen"
  step"the user can return to the worklist"
end

Then(/^I can check the database to confirm the complex name setting$/) do
  pending # Write code here that turns the phrase above into concrete actions
end