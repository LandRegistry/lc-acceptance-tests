
lc_private = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["Bob", "Oscar", "Francis"],"surname": "Howard"}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}'

lc_existing_t_123 = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["B", "O"],"surname": "Howard"}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}'

lc_rectify_t_1 = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["B", "O"],"surname": "Howard"}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House Under the Sea"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""'

lc_rectify_t_2 = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["Robert", "Francis"],"surname": "Howard"}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""'

lc_rectify_t_3 = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["Bob", "Oscar"],"surname": "Howard"}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""'

pn_private = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Private Individual","private": {"forenames": ["Bob", "Oscar", "Francis"],"surname": "Howard"}
}]}],
"priority_notice": {"expires": "2017-01-01"},
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}'

lc_company = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Limited Company","company": "Bob\'s Company"
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_local_authority = '{"parties": [{"type": "Estate Owner","names":[{
"type": "County Council","local": {"name": "Devon County Council", "area": "Devon"}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_complex_name = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Complex Name","complex": {"name": "Lord Complexity", "number": 12345}
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"],"district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_other = '{"parties": [{"type": "Estate Owner","names":[{
"type": "Other", "other": "My Other Name"
}]}],
"class_of_charge": "C1",	
"particulars": {"counties": ["Devon"], "district": "South Hams","description": "The House At The Beach"},
"applicant": {"name": "Some Court","address": "11 Court Road, Court Town","key_number": "7654321",
"reference": "ARGL1234567"},"additional_information": ""}' 

lc_2_counties = '{"parties": [{"type": "Estate Owner","names":[{
"type": "County Council", "local": {"name": "Devon County Council", "area": "Devon"}
}]}],
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

Given(/^an existing land charge$/) do
  data = lc_existing_t_123
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @registration = @registration_api.post("/registrations", data)
end

When(/^I submit a type (\d+) rectifcation to the charge$/) do |t|
  if t == '1'
    data = lc_rectify_t_1
  elsif t == '2'
    data = lc_rectify_t_2
  elsif t == '3'
    data = lc_rectify_t_3
  end
  data += ', "update_registration": {"type": "Rectification"}}'
  date = @registration['new_registrations'][0]['date']
  regno = @registration['new_registrations'][0]['number']
  uri = "/registrations/#{date}/#{regno}"
  resp = @registration_api.put(uri, data)
  @rectified = resp
end

Then(/^the response contains the new registration numbers as well as the old$/) do
  expect(@rectified.has_key?('new_registrations')).to be true
  expect(@rectified.has_key?('amended_registrations')).to be true
  expect(@rectified['new_registrations'].length).to eq 1
  expect(@rectified['amended_registrations'].length).to eq 1
end

Then(/^the old registration is no longer revealed$/) do
    puts @rectified
  date = @rectified['amended_registrations'][0]['date']
  regno = @rectified['amended_registrations'][0]['number']
  uri = "/registrations/#{date}/#{regno}"
  oldreg = @registration_api.get(uri)
  expect(oldreg['revealed']).to be false
end

Then(/^the old registration is still revealed$/) do
  date = @rectified['amended_registrations'][0]['date']
  regno = @rectified['amended_registrations'][0]['number']
  uri = "/registrations/#{date}/#{regno}"
  oldreg = @registration_api.get(uri)
  expect(oldreg['revealed']).to be true
end

Then(/^I can reject the application$/) do
  click_link('reject')
end

