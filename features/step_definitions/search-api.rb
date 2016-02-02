date = Date.today.prev_day
yesterday = date.strftime("%Y-%m-%d")
today = Date.today.strftime("%Y-%m-%d")

pi_registration = '{"class_of_charge": "New Registration", "application_data": {"document_id": 66}, "work_type": "lc_regn", "application_type": "K1", "customer_address": "2 New Street", "document_id": 66, "date_received": "2015-11-05 14:01:57", "lc_register_details": {"short_description": "description", "district": "district", "occupation": "", "additional_info": "", "estate_owner": {"private": {"surname": "West", "forenames": ["Joycelyn"]}, "company": "", "local": {"name": "", "area": ""}, "complex": {"name": "", "number": 0}, "other": "", "estate_owner_ind": "Private Individual"}, "estate_owner_ind": "Private Individual", "county": ["Devon"], "class": "C(I)"}, "customer_name": "Mr Conveyancer", "application_ref": "reference 11", "assigned_to": null, "form": "K1", "date_of_birth": "1980-01-01", "key_number": "244095", "appn_id": "843", "date": "' + today + '", "residence_withheld": false, "status": "new"}'

pi_search = '{"document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": "Joyce Lyn", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '"}'

search_res_pi = 'Joyce%20Lyn%20West'

co_registration = '{"customer_name": "Mr Conveyancer", "date": "' + today + '", "form": "K1", "residence_withheld": false, "application_data": {"document_id": 66}, "application_ref": "reference 11", "assigned_to": null, "lc_register_details": {"estate_owner_ind": "Limited Company", "class": "C(I)", "county": ["Cornwall (including Isles of Scilly)"], "district": "Redruth", "short_description": "A small dwelling", "estate_owner": {"estate_owner_ind": "Limited Company", "other": "", "company": "ABC Builder And Son Public Limited Company", "complex": {"number": 0, "name": ""}, "local": {"area": "", "name": ""}, "private": {"surname": "", "forenames": [""]}}, "additional_info": "", "occupation": ""}, "application_type": "K1", "work_type": "lc_regn", "document_id": 66, "class_of_charge": "New Registration", "date_received": "2015-11-05 14:01:57", "status": "new", "appn_id": "2730", "customer_address": "2 New Street", "date_of_birth": "1980-01-01", "key_number": "244095"}'

co_search = '{"document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"company_name": "ABC Builders And Sons P L C"}, "name_type": "Company", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '"}'

search_res_co = 'ABC%20Builders%20And%20Sons%20P%20L%20C'

council_reg = '{"form": "K1", "date": "' + today + '", "document_id": 66, "work_type": "lc_regn", "lc_register_details": {"class": "C(I)", "estate_owner_ind": "County Council", "occupation": "", "additional_info": "", "district": "Plymouth", "county": ["Devon"], "short_description": "A big house", "estate_owner": {"company": "", "complex": {"number": 0, "name": ""}, "other": "", "estate_owner_ind": "County Council", "local": {"area": "Plymouth", "name": "Plymouth City Council"}, "private": {"surname": "", "forenames": [""]}}}, "application_ref": "reference 11", "residence_withheld": false, "date_of_birth": "1980-01-01", "customer_name": "Mr Conveyancer", "status": "new", "customer_address": "2 New Street", "date_received": "2015-11-05 14:01:57", "application_data": {"document_id": 66}, "key_number": "244095", "appn_id": "4515", "class_of_charge": "New Registration", "application_type": "K1", "assigned_to": null}'

council_search = '{"customer": {"key_number": "1234567", "reference": "Ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "name": "S & H Legal Group"}, "parameters": {"search_items": [{"year_from": 1925, "year_to": 2016, "name": {"local_authority_area": "Plymouth", "local_authority_name": "Plymouth City Council"}, "name_type": "Local Authority"}], "search_type": "full", "counties": ["ALL"]}, "document_id": 60, "expiry_date": "2016-02-21", "search_date": "' + today + '"}'

search_council = 'Plymouth%20City%20Council'

complex_name_reg = '{"application_ref": "reference 11", "customer_name": "Mr Conveyancer", "assigned_to": null, "application_type": "K1", "key_number": "244095", "customer_address": "2 New Street", "residence_withheld": false, "application_data": {"document_id": 66}, "date": "' + today + '", "class_of_charge": "New Registration", "work_type": "lc_regn", "form": "K1", "document_id": 66, "appn_id": "4821", "date_of_birth": "1980-01-01", "date_received": "2015-11-05 14:01:57", "status": "new", "lc_register_details": {"occupation": "", "estate_owner_ind": "Complex Name", "additional_info": "", "estate_owner": {"other": "", "complex": {"number": 1000167, "name": "HRH KING STARK"}, "estate_owner_ind": "Complex Name", "private": {"surname": "", "forenames": [""]}, "local": {"area": "", "name": ""}, "company": ""}, "short_description": "Town and county", "county": ["Cornwall (including Isles of Scilly)"], "class": "D(I)", "district": "Redruth"}}'

