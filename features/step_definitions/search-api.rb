date = Date.today.prev_day
yesterday = date.strftime("%Y-%m-%d")
today = Date.today.strftime("%Y-%m-%d")

pi_registration = '{"parties": [{"names": [{"private": {"forenames": ["Joyce", "Lyn"], "surname": "West"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "45 New street", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#pi_search = '{"document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": "Joyce Lyn", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '"}'
pi_search = '{"cert_no": "14532", "document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": "Joyce Lyn", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "reference": "ref", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "address_type": "RM"}, "search_date": "' + today + '"}'

search_res_pi = 'Joyce%20Lyn%20West'

co_registration = '{"parties": [{"names": [{"company": "ABC Builders and Sons PLC", "type": "Limited Company"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "sdfskajh", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#co_search = '{"document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"company_name": "ABC Builders And Sons P L C"}, "name_type": "Company", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '"}'
co_search = '{"cert_no": "14532","document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"company_name": "ABC Builders And Sons P L C"}, "name_type": "Limited Company", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "reference": "ref", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "address_type": "RM"}, "search_date": "' + today + '"}'

search_res_co = 'ABC%20Builders%20And%20Sons%20P%20L%20C'

council_reg = '{"parties": [{"names": [{"local": {"name": "Plymouth City Council", "area": "Plymouth"}, "type": "County Council"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "33", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#council_search = '{"customer": {"key_number": "1234567", "reference": "Ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "name": "S & H Legal Group"}, "parameters": {"search_items": [{"year_from": 1925, "year_to": 2016, "name": {"local_authority_area": "Plymouth", "local_authority_name": "Plymouth City Council"}, "name_type": "Local Authority"}], "search_type": "full", "counties": ["ALL"]}, "document_id": 60, "expiry_date": "2016-02-21", "search_date": "' + today + '"}'
council_search = '{"cert_no": "14532","customer": {"key_number": "2244095", "reference": "Ref", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}, "parameters": {"search_items": [{"year_from": 1925, "year_to": 2016, "name": {"local_authority_area": "Plymouth", "local_authority_name": "Plymouth City Council"}, "name_type": "County Council"}], "search_type": "full", "counties": ["ALL"]}, "document_id": 60, "expiry_date": "2016-02-21", "search_date": "' + today + '"}'

search_council = 'Plymouth%20City%20Council'

complex_name_reg = '{"parties": [{"names": [{"complex": {"name": "HRH KING STARK", "number": 1000167}, "type": "Complex Name"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "House", "district": "PLymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#complex_name_search = '{"document_id": 60, "search_date": "' + today + '", "parameters": {"search_items": [{"year_from": 1925, "name_type": "Complex", "year_to": 2016, "name": {"complex_variations": [{"name": "KING STARK OF THE NORTH", "number": 1000167}, {"name": "HRH KING STARK", "number": 1000167}, {"name": "THE KING IN THE NORTH", "number": 1000167}, {"name": "His Royal Highness Robert Stark of Winterfell and King in the North", "number": 1000167}], "complex_name": "HRH KING STARK", "complex_number": 1000167}}], "counties": ["ALL"], "search_type": "full"}, "expiry_date": "2016-02-29", "customer": {"name": "S & H Legal Group", "reference": "sdfdf", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}}'
complex_name_search = '{"cert_no": "14532","document_id": 60, "search_date": "' + today + '", "parameters": {"search_items": [{"year_from": 1925, "name_type": "Complex", "year_to": 2016, "name": {"complex_variations": [{"name": "KING STARK OF THE NORTH", "number": 1000167}, {"name": "HRH KING STARK", "number": 1000167}, {"name": "THE KING IN THE NORTH", "number": 1000167}, {"name": "His Royal Highness Robert Stark of Winterfell and King in the North", "number": 1000167}], "complex_name": "HRH KING STARK", "complex_number": 1000167}}], "counties": ["ALL"], "search_type": "full"}, "expiry_date": "2016-02-29", "customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "reference": "sdfdf", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "address_type": "RM"}}'

search_res_complex = 'HRH%20KING%20STARK'

other_reg = '{"parties": [{"names": [{"other": "Jessop Society and Associations for Brothers and Companies Limited", "type": "Other"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "dsakj", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#other_search = '{"customer": {"name": "S & H Legal Group", "key_number": "1234567", "reference": "sdf", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY"}, "search_date": "' + today + '", "document_id": 60, "parameters": {"search_items": [{"name_type": "Other", "name": {"other_name": "Jessop Societies and Associates for Bros and Comp Ltd"}, "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "expiry_date": "2016-02-21"}'
other_search = '{"cert_no": "14532","customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "key_number": "2244095", "reference": "sdf", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "address_type": "RM"}, "search_date": "' + today + '", "document_id": 60, "parameters": {"search_items": [{"name_type": "Other", "name": {"other_name": "Jessop Societies and Associates for Bros and Comp Ltd"}, "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "expiry_date": "2016-02-21"}'

search_res_other = 'Jessop%20Societies%20and%20Associates%20for%20Bros%20and%20Comp%20Ltd'

pa_reg = '{"parties": [{"names": [{"private": {"forenames": ["Joe"], "surname": "Bloggs"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "A well", "district": "Plymouth"}, "class_of_charge": "PA", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#pa_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joe", "surname": "Bloggs"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joyce Lyn ", "surname": "Peterson"}}], "counties": ["Dorset"]}, "document_id": 60}'
pa_search = '{"cert_no": "14532", "search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "reference": "ref", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joe", "surname": "Bloggs"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joyce Lyn ", "surname": "Peterson"}}], "counties": ["Dorset"]}, "document_id": 60}'

search_res_pa = 'Joe%20Bloggs'

wo_reg = '{"parties": [{"names": [{"private": {"forenames": ["Jock"], "surname": "Bloggs"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "A well", "district": "Plymouth"}, "class_of_charge": "WO", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#wo_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Jock", "surname": "Bloggs"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joyce Lyn ", "surname": "Peterson"}}], "counties": ["Dorset"]}, "document_id": 60}'
wo_search = '{"cert_no": "14532","search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "reference": "ref", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Jock", "surname": "Bloggs"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 2016, "name": {"forenames": "Joyce Lyn ", "surname": "Peterson"}}], "counties": ["Dorset"]}, "document_id": 60}'

search_res_wo = 'Jock%20Bloggs'

c1_registration = '{"parties": [{"names": [{"private": {"forenames": ["Joycelyn"], "surname": "Peterson"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "My house", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

search_res_c1 = 'Joyce%20Lyn%20Peterson'

pa_date_reg = '{"parties": [{"names": [{"private": {"forenames": ["Jack"], "surname": "Jones"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "A well", "district": "Plymouth"}, "class_of_charge": "PA", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#pa_date_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Jack", "surname": "Jones"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Paul ", "surname": "Harris-Jones"}}], "counties": ["Cornwall (including Isles of Scilly)"]}, "document_id": 60}'
pa_date_search = '{"cert_no": "14532","search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "reference": "ref", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Jack", "surname": "Jones"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Paul ", "surname": "Harris-Jones"}}], "counties": ["Cornwall (including Isles of Scilly)"]}, "document_id": 60}'

search_res_pa_date = 'Jack%20Jones'

wo_date_reg = '{"parties": [{"names": [{"private": {"forenames": ["Jason"], "surname": "Smith"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "A well", "district": "Plymouth"}, "class_of_charge": "WO", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#wo_date_search = '{"search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567", "reference": "ref", "name": "S & H Legal Group"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Jason", "surname": "Smith"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Paul ", "surname": "Harris-Jones"}}], "counties": ["Cornwall (including Isles of Scilly)"]}, "document_id": 60}'
wo_date_search = '{"cert_no": "14532","search_date": "' + today + '", "expiry_date": "2016-02-21", "customer": {"address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "reference": "ref", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}, "parameters": {"search_type": "full", "search_items": [{"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Jason", "surname": "Smith"}}, {"name_type": "Private Individual", "year_from": 1925, "year_to": 1966, "name": {"forenames": "Paul ", "surname": "Harris-Jones"}}], "counties": ["Cornwall (including Isles of Scilly)"]}, "document_id": 60}'

