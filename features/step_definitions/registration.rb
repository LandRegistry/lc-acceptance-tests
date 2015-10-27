no_alias = '{"key_number":"9056267","application_type":"PA(B)","application_ref":"9763603","date":"2014-11-12","debtor_name":{"forenames":["Lamar","Sigmund"],"surname":"Effertz"},"debtor_alternative_name":[],"gender":"N/A","occupation":"Ship builder","residence":[{"address_lines":["942 Carley Unions","Cullenberg","Dimitrimouth"],"county":"Buckinghamshire","postcode":"QF47 0HG"}],"residence_withheld":false,"business_address":{"address_lines":["122 Leuschke Creek","Alvaburgh"],"county":"Fife","postcode":"NO03 1EU"},"date_of_birth":"1974-10-03","investment_property":[]}'
one_alias = '{"key_number":"6269524","application_type":"PA(B)","application_ref":"7282631","date":"2015-02-19","debtor_name":{"forenames":["Helga","Nelda"],"surname":"Hessel"},"debtor_alternative_name":[{"forenames":["Nelda","Helga"],"surname":"Hessel"}],"gender":"N/A","occupation":"Flower arranger","residence":[{"address_lines":["45633 Wyman Corner","Huelshire","Lake Jennings"],"county":"West Yorkshire","postcode":"YL23 2FD"}],"residence_withheld":false,"business_address":{"address_lines":["423 Zander Mount","Konopelskifurt","South Shyannberg"],"county":"Shropshire","postcode":"AE64 7DF"},"date_of_birth":"1953-01-11","investment_property":[]}'
bob_howard = '{"key_number":"1479067","application_type":"PA(B)","application_ref":"9045789","date":"2014-10-28","debtor_name":{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"},"debtor_alternative_name":[],"gender":"N/A","occupation":"Bookmaker","residence":[{"address_lines":["1940 Huels Fort","North Glennamouth","South Nonafort"],"county":"West Yorkshire","postcode":"PA85 4RH"}],"residence_withheld":false,"business_address":{"address_lines":["831 Hailee Burg","Chasityborough","East Tamara"],"county":"Northamptonshire","postcode":"IP81 2CM"},"date_of_birth":"1974-10-07","investment_property":[]}'
steven_smith = '{"key_number":"1479067","application_type":"PA(B)","application_ref":"9045789","date":"2014-10-28","debtor_name":{"forenames":["Steven"],"surname":"Smith"},"debtor_alternative_name":[],"gender":"N/A","occupation":"Bookmaker","residence":[{"address_lines":["1940 Huels Fort","North Glennamouth","South Nonafort"],"county":"West Yorkshire","postcode":"PA85 4RH"}],"residence_withheld":false,"business_address":{"address_lines":["831 Hailee Burg","Chasityborough","East Tamara"],"county":"Northamptonshire","postcode":"IP81 2CM"},"date_of_birth":"1974-10-07","investment_property":[]}'


ins_request = '{"key_number": "1234567", "application_ref": "9192245", "debtor_names": [ { "surname": "Hills",' +
    '"forenames": ["Alanna", "Torey" ]}, {"surname": "Gottlieb", "forenames": ["Torey", "Alanna" ]}],' +
    '"application_type": "PA(B)", "legal_body": null, "legal_body_ref": null, "application_date": "2014-12-22",'+
    '"status": "current", "document_id": "22", "residence": [ {"postcode": "FX91 6CS", "county": "Grampian", ' +
    '"address_lines": ["422 Thompson Radial", "West Hermannview" ]}], "date_of_birth": "1980-05-01", ' +
    '"residence_withheld": false,  "occupation": "Caretaker",  "registration_no": 50022}'


class AssertionFailure < RuntimeError
end

def assert( condition, message = nil )
    unless( condition )
        raise AssertionFailure, message
    end
end

Given(/^anything$/) do
end

When(/^I submit a valid INS request$/) do
    @registration_api = RestAPI.new($B2B_API_URI)
    @registration_api.post("/register", ins_request)
end

When(/^I submit valid data to the registration system$/) do
    @registration_api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
    @registration_api.post("/registration", no_alias)
end

Then(/^it returns the new registration number$/) do
    assert(@registration_api.data["new_registrations"].length == 1)
    # puts @registration_api.data
end

Then(/^a new record is stored on the database$/) do
    if @registration_api.data['result']
        data = @registration_api.data['result']['new_registrations']
    else
        data = @registration_api.data["new_registrations"]
    end

    data.each do |reg_no|
        regn = @registration_api.get("/registration/#{reg_no}")
        expect(@registration_api.response.code).to eql "200"
        expect(regn['registration_no']).to eq reg_no
    end
    PostgreSQL.disconnect
end

When(/^I submit valid data with an alias to the registration system$/) do
    @registration_api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
    @registration_api.post("/registration", one_alias)
end

Then(/^it returns the (\d+) new registration numbers$/) do |count|
    assert(@registration_api.data["new_registrations"].length.to_s == count)
    # puts @registration_api.data
end

Then(/^(\d+) new records are stored on the database$/) do |count|
    new_regs = @registration_api.data["new_registrations"]
    expect(new_regs.length).to eql count
    new_regs.each do |reg_no|
      regn = @registration_api.get("/registration/#{reg_no}")
      expect(@registration_api.response.code).to eql "200"
      expect(regn['registration_no']).to eq reg_no
    end
end

Then(/^the data is recorded on DB2$/) do
    sleep(1)
    PostgreSQL.connect('db2')
    @registration_api.data["new_registrations"].each do |reg_no|
        reg_str = reg_no.to_s.rjust(8)
        result = PostgreSQL.query("SELECT * FROM lc_mock WHERE registration_no='#{reg_str}'")
        expect(result.values.length).to eq 1
    end
    PostgreSQL.disconnect
end

Then(/^the debtor details are recorded on the IOPN DB2 tables$/) do
    sleep(10)
    PostgreSQL.connect('db2')
    reg_no = '50027'
    result = PostgreSQL.query("SELECT * FROM debtor_detail WHERE reg_no='#{reg_no}'")
    expect(result.values.length).to eq 1
    PostgreSQL.disconnect
end

Then(/^positive search results are recorded on the IOPN DB2 tables$/) do
    sleep(10)
    PostgreSQL.connect('db2')
    reg_no = '50027'
    result_id = PostgreSQL.query("SELECT id FROM debtor_detail WHERE reg_no='#{reg_no}'")
    expect(result_id.values.length).to eq 1
    search_results = PostgreSQL.query("SELECT * FROM property_detail WHERE id='#{result_id.values[0][0]}'")
    expect(search_results.values.length).to be > 0
    PostgreSQL.disconnect
end

Then(/^negative search results are recorded on the IOPN DB2 tables$/) do
    sleep(10)
    PostgreSQL.connect('db2')
    reg_no = '50027'
    date = DateTime.now.strftime('%d.%m.%Y')
    search_results = PostgreSQL.query("SELECT * FROM no_hit WHERE date='#{date}'")
    expect(search_results.values.length).to eq 1
    PostgreSQL.disconnect
end


When(/^it returns a 202 ACCEPTED response$/) do
	expect(RestAPI.last_response.code).to eql "202"
end

Then(/^it returns the new registration number \(in result format\)$/) do # a bit hacky
    data = @registration_api.data['result']['new_registrations']
    expect(data.length).to eq 2
end

When(/^I submit Bob Howard to the registration system$/) do
    @registration_api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
    @registration_api.post("/registration", bob_howard)
end

When(/^I submit Steven Smith to the registration system$/) do
    @registration_api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
    @registration_api.post("/registration", steven_smith)
end

Then(/^the name has been correctly transformed$/) do
    PostgreSQL.connect('db2')
    @registration_api.data["new_registrations"].each do |reg_no|
        reg_str = reg_no.to_s.rjust(8)
        result = PostgreSQL.query("SELECT reverse_name, remainder_name, punctuation_code FROM lc_mock WHERE registration_no='#{reg_str}'")
        expect(result.values.length).to eq 1
        row = result.values[0]
        expect(row[0]).to eq "DRAWOHSICNAR"
        expect(row[1]).to eq "BOBOSCARF"
        expect(row[2]).to eq "2325C7"
    end
    PostgreSQL.disconnect
end

Then(/^the class of bankruptcy is correctly recorded$/) do
    PostgreSQL.connect('db2')
    @registration_api.data["new_registrations"].each do |reg_no|
        reg_str = reg_no.to_s.rjust(8)
        result = PostgreSQL.query("SELECT class_type FROM lc_mock WHERE registration_no='#{reg_str}'")
        expect(result.values.length).to eq 1
        row = result.values[0]
        expect(row[0]).to eq "PA(B)"
    end
    PostgreSQL.disconnect
end

Given(/^I have registered a bankruptcy$/) do
end

When(/^Invalid registration numbers are sent to the synchroniser$/) do
    @registration_api = RestAPI.new($BANKRUPTCY_REGISTRATION_URI)
    @registration_api.post("/synchronise", '["42"]')
    sleep(1)
end

Then(/^it posts an error message to its error queue$/) do
    error_api = RestAPI.new($CASEWORK_API_URI)
    result = error_api.get("/errors").last
    expect(result['source']).to eq 'Synchroniser'
    expect(result['data']['registration_no']).to eq '42'
    expect(result['data']['status_code']).to eq 404
    expect(result['data']['uri']).to eq '/registration'
end