complex_name_search = '{"document_id": 60, "parameters": {"search_items": [{"name_type": "Complex", "name": {"complex_name": "HRH KING STARK", "complex_variations": [{"complex_name": "KING STARK OF THE NORTH", "complex_number": 1000167}, {"complex_name": "HRH KING STARK", "complex_number": 1000167}, {"complex_name": "His Royal Highness Robert Stark of Winterfell and King in the North", "complex_number": 1000167}], "complex_number": 1000167}, "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "search_date": "' + today + '", "customer": {"reference": "ref", "name": "S & H Legal Group", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "expiry_date": "2016-02-21"}'

search_res_complex = 'HRH%20KING%20STARK'

other_reg = '{"date": "' + today + '", "date_of_birth": "1980-01-01", "appn_id": "5127", "date_received": "2015-11-05 14:01:57", "assigned_to": null, "customer_name": "Mr Conveyancer", "application_ref": "reference 11", "lc_register_details": {"estate_owner_ind": "Other", "additional_info": "", "estate_owner": {"estate_owner_ind": "Other", "complex": {"name": "", "number": 0}, "company": "", "other": "Jessop Society and Associations for Brothers and Companies Limited", "private": {"forenames": [""], "surname": ""}, "local": {"name": "", "area": ""}}, "occupation": "", "district": "Torquay", "short_description": "Kents Cavens", "county": ["Torbay"], "class": "C(III)"}, "work_type": "lc_regn", "customer_address": "2 New Street", "status": "new", "document_id": 66, "application_type": "K1", "residence_withheld": false, "key_number": "244095", "application_data": {"document_id": 66}, "class_of_charge": "New Registration", "form": "K1"}'

other_search = '{"customer": {"name": "S & H Legal Group", "key_number": "1234567", "reference": "sdf", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY"}, "search_date": "' + today + '", "document_id": 60, "parameters": {"search_items": [{"name_type": "Other", "name": {"other_name": "Jessop Societies and Associates for Bros and Comp Ltd"}, "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "expiry_date": "2016-02-21"}'

search_res_other = 'Jessop%20Societies%20and%20Associates%20for%20Bros%20and%20Comp%20Ltd'

pa_reg = '{"document_id": 66, "date_of_birth": "1980-01-01", "key_number": "244095", "date": "' + today + '", "form": "K1", "date_received": "2015-11-05 14:01:57", "status": "new", "application_type": "K1", "residence_withheld": false, "lc_register_details": {"class": "PA", "estate_owner_ind": "Private Individual", "estate_owner": {"other": "", "company": "", "private": {"forenames": ["Joe"], "surname": "Bloggs"}, "local": {"area": "", "name": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Private Individual"}, "district": "Penzance", "additional_info": "", "county": ["Cornwall (including Isles of Scilly)"], "short_description": "A slight dwelling", "occupation": ""}, "customer_address": "2 New Street", "application_data": {"document_id": 66}, "class_of_charge": "New Registration", "appn_id": "5382", "application_ref": "reference 11", "assigned_to": null, "customer_name": "Mr Conveyancer", "work_type": "lc_regn"}'

pa_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joe", "surname": "Bloggs"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joyce Lyn ", "surname": "Peterson"}}], "counties": ["Dorset"]}, "document_id": 60}'

search_res_pa = 'Joe%20Bloggs'

wo_reg = '{"document_id": 66, "date_of_birth": "1980-01-01", "key_number": "244095", "date": "' + today + '", "form": "K1", "date_received": "2015-11-05 14:01:57", "status": "new", "application_type": "K1", "residence_withheld": false, "lc_register_details": {"class": "WO", "estate_owner_ind": "Private Individual", "estate_owner": {"other": "", "company": "", "private": {"forenames": ["Jock"], "surname": "Bloggs"}, "local": {"area": "", "name": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Private Individual"}, "district": "Penzance", "additional_info": "", "county": ["Cornwall (including Isles of Scilly)"], "short_description": "A slight dwelling", "occupation": ""}, "customer_address": "2 New Street", "application_data": {"document_id": 66}, "class_of_charge": "New Registration", "appn_id": "5382", "application_ref": "reference 11", "assigned_to": null, "customer_name": "Mr Conveyancer", "work_type": "lc_regn"}'

wo_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Jock", "surname": "Bloggs"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joyce Lyn ", "surname": "Peterson"}}], "counties": ["Dorset"]}, "document_id": 60}'