search_res_wo_date = 'Jason%20Smith'

c2_registration = '{"parties": [{"names": [{"private": {"forenames": ["Paul"], "surname": "Harris-Jones"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "My house", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

search_res_c2 = 'Paul%20Harris%20Jones'

reg_template = '{"particulars": {"counties": ["Devon"], "description": "dsfkj", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Limited Company", "company": "A company '

#search_template = '{"document_id": 60, "expiry_date": "2016-02-18", "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '", "parameters": {"search_type": "full", "counties": ["ALL"], "search_items": [{"name_type": "Company", "year_to": 2016, "year_from": 1925, "name": {"company_name": "A Company '
search_template = '{"cert_no": "14532", "document_id": 60, "expiry_date": "2016-02-18", "customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "reference": "ref", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "address_type": "RM"}, "search_date": "' + today + '", "parameters": {"search_type": "full", "counties": ["ALL"], "search_items": [{"name_type": "Limited Company", "year_to": 2016, "year_from": 1925, "name": {"company_name": "A Company '

search_res_template = 'A%20Company%20'

name_array = ['BROKER', 'BUILDER', 'COLLEGE', 'COMMISSIONER', 'CONSTRUCTION', 'CONTRACTOR', 'DECORATOR','DEVELOPER', 'DEVELOPMENT', 'ENTERPRISE', 'ESTATE', 'GARAGE', 'HOLDING', 'HOTEL', 'INVESTMENT', 'MOTOR', 'PRODUCTION', 'SCHOOL', 'SON', 'STORE', 'TRUST', 'WARDEN', 'CHARITY', 'PROPERTY', 'INDUSTRY']
search_array = ['BROKERS', 'BUILDERS', 'COLLEGES', 'COMMISSIONERS', 'CONSTRUCTIONS', 'CONTRACTORS', 'DECORATORS', 'DEVELOPERS', 'DEVELOPMENTS', 'ENTERPRISES', 'ESTATES', 'GARAGES', 'HOLDINGS', 'HOTELS', 'INVESTMENTS', 'MOTORS', 'PRODUCTIONS', 'SCHOOLS', 'SONS', 'STORES', 'TRUSTS', 'WARDENS', 'CHARITIES', 'PROPERTIES', 'INDUSTRIES']

