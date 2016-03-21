date = Date.today.prev_day
yesterday = date.strftime("%Y-%m-%d")
today = Date.today.strftime("%Y-%m-%d")

#pab_reg = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Alan"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "PAB", "applicant": {"address": "49 Camille Circles Port Eulah PP39 6BY", "reference": " ", "key_number": "1234567", "name": "S & H Legal Group"}}, "form": "PA(B)", "application_data": {"document_id": 13}}'
pab_reg = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Alan"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "PAB", "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "form": "PA(B)", "application_data": {"document_id": 13}}'

#wob_reg = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Alan"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "WOB", "applicant": {"address": "49 Camille Circles Port Eulah PP39 6BY", "reference": " ", "key_number": "1234567", "name": "S & H Legal Group"}}, "form": "WO(B)", "application_data": {"document_id": 27}}'
wob_reg = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Alan"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "WOB", "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "form": "WO(B)", "application_data": {"document_id": 27}}'

#wob_reg_diff_name = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "WOB", "applicant": {"address": "49 Camille Circles Port Eulah PP39 6BY", "reference": " ", "key_number": "1234567", "name": "S & H Legal Group"}}, "form": "WO(B)", "application_data": {"document_id": 27}}'
wob_reg_diff_name = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "WOB", "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "form": "WO(B)", "application_data": {"document_id": 27}}'

#pab_reg_diff_name = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "PAB", "applicant": {"address": "49 Camille Circles Port Eulah PP39 6BY", "reference": " ", "key_number": "1234567", "name": "S & H Legal Group"}}, "form": "PA(B)", "application_data": {"document_id": 13}}'
pab_reg_diff_name = '{"registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "PAB", "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "form": "PA(B)", "application_data": {"document_id": 13}}'


Given(/^I have submitted a PAB$/) do
  @current_data = pab_reg
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @pab_data = @bank_reg_api.put("/applications/6628?action=complete", @current_data)
  @pab_reg = @pab_data['new_registrations'][0]['number']
  @pab_date = @pab_data['new_registrations'][0]['date']
end

Given(/^I have submitted a WOB$/) do
  @current_data = wob_reg
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @wob_data = @bank_reg_api.put("/applications/6628?action=complete", @current_data)
  @wob_reg = @wob_data['new_registrations'][0]['number']
  @wob_date = @wob_data['new_registrations'][0]['date']
end

When(/^I submit an amendment application with the same names$/) do
  pab_no = @pab_reg.to_s
  wob_no = @wob_reg.to_s
  amend_one_name = '{"application_data": {"document_id": 44}, "pab_original": {"date": "' + today + '", "number": "' + pab_no + '"}, "form": "WO(B) Amend", "registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Alan"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}, {"type": "Residence", "address_string": "24 Old Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["24 Old Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "WOB", "update_registration": {"type": "Amendment"}, "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "wob_original": {"date": "' + today + '", "number": "' + wob_no + '"}, "update_registration": {"type": "Amendment"}}'
  
  @current_data = amend_one_name
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @amend_data = @bank_reg_api.put("/applications/6628?action=amend", @current_data)
  @amend_reg = @amend_data['new_registrations'][0]['number']
  @amend_date = @amend_data['new_registrations'][0]['date']
end

When(/^I request details of the amended PAB and WOB$/) do
    @reg_api = RestAPI.new($LAND_CHARGES_URI)
    @pab_data= @reg_api.get("/registrations/#{@pab_date}/#{@pab_reg}")
    @wob_data= @reg_api.get("/registrations/#{@wob_date}/#{@wob_reg}")
end

Then(/^both applications are set to cancelled and not revealed on a search$/) do
    expect(@pab_data['revealed']).to eql false
    expect(@pab_data['cancellation']['reference']). to be > 0
    expect(@wob_data['revealed']).to eql false
    expect(@wob_data['status']). to eql 'superseded'
end

Given(/^I have submitted a WOB with a different name$/) do
  @current_data = wob_reg_diff_name
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @wob_data = @bank_reg_api.put("/applications/6628?action=complete", @current_data)
  @wob_reg = @wob_data['new_registrations'][0]['number']
  @wob_date = @wob_data['new_registrations'][0]['date']
end