search_res_wo = 'Jock%20Bloggs'

c1_registration = '{"class_of_charge": "New Registration", "application_data": {"document_id": 66}, "work_type": "lc_regn", "application_type": "K1", "customer_address": "2 New Street", "document_id": 66, "date_received": "2015-11-05 14:01:57", "lc_register_details": {"short_description": "description", "district": "district", "occupation": "", "additional_info": "", "estate_owner": {"private": {"surname": "Peterson", "forenames": ["Joycelyn"]}, "company": "", "local": {"name": "", "area": ""}, "complex": {"name": "", "number": 0}, "other": "", "estate_owner_ind": "Private Individual"}, "estate_owner_ind": "Private Individual", "county": ["Devon"], "class": "C(I)"}, "customer_name": "Mr Conveyancer", "application_ref": "reference 11", "assigned_to": null, "form": "K1", "date_of_birth": "1980-01-01", "key_number": "244095", "appn_id": "843", "date": "' + today + '", "residence_withheld": false, "status": "new"}'

search_res_c1 = 'Joyce%20Lyn%20Peterson'

pa_date_reg = '{"document_id": 66, "date_of_birth": "1980-01-01", "key_number": "244095", "date": "' + today + '", "form": "K1", "date_received": "2015-11-05 14:01:57", "status": "new", "application_type": "K1", "residence_withheld": false, "lc_register_details": {"class": "PA", "estate_owner_ind": "Private Individual", "estate_owner": {"other": "", "company": "", "private": {"forenames": ["Jack"], "surname": "Jones"}, "local": {"area": "", "name": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Private Individual"}, "district": "Penzance", "additional_info": "", "county": ["Cornwall (including Isles of Scilly)"], "short_description": "A slight dwelling", "occupation": ""}, "customer_address": "2 New Street", "application_data": {"document_id": 66}, "class_of_charge": "New Registration", "appn_id": "5382", "application_ref": "reference 11", "assigned_to": null, "customer_name": "Mr Conveyancer", "work_type": "lc_regn"}'

pa_date_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Jack", "surname": "Jones"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Paul ", "surname": "Harris-Jones"}}], "counties": ["Cornwall (including Isles of Scilly)"]}, "document_id": 60}'

search_res_pa_date = 'Jack%20Jones'

wo_date_reg = '{"document_id": 66, "date_of_birth": "1980-01-01", "key_number": "244095", "date": "' + today + '", "form": "K1", "date_received": "2015-11-05 14:01:57", "status": "new", "application_type": "K1", "residence_withheld": false, "lc_register_details": {"class": "WO", "estate_owner_ind": "Private Individual", "estate_owner": {"other": "", "company": "", "private": {"forenames": ["Jason"], "surname": "Smith"}, "local": {"area": "", "name": ""}, "complex": {"number": 0, "name": ""}, "estate_owner_ind": "Private Individual"}, "district": "Penzance", "additional_info": "", "county": ["Cornwall (including Isles of Scilly)"], "short_description": "A slight dwelling", "occupation": ""}, "customer_address": "2 New Street", "application_data": {"document_id": 66}, "class_of_charge": "New Registration", "appn_id": "5382", "application_ref": "reference 11", "assigned_to": null, "customer_name": "Mr Conveyancer", "work_type": "lc_regn"}'

wo_date_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Jason", "surname": "Smith"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Paul ", "surname": "Harris-Jones"}}], "counties": ["Cornwall (including Isles of Scilly)"]}, "document_id": 60}'

search_res_wo_date = 'Jason%20Smith'

c2_registration = '{"class_of_charge": "New Registration", "application_data": {"document_id": 66}, "work_type": "lc_regn", "application_type": "K1", "customer_address": "2 New Street", "document_id": 66, "date_received": "2015-11-05 14:01:57", "lc_register_details": {"short_description": "description", "district": "district", "occupation": "", "additional_info": "", "estate_owner": {"private": {"surname": "Harris Jones", "forenames": ["Paul"]}, "company": "", "local": {"name": "", "area": ""}, "complex": {"name": "", "number": 0}, "other": "", "estate_owner_ind": "Private Individual"}, "estate_owner_ind": "Private Individual", "county": ["Cornwall (including Isles of Scilly)"], "class": "C(II)"}, "customer_name": "Mr Conveyancer", "application_ref": "reference 11", "assigned_to": null, "form": "K1", "date_of_birth": "1980-01-01", "key_number": "244095", "appn_id": "843", "date": "' + today + '", "residence_withheld": false, "status": "new"}'

search_res_c2 = 'Paul%20Harris%20Jones'

