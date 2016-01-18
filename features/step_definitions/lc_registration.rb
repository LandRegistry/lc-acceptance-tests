
lc_private = '{"appn_id": "2969", "application_ref": "reference 11", "date": "2016-01-18", "document_id": 66, "status": "new", "date_of_birth": "1980-01-01", "customer_address": "2 New Street", "date_received": "2015-11-05 14:23:57", "form": "K1", "assigned_to": "", "key_number": "244095", "residence_withheld": false, "application_data": {"document_id": 66}, "customer_name": "Mr Conveyancer", "application_type": "New Registration", "lc_register_details": {"additional_info": "Some additional information that needs to be registered", "estate_owner": {"local": {"area": "", "name": ""}, "other": "", "company": "", "private": {"surname": "Jones", "forenames": "Kerry"}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Private individual"}, "class": "C(I)", "short_description": "this is a short description", "district": "this is the district", "occupation": "Carpenter", "estate_owner_ind": "privateIndividual", "county": ["Darlington"]}, "work_type": "lc_regn"}'

lc_company = '{"appn_id": "2969", "application_ref": "reference 11", "date": "2016-01-18", "document_id": 66, "status": "new", "date_of_birth": "1980-01-01", "customer_address": "2 New Street", "date_received": "2015-11-05 14:23:57", "form": "K1", "assigned_to": "", "key_number": "244095", "residence_withheld": false, "application_data": {"document_id": 66}, "customer_name": "Mr Conveyancer", "application_type": "New Registration", "lc_register_details": {"additional_info": "Some additional information that needs to be registered", "estate_owner": {"local": {"area": "", "name": ""}, "other": "", "company": "P334 and Sons Ltd", "private": {"surname": "", "forenames": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Company"}, "class": "C(I)", "short_description": "this is a short description", "district": "this is the district", "occupation": "Carpenter", "estate_owner_ind": "limitedCompany", "county": ["Darlington"]}, "work_type": "lc_regn"}'

lc_local_authority = '{"appn_id": "2969", "application_ref": "reference 11", "date": "2016-01-18", "document_id": 66, "status": "new", "date_of_birth": "1980-01-01", "customer_address": "2 New Street", "date_received": "2015-11-05 14:23:57", "form": "K1", "assigned_to": "", "key_number": "244095", "residence_withheld": false, "application_data": {"document_id": 66}, "customer_name": "Mr Conveyancer", "application_type": "New Registration", "lc_register_details": {"additional_info": "Some additional information that needs to be registered", "estate_owner": {"local": {"area": "Plymouth", "name": "Plymouth City Council"}, "other": "", "company": "", "private": {"surname": "", "forenames": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Local Authority"}, "class": "C(I)", "short_description": "this is a short description", "district": "this is the district", "occupation": "Carpenter", "estate_owner_ind": "localAuthority", "county": ["Darlington"]}, "work_type": "lc_regn"}'

lc_complex_name = '{"appn_id": "2969", "application_ref": "reference 11", "date": "2016-01-18", "document_id": 66, "status": "new", "date_of_birth": "1980-01-01", "customer_address": "2 New Street", "date_received": "2015-11-05 14:23:57", "form": "K1", "assigned_to": "", "key_number": "244095", "residence_withheld": false, "application_data": {"document_id": 66}, "customer_name": "Mr Conveyancer", "application_type": "New Registration", "lc_register_details": {"additional_info": "Some additional information that needs to be registered", "estate_owner": {"local": {"area": "", "name": ""}, "other": "", "company": "", "private": {"surname": "", "forenames": ""}, "complex": {"number": 100012, "name": "King Bob"}, "estate_owner_ind": "Complex Name"}, "class": "C(I)", "short_description": "this is a short description", "district": "this is the district", "occupation": "Carpenter", "estate_owner_ind": "complexName", "county": ["Darlington"]}, "work_type": "lc_regn"}'

lc_other = '{"appn_id": "2969", "application_ref": "reference 11", "date": "2016-01-18", "document_id": 66, "status": "new", "date_of_birth": "1980-01-01", "customer_address": "2 New Street", "date_received": "2015-11-05 14:23:57", "form": "K1", "assigned_to": "", "key_number": "244095", "residence_withheld": false, "application_data": {"document_id": 66}, "customer_name": "Mr Conveyancer", "application_type": "New Registration", "lc_register_details": {"additional_info": "Some additional information that needs to be registered", "estate_owner": {"local": {"area": "", "name": ""}, "other": "A N Other", "company": "", "private": {"surname": "", "forenames": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Other Name"}, "class": "C(I)", "short_description": "this is a short description", "district": "this is the district", "occupation": "Carpenter", "estate_owner_ind": "other", "county": ["Darlington"]}, "work_type": "lc_regn"}'

lc_2_counties = '{"appn_id": "2969", "application_ref": "reference 11", "date": "2016-01-18", "document_id": 66, "status": "new", "date_of_birth": "1980-01-01", "customer_address": "2 New Street", "date_received": "2015-11-05 14:23:57", "form": "K1", "assigned_to": "", "key_number": "244095", "residence_withheld": false, "application_data": {"document_id": 66}, "customer_name": "Mr Conveyancer", "application_type": "New Registration", "lc_register_details": {"additional_info": "Some additional information that needs to be registered", "estate_owner": {"local": {"area": "", "name": ""}, "other": "", "company": "", "private": {"surname": "Jones", "forenames": "Kerry"}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Private individual"}, "class": "C(I)", "short_description": "this is a short description", "district": "this is the district", "occupation": "Carpenter", "estate_owner_ind": "privateIndividual", "county": ["Darlington", "Devon"]}, "work_type": "lc_regn"}'

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