When(/^I submit an amendment application with an additional name$/) do
  pab_no = @pab_reg.to_s
  wob_no = @wob_reg.to_s
  amend_two_name = '{"application_data": {"document_id": 47}, "pab_original": {"date": "' + today + '", "number": "' + pab_no + '"}, "form": "WO(B) Amend", "registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}, {"private": {"surname": "Smyth", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "WOB", "update_registration": {"type": "Amendment"}, "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "wob_original": {"date": "' + today + '", "number": "' + wob_no + '"}, "update_registration": {"type": "Amendment"}}'
  @current_data = amend_two_name
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @amend_data = @bank_reg_api.put("/applications/6628?action=amend", @current_data)
  @amend_reg = @amend_data['new_registrations'][0]['number']
  @amend_date = @amend_data['new_registrations'][0]['date']
end

Then(/^both applications are set to cancelled but the PAB is set to reveal on a search$/) do
    expect(@pab_data['revealed']).to eql true
    expect(@pab_data['cancellation']['reference']). to be > 0

    expect(@wob_data['revealed']).to eql false
    expect(@wob_data['status']). to eql 'superseded'
end

Given(/^I have submitted a PAB with a different name$/) do
  @current_data = pab_reg_diff_name
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @pab_data = @bank_reg_api.put("/applications/6628?action=complete", @current_data)
  @pab_reg = @pab_data['new_registrations'][0]['number']
  @pab_date = @pab_data['new_registrations'][0]['date']
end

Then(/^both applications are set to cancelled but the WOB is set to reveal on a search$/) do
    expect(@pab_data['revealed']).to eql false
    expect(@pab_data['cancellation']['reference']). to be > 0
    expect(@wob_data['revealed']).to eql true
    expect(@wob_data['status']). to eql 'superseded'
end

Then(/^both applications are set to cancelled and both revealed on a search$/) do
    expect(@pab_data['revealed']).to eql true
    expect(@pab_data['cancellation']['reference']). to be > 0
    expect(@wob_data['revealed']).to eql true
    expect(@wob_data['status']). to eql 'superseded'
end

When(/^I submit a PAB only amendment application with a different name$/) do
  pab_no = @pab_reg.to_s
  #amend_data = '{"application_data": {"document_id": 47}, "pab_original": {"date": "' + today + '", "number": "' + pab_no + '"}, "form": "PA(B) Amend", "registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}, {"private": {"surname": "Smyth", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "PAB", "update_registration": {"type": "Amendment"}, "applicant": {"address": "49 Camille Circles Port Eulah PP39 6BY", "reference": " ", "key_number": "1234567", "name": "S & H Legal Group"}}, "update_registration": {"type": "Amendment"}}'
  amend_data = '{"application_data": {"document_id": 47}, "pab_original": {"date": "' + today + '", "number": "' + pab_no + '"}, "form": "PA(B) Amend", "registration": {"parties": [{"legal_body": "Exeter County Court", "legal_body_ref_year": "2016", "type": "Debtor", "names": [{"private": {"surname": "Smith", "forenames": ["John", "Allen"]}, "type": "Private Individual"}, {"private": {"surname": "Smyth", "forenames": ["John", "Allen"]}, "type": "Private Individual"}], "legal_body_ref_no": "101", "addresses": [{"type": "Residence", "address_string": "23 New Road East Exeter Devon EX1 1AA", "postcode": "EX1 1AA", "county": "Devon", "address_lines": ["23 New Road East", "Exeter"]}], "occupation": "Carpenter", "trading_name": " ", "case_reference": "Exeter County Court 101 of 2016", "residence_withheld": false}], "class_of_charge": "PAB", "update_registration": {"type": "Amendment"}, "applicant": {"address": "Seaton Court 2 William Prance Road Plymouth", "reference": " ", "key_number": "2244095", "name": "LOUIS LEY & MAYCOCK NON CREDIT", "address_type": "RM"}}, "update_registration": {"type": "Amendment"}}'
  @current_data = amend_data
  @bank_reg_api = RestAPI.new($CASEWORK_API_URI)
  @amend_data = @bank_reg_api.put("/applications/6628?action=amend", @current_data)
  @amend_reg = @amend_data['new_registrations'][0]['number']
  @amend_date = @amend_data['new_registrations'][0]['date']
end

When(/^I request details of the amended PAB$/) do
  @reg_api = RestAPI.new($LAND_CHARGES_URI)
  @pab_data= @reg_api.get("/registrations/#{@pab_date}/#{@pab_reg}")
end

Then(/^the PAB is cancelled but is set to revealed on a search$/) do
  expect(@pab_data['revealed']).to eql true
  expect(@pab_data['status']). to eql 'superseded'
end

