
lc_private = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["Bob", "Oscar", "Francis"],"surname": "Howard"}
}]}],
"priority_notice": false,
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}'

pn_private = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["Bob", "Oscar", "Francis"],"surname": "Howard"}
}]}],
"priority_notice": true,
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}'

lc_company = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Limited Company","company": "Bob\'s Company"
}]}],
"priority_notice": false,
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_local_authority = '{"parties": [{"type": "Estate Owner","names":[{
"type": "County Council","local": {"name": "Devon County Council", "area": "Devon"}
}]}],
"priority_notice": false,
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_complex_name = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Complex Name","complex": {"name": "Lord Complexity", "number": 12345}
}]}],
"priority_notice": false,
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_other = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Other", "other": "My Other Name"
}]}],
"priority_notice": false,
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"], "district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_2_counties = '{"parties": [{"type": "Estate Owner","names":[{
"type": "County Council", "local": {"name": "Devon County Council", "area": "Devon"}
}]}],
"priority_notice": false,
"class_of_charge": "C1",
"particulars": {"counties": ["Devon", "Dorset"],"district": "South Hams", "description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

Given(/^a priority notice against a private individual$/) do
  @current_data = pn_private
end

Given(/^a land charge against a private individual$/) do
  @current_data = lc_private
end

Given(/^a land charge against a company$/) do
  @current_data = lc_company
end

Given(/^a land charge against a local_authority$/) do
  @current_data = lc_local_authority
end

Given(/^a land charge against a complex_name$/) do
  @current_data = lc_complex_name
end

Given(/^a land charge against a other name$/) do
  @current_data = lc_other
end

Given(/^a land charge against 2 counties$/) do
  @current_data = lc_2_counties
end

When(/^I submit the data to the registrations API$/) do
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
end

Then(/^a (\d+) response is returned$/) do |code|
  expect(@registration_api.response.code).to eql code  
end

Then(/^the response contains the registration number and request id$/) do
  expect(@return_data.has_key?('new_registrations')).to be true
  expect(@return_data.has_key?('request_id')).to be true
end

Then(/^the response has (\d+) registration(?:s?)$/) do |num|
  expect(@return_data['new_registrations'].length).to eq num.to_i
end

Then(/^the response contains the priority notice registration number and request id$/) do
  expect(@return_data.has_key?('priority_notices')).to be true
  expect(@return_data.has_key?('request_id')).to be true
end