require 'net/http'
require 'json'

uri = URI(ENV['LAND_CHARGES_URL'] || 'http://localhost:5004')
http = Net::HTTP.new(uri.host, uri.port)

folder = File.dirname(__FILE__)
puts `ruby #{folder}/lc-lookups.rb`

standard_data = [
    '{"applicant": {"address": "[INS PLACEHOLDER HERE! FIXME]", "name": "[INS PLACEHOLDER HERE! FIXME]", "reference": "APP01", "key_number": "1234567"}, "parties": [{"case_reference": "[WHAT GOES HERE] FIXME!", "trading_name": "", "residence_withheld": false, "date_of_birth": "1980-01-01", "names": [{"private": {"forenames": ["Bob", "Oscar", "Francis"], "surname": "Howard"}, "type": "Private Individual"}], "occupation": "Civil Servant", "addresses": [{"address_lines": ["1 The Street", "The Town"], "county": "The County", "postcode": "AA1 1AA", "type": "Residence"}], "type": "Debtor"}], "class_of_charge": "PAB"}',
    '{"applicant": {"address": "[INS PLACEHOLDER HERE! FIXME]", "name": "[INS PLACEHOLDER HERE! FIXME]", "reference": "APP02", "key_number": "1234567"}, "parties": [{"case_reference": "[WHAT GOES HERE] FIXME!", "trading_name": "", "residence_withheld": false, "date_of_birth": "1980-01-01", "names": [{"private": {"forenames": ["Alphonso", "Alice"], "surname": "Schmidt"}, "type": "Private Individual"}, {"private": {"forenames": ["Bert"], "surname": "Smith"}, "type": "Private Individual"}], "occupation": "Civil Servant", "addresses": [{"address_lines": ["1 The Street", "The Locality", "The Town"], "county": "The County", "postcode": "AA1 1AA", "type": "Residence"}], "type": "Debtor"}], "class_of_charge": "PAB"}',
    '{"particulars": {"description": "1 The Lane, Some Village", "counties": ["Devon"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Private Individual", "private": {"surname": "Johnson", "forenames": ["Jo", "John"]}}]}]}',
    '{"particulars": {"description": "Flat A, Floor 15, The Hideous Tower, Cityname", "counties": ["Dorset", "Lancashire"], "district": "Mixed"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "County Council", "local": {"area": "Lancs", "name": "South Marsh District Council"}}]}]}',
    '{"priority_notice": {"expires": "2014-12-12"}, "particulars": {"description": "1 The Lane, Some Village", "counties": ["Devon"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Private Individual", "private": {"surname": "Bobson", "forenames": ["Bob", "John"]}}]}]}',
    '{"priority_notice": {"expires": "2100-01-01"}, "particulars": {"description": "1 The Lane, Some Village", "counties": ["Devon"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Private Individual", "private": {"surname": "Hughson", "forenames": ["Hugh", "John"]}}]}]}',
    '{"priority_notice": {"expires": "2016-02-01"}, "particulars": {"description": "EXPIRE 2016-02-01 1 The Lane, Some Village", "counties": ["Devon"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Private Individual", "private": {"surname": "Expires", "forenames": ["Test", "Notice"]}}]}]}',
    '{"priority_notice": {"expires": "2100-01-01"}, "particulars": {"description": "EXPIRE 2100s 1 The Street, Some Town", "counties": ["Dorset"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Private Individual", "private": {"surname": "Expires", "forenames": ["Test", "Notice"]}}]}]}',
    '{"priority_notice": {"expires": "2100-01-01"}, "particulars": {"description": "EXPIRE 2100s.2 1 The Street, Some Town", "counties": ["Dorset"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Private Individual", "private": {"surname": "Expires", "forenames": ["Test", "Notice"]}}]}]}',
    '{"applicant": {"name": "Waste of space", "address": "2 New Street, My Town", "key_number": "1234567", "reference": " "}, "parties":[{"names": [{"type": "Private Individual", "private": {"forenames": ["John"], "surname": "Smith" }}, {"type": "Private Individual", "private": {"forenames": ["John", "Alan"], "surname": "Smithe"}}], "trading_name": " ", "addresses": [{"county": "Devon", "address_lines": ["2 new street", "Plymouth"], "postcode": "PL3 3PL", "type": "Residence", "address_string": "2 new street Plymouth Devon PL3 3PL"}, {"county": "Dorset", "address_lines": ["3 apple Street", "plymouth", "a third line", "a fourth line", "a five line"], "postcode": "postcode", "type": "Residence", "address_string": "3 apple Street plymouth a third line a fourth line a five line Cornwall postcode"}], "occupation": "", "type": "Debtor", "residence_withheld": false, "case_reference": "Plympton County Court 111 of 2016", "legal_body": "Plympton County Court", "legal_body_ref_no": "111 of 2016", "legal_body_ref_year": 2016, "counties": ["Devon", "Dorset"]}], "class_of_charge": "PAB"}',
    '{"particulars": {"description": "EXPIRE 2100s.2 1 The Street, Some Town", "counties": ["Dorset"], "district": "South Hams"}, "class_of_charge": "C1", "applicant": {"address": "Land Registry Information Systems, 2 William Prance Road, Plymouth", "key_number": "244095", "name": "P334 Team", "reference": "reference 11"}, "parties": [{"type": "Estate Owner", "names": [{"type": "Other", "other": "Bob Smith And Bros Associated"}]}]}',
     '{"applicant": {"name": "Waste of space", "address": "2 New Street, My Town", "key_number": "1234567", "reference": " "}, "parties":[{"names": [{"type": "Private Individual", "private": {"forenames": ["John"], "surname": "Smith" }}, {"type": "Private Individual", "private": {"forenames": ["John", "Alan"], "surname": "Smithe"}}], "trading_name": " ", "addresses": [{"county": "Devon", "address_lines": ["2 new street", "Plymouth"], "postcode": "PL3 3PL", "type": "Residence", "address_string": "2 new street Plymouth Devon PL3 3PL"}, {"county": "Dorset", "address_lines": ["3 apple Street", "plymouth", "a third line", "a fourth line", "a five line"], "postcode": "postcode", "type": "Residence", "address_string": "3 apple Street plymouth a third line a fourth line a five line Cornwall postcode"}], "occupation": "", "type": "Debtor", "residence_withheld": false, "case_reference": "Plympton County Court 111 of 2016", "legal_body": "Plympton County Court", "legal_body_ref_no": "111 of 2016", "legal_body_ref_year": 2016, "counties": ["Devon", "Dorset"]}], "class_of_charge": "WOB"}'
]