initials_reg = '{"parties": [{"names": [{"private": {"forenames": ["J", "L"], "surname": "West"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "45 New street", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#initials_search = '{"document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": "J L", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '"}'
initials_search = '{"cert_no": "14532", "document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": "J L", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "reference": "ref", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "address_type": "RM"}, "search_date": "' + today + '"}'

initials_result = 'J%20L%20West'

surname_reg = '{"parties": [{"names": [{"private": {"forenames": [" "], "surname": "West"}, "type": "Private Individual"}], "type": "Estate Owner"}], "particulars": {"counties": ["Devon"], "description": "45 New street", "district": "Plymouth"}, "class_of_charge": "C1", "applicant": {"address": "2 New Street", "name": "Mr Conveyancer", "key_number": "244095", "reference": "reference 11", "address_type": "RM"}}'

#surname_search = '{"document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": " ", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "S & H Legal Group", "reference": "ref", "address": "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "key_number": "1234567"}, "search_date": "' + today + '"}'
surname_search = '{"cert_no": "14532", "document_id": 60, "expiry_date": "2016-02-18", "parameters": {"search_items": [{"name": {"forenames": " ", "surname": "West"}, "name_type": "Private Individual", "year_to": 2016, "year_from": 1925}], "search_type": "full", "counties": ["ALL"]}, "customer": {"name": "LOUIS LEY & MAYCOCK NON CREDIT", "reference": "ref", "address": "Seaton Court 2 William Prance Road\r\nPlymouth\r\nPL6 5WS", "key_number": "2244095", "address_type": "RM"}, "search_date": "' + today + '"}'

surname_result = '%20%20West'



array_len = name_array.length
cntr = 0
reg_name = []
reg_date = '2016-01-01'

Given(/^I have submitted a singular company name$/) do
  while cntr < name_array.length
    @current_data = reg_template + name_array[cntr] + '"}]}]}'
    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @return_data = @registration_api.post("/registrations?dev_date=#{reg_date}", @current_data)
    reg_name[cntr] = @return_data['new_registrations'][0]['number']
    cntr += 1
  end
  cntr = 0
end

When(/^I submit a full search for th plural of the company$/) do
  search_array.length.times do |cntr|
    @current_data = search_template + search_array[cntr] + '"}}]}}'
    @search_api = RestAPI.new($LAND_CHARGES_URI)
    @return_data = @search_api.post("/searches", @current_data)
  end
end

When(/^I query the search result using the plural company name$/) do
  @searched_name = []

  search_array.length.times do |cntr|
    @current_data = search_res_template + search_array[cntr]
    @search_api = RestAPI.new($LAND_CHARGES_URI)
    data = @search_api.get("/searches?name=#{@current_data}")
    @searched_name[cntr] = data
  end

end

Then(/^the response contains the registration details for the singular company registered$/) do
    puts @searched_name
    search_array.length.times do |cntr|      
        expect(@searched_name[cntr][0].has_key?('reg_no')).to be true
        expect(@searched_name[cntr][0]['reg_no'] == reg_name[cntr]).to be true
    end
end

Given(/^I have submitted a new registration for a (.+)$/) do |name_type|
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
    puts @return_data
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

Given(/^I have submitted registration for all private individual variations$/) do
  @current_data = pi_registration
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @full_name = @return_data['new_registrations'][0]['number']
  @current_data = initials_reg
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @initials = @return_data['new_registrations'][0]['number']
  @current_data = surname_reg
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @registration_api.post("/registrations", @current_data)
  expect(@return_data.has_key?('new_registrations')).to be true
  @surname = @return_data['new_registrations'][0]['number']
end

When(/^I have requested a search using (.+)$/) do |name|
  if name == 'initials and surname'
    @current_data = initials_search
  elsif name == 'surname only'
    @current_data = surname_search
  end
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", @current_data)
end

When(/^I query the (.+) searched result$/) do |name|
  if name == 'initials and surname'
    @current_data = initials_result
  elsif name == 'surname only'
    @current_data = surname_result
  end
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.get("/searches?name=#{@current_data}")
end

Then(/^all 3 private individual names are returned$/) do
  expect(@return_data[0].has_key?('reg_no')).to be true
  expect(@return_data).to have_content(@full_name)
  expect(@return_data).to have_content(@initials)
  expect(@return_data).to have_content(@surname)
end

Then(/^only the (.+) appear in the result$/) do |name|
  if name == 'initials and surname'
    expect(@return_data).to have_content(@initials)
    expect(@return_data).to have_content(@surname)
  elsif name == 'surname only'
    expect(@return_data).to have_content(@surname)
  end
end


Given(/^a land charges register containing the following records:$/) do |table|
  data = table.hashes
  @registration_api = RestAPI.new($LAND_CHARGES_URI)
  
  
  data.each do |row|
    party_type = 'Estate Owner'
    if ['PAB', 'WOB'].include?(row['class'])
      party_type = 'Debtor'
    end

    registration = {
      "applicant" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
      "parties" => [{"type" => party_type, "names"=>[]}],
      "particulars" => {"counties" => row['counties'].split(','), "district" => "x", "description" => "x" },
      "class_of_charge" => row['class']
    }
    
    if row['pnoticeexp'] != ''
      registration['priority_notice'] = {
          'expires' => row['pnoticeexp']
      }
    end
    
    if row['nametype'] == 'Private Individual'
      names = row['name'].split(', ')
      names.each do |name|    
        name_list = name.split(' ')
        registration['parties'][0]['names'].push({
            "type" => "Private Individual",
            "private" => {
            "forenames" => name_list[0..-2],
            "surname" => name_list[-1]          
            }
        })
      end      
      if party_type == 'Debtor'
        registration['parties'][0]['addresses'] = [{"type" => "Residence", "address_lines" => ['x','x'], "county" => 'x', "postcode" => 'x'}]
        registration['parties'][0]['occupation'] = 'x'
        registration['parties'][0]['trading_name'] = 'x'
        registration['parties'][0]['residence_withheld'] = false
        registration['parties'][0]['case_reference'] = '1 of 2'
      end
    elsif row['nametype'] == 'Other'
      registration['parties'][0]['names'].push({
        'type' => 'Other',
        'other' => row['name']
      })
    elsif row['nametype'] == 'Limited Company'
      registration['parties'][0]['names'].push({
        'type' => 'Limited Company',
        'company' => row['name']
      })
    elsif row['nametype'] == 'County Council'
      name_list = row['name'].split(', ')
    
      registration['parties'][0]['names'].push({
        'type' => 'County Council',
        'local' => {
          'name' => name_list[0],
          'area' => name_list[1]
        }
      })
    elsif row['nametype'] == 'Rural Council'
      name_list = row['name'].split(', ')
    
      registration['parties'][0]['names'].push({
        'type' => 'Rural Council',
        'local' => {
          'name' => name_list[0],
          'area' => name_list[1]
        }
      })
    end
    
    @return_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=#{row['date']}", JSON.dump(registration))
    expect(@registration_api.response.code).to eql "200"  
  end
end

When(/^I full search for the Private Individual (.+) in (.*)$/) do |name, counties|
  if counties == 'all counties'
    c_search = ['ALL']
  else
    c_search = [counties]
  end
  
  name_list = name.split(' ')

  search = {
    "customer" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
    "expiry_date" => "2100-01-01",
    "search_date" => "2016-02-11",
    "cert_no" => "14532",
    "parameters" => {
      "search_type" => "full",
      "counties" => c_search,
      "search_items" => [ {
        "name_type" => "Private Individual",
        "year_from" => 1925,
        "year_to" => 2017,
        "name" => {
          "forenames" => name_list[0..-2].join(' '),
          "surname" => name_list[-1]
        }
      }]      
    } 
  }
  
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", JSON.dump(search))
  #puts @return_data
  @request_id = @return_data[0]
end

When(/^I full search for the Other (.+) in (.*)$/) do |name, counties|
  if counties == 'all counties'
    c_search = ['ALL']
  else
    c_search = [counties]
  end
  
  search = {
    "customer" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
    "expiry_date" => "2100-01-01",
    "search_date" => "2016-02-11",
    "cert_no" => "14532",
    "parameters" => {
      "search_type" => "full",
      "counties" => c_search,
      "search_items" => [ {
        "name_type" => "Other",
        "year_from" => 1925,
        "year_to" => 2017,
        "name" => {
          "other_name" => name
        }
      }]      
    } 
  }
  
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", JSON.dump(search))
  #puts @return_data
  @request_id = @return_data[0]
end

When(/^I full search for the Limited Company (.+) in (.*)$/) do |name, counties|
  if counties == 'all counties'
    c_search = ['ALL']
  else
    c_search = [counties]
  end
  
  search = {
    "customer" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
    "expiry_date" => "2100-01-01",
    "search_date" => "2016-02-11",
    "cert_no" => "14532",
    "parameters" => {
      "search_type" => "full",
      "counties" => c_search,
      "search_items" => [ {
        "name_type" => "Limited Company",
        "year_from" => 1925,
        "year_to" => 2017,
        "name" => {
          "company_name" => name
        }
      }]      
    } 
  }
  
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", JSON.dump(search))
  # puts @return_data
  @request_id = @return_data[0]
end

When(/^I full search for the County Council (.*) \((.*)\) in (.*)$/) do |name, area, counties|
  if counties == 'all counties'
    c_search = ['ALL']
  else
    c_search = [counties]
  end
  
  search = {
    "customer" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
    "expiry_date" => "2100-01-01",
    "search_date" => "2016-02-11",
    "cert_no" => "14532",
    "parameters" => {
      "search_type" => "full",
      "counties" => c_search,
      "search_items" => [ {
        "name_type" => "County Council",
        "year_from" => 1925,
        "year_to" => 2017,
        "name" => {
          "local_authority_name" => name,
          "local_authority_area" => area
        }
      }]      
    } 
  }
  
  @search_api = RestAPI.new($LAND_CHARGES_URI)
  @return_data = @search_api.post("/searches", JSON.dump(search))
  # puts @return_data
  @request_id = @return_data[0]
end

When(/^I full search for the Rural Council (.*) \((.*)\) in (.*)$/) do |name, area, counties|
    if counties == 'all counties'
        c_search = ['ALL']
    else
        c_search = [counties]
    end

    search = {
        "customer" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
        "expiry_date" => "2100-01-01",
        "search_date" => "2016-02-11",
        "cert_no" => "14532",
        "parameters" => {
            "search_type" => "full",
            "counties" => c_search,
            "search_items" => [ {
                "name_type" => "Rural Council",
                "year_from" => 1925,
                "year_to" => 2017,
                "name" => {
                    "local_authority_name" => name,
                    "local_authority_area" => area
                }
            }]      
        } 
    }

    @search_api = RestAPI.new($LAND_CHARGES_URI)
    @return_data = @search_api.post("/searches", JSON.dump(search))
    # puts @return_data
    @request_id = @return_data[0]
end

When(/^I banks search for the Private Individual (.+)$/) do |name|
    name_list = name.split(' ')
    search = {
        "customer" => {"name" => "X","address" => "X","key_number" => "1111111","reference" => "X", "address_type" => "RM"},
        "cert_no" => "14532",
        "expiry_date" => "2100-01-01",
        "search_date" => "2016-02-11",
        "parameters" => {
            "search_type" => "banks",
            "search_items" => [ {
                "name_type" => "Private Individual",
                "name" => {
                    "forenames" => name_list[0..-2].join(' '),
                    "surname" => name_list[-1]
                }
            }]      
        } 
    }

    @search_api = RestAPI.new($LAND_CHARGES_URI)
    @return_data = @search_api.post("/searches", JSON.dump(search))
    @request_id = @return_data[0]
end

Then(/^the result will contain no entries$/) do
  # puts "/request_details/#{@request_id}" 
  request = @search_api.get("/request_details/#{@request_id}")
  # puts request
  expect(request["search_details"][0]["results"].length).to eq 0
end

Then(/^the result will contain the entries:$/) do |table|
  request = @search_api.get("/request_details/#{@request_id}")
  data = table.hashes
  
  # puts request

  data.each do |row|
    # Look for a corresponding hit
    found = false
    request['search_details'][0]['results'].each do |result|
      if result[0]['class_of_charge'] == row['class'] && result[0]['registration']['date'] == row['date']
        # puts "Found #{row['class']} | #{row['date']}"
        found = true
      end
    end 
    
    if found == false
        puts "Not revealed: #{row['date']} #{row['class']}"
    end
       
    expect(found).to be true
  end
  
  expect(request['search_details'][0]['results'].length).to eq data.length
end