Given(/^I have submitted a new registration for a (.+)$/) do |name_type|
  puts name_type
  if name_type == 'private individual'
    @current_data = pi_registration
  elsif name_type == 'company'
    @current_data = co_registration
  elsif name_type == 'council'
    @current_data = council_reg
  elsif name_type == 'complex name'
    @current_data = complex_name_reg
  elsif name_type == 'other'
    @current_data = other_reg
  end
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no = @return_data['new_registrations'][0]['number']
end

Given(/^I have submitted a registration for a C1 and PA$/) do
  @current_data = c1_registration
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no_c1 = @return_data['new_registrations'][0]['number']
  @current_data = pa_reg
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no_pa = @return_data['new_registrations'][0]['number']
end

Given(/^I have submitted a registration for a C1 and WO$/) do
  @current_data = c1_registration
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no_c1 = @return_data['new_registrations'][0]['number']
  @current_data = wo_reg
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no_wo = @return_data['new_registrations'][0]['number']
end

Given(/^I have submitted a registration for a C2 and (.+)$/) do |charge|
  @current_data = c2_registration
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no_c2 = @return_data['new_registrations'][0]['number']
  if charge == 'PA'
    @current_data = pa_date_reg
  elsif charge == 'WO'
    @current_data = wo_date_reg
  end
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @reg_no_pawo = @return_data['new_registrations'][0]['number']
end

When(/^I submit a full search for a (.+)$/) do |name_type|
  if name_type == 'private individual'
    @current_data = pi_search
  elsif name_type == 'company'
    @current_data = co_search
  elsif name_type == 'council'
    @current_data = council_search
  elsif name_type == 'complex name'
    @current_data = complex_name_search
  elsif name_type == 'other'
    @current_data = other_search
  end
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", @current_data)
end

When(/^I query the search result using a (.+)$/) do |name_type|
  if name_type == 'private individual'
    @current_data = search_res_pi
  elsif name_type == 'company'
    @current_data = search_res_co
  elsif name_type == 'council'
    @current_data = search_council
  elsif name_type == 'complex name'
    @current_data = search_res_complex
  elsif name_type == 'other'
    @current_data = search_res_other
  end
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.get("/searches?name=#{@current_data}")
end

When(/^I submit a combined C1 and PA search$/) do
  @current_data = pa_search
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", @current_data)
end

When(/^I query the C1 and PA search result$/) do
  @current_data = search_res_pa
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @pa_data = @search_api.get("/searches?name=#{@current_data}")
  @current_data = search_res_c1
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @c1_data = @search_api.get("/searches?name=#{@current_data}")
end

When(/^I submit a combined C1 and WO search$/) do
  @current_data = wo_search
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", @current_data)
end

When(/^I query the C1 and WO search result$/) do
  @current_data = search_res_wo
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @wo_data = @search_api.get("/searches?name=#{@current_data}")
  @current_data = search_res_c1
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @c1_data = @search_api.get("/searches?name=#{@current_data}")
end

When(/^I submit a combined C2 and (.+) search with search period pre registration$/) do |charge|
  if charge == 'PA'
    @current_data = pa_date_search
  elsif charge == 'WO'
    @current_data = wo_date_search
  end
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", @current_data)
end

When(/^I query the C2 and (.+) search result$/) do |charge|
  if charge == 'PA'
    @current_data = search_res_pa_date
  elsif charge == 'WO'
    @current_data = search_res_wo_date
  end
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @pawo_data = @search_api.get("/searches?name=#{@current_data}")
  @current_data = search_res_c2
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @c2_data = @search_api.get("/searches?name=#{@current_data}")
end

Then(/^the response contains the registration details$/) do
  expect(@return_data[0].has_key?('reg_no')).to be true
  expect(@return_data[0]['reg_no'] == @reg_no).to be true
end

Then(/^the response contains the complex name registration details$/) do
  expect(@return_data[0].has_key?('reg_no')).to be true
  expect(@return_data).to have_content(@reg_no)
end

Then(/^the PA returns a hit but the C1 does not$/) do
  expect(@pa_data[0].has_key?('reg_no')).to be true
  expect(@pa_data[0]['reg_no'] == @reg_no_pa).to be true
  expect(@c1_data).to be_empty
end

Then(/^the WO returns a hit but the C1 does not$/) do
  expect(@wo_data[0].has_key?('reg_no')).to be true
  expect(@wo_data[0]['reg_no'] == @reg_no_wo).to be true
  expect(@c1_data).to be_empty
end

Then(/^the (.+) returns a hit but the C2 does not$/) do |charge|
  expect(@pawo_data[0].has_key?('reg_no')).to be true
  expect(@pawo_data[0]['reg_no'] == @reg_no_pawo).to be true
  expect(@c2_data).to be_empty
end