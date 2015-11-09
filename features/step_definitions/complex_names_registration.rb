
When(/^I click on the enter a complex name link a new screen is displayed$/) do 
  find(:id, 'enter_complex').click
end 

When(/^the complex name field is completed I can then click the search name button$/) do 
  fill_in('complex_name', :with =>'HRH KING STARK')
  click_button('continue') 
end 

When(/^the list on complex names is displayed I can select one$/) do 
    choose('comp_name_0')
end 

Then(/^I can check the database to confirm the complex name setting$/) do
  api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI) #create a local api
  regdetails = api.get("registration/#{50111}")  #set local regdetails to contain reg details
  expect(regdetails.key?('complex')).to be true  #confirm that complex details exist
  expect(regdetails['complex']['name']).to eql 'HRH KING STARK' #confirm that miss piggy is a complex name
 
end