regn_dates = [
    '2014-06-03',
    '2014-07-02',
    '2014-08-01',
    '2014-09-29',
    '2014-11-02',
    '2016-02-10',
    '2015-11-01',
    '2015-11-01',
    '2015-11-01',
    '2016-01-02',
    '2016-02-03',
    '2016-02-28'
]

cw_uri = URI(ENV['CASEWORK_API_URL'] || 'http://localhost:5006')
cw_http = Net::HTTP.new(cw_uri.host, cw_uri.port)

standard_data.length.times do |i|
    item = standard_data[i]
    date = regn_dates[i]

    request = Net::HTTP::Post.new('/registrations?suppress_queue=yes&dev_date=' + date)
    request.body = item
    request["Content-Type"] = "application/json"
    response = http.request(request)

    data = JSON.parse(response.body)
    puts data

    if response.code != "200"
        puts "banks-reg/registrations: #{response.code}"
    end

    if data.has_key?('new_registrations')
        regs = data['new_registrations']
    else
        regs = data['priority_notices']
    end

    regs.each do |reg|
        cw_req = Net::HTTP::Put.new("/registered_forms/#{reg['date']}/#{reg['number']}")
        cw_req.body = '{"id": 1}'
        cw_req["Content-Type"] = "application/json"
        response = cw_http.request(cw_req)
        if response.code != "200"
            puts "cw-api/registered_forms: #{response.code}"
        end
    end
end
