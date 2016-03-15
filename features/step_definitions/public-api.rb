#one_name_valid = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'
one_name_valid = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

#one_name_no_residence = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence_withheld":true,"date_of_birth":"1980-01-01"}'
one_name_no_residence = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence_withheld":true,"date_of_birth":"1980-01-01"}'

#two_name_valid = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"},{"forenames":["Robart"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'
two_name_valid = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"},{"forenames":["Robart"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

#two_name_as_string_invalid = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":["Bob Oscar Francis Howard", "Robert Howard"],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'
two_name_as_string_invalid = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":["Bob Oscar Francis Howard", "Robert Howard"],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

#no_name_invalid = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'
no_name_invalid = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

#no_type_or_ref_invalid = '{"key_number":"1234567","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'
no_type_or_ref_invalid = '{"key_number":"2244095","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

one_name_alpha_kno = '{"key_number":"1234EFGH","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

one_name_no_kno_date = '{"application_ref":"APP01","application_type":"PA(B)","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

#lots_of_data = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}, {"forenames": ["Robert"], "surname": "Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence_withheld":false,"date_of_birth":"1980-01-01","residence":[{"address_lines": ["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"},{"address_lines": ["2 The Road","The Village"],"postcode":"AA2 2AA","county":"The County"}],"investment_property":[{"address_lines": ["3 The Lane","The Hamlet"],"postcode":"AA3 3AA","county":"The County"},{"address_lines": ["4 The Avenue","The City"],"postcode":"AA4 4AA","county":"The County"}],"business_address":[{"address_lines": ["5 The Promenade","The Metropolis"],"postcode":"AA5 5AA","county":"The County"},{"address_lines": ["6 The Way","The Larger Urban Area"],"postcode":"AA6 6AA","county":"The County"}]}'
lots_of_data = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}, {"forenames": ["Robert"], "surname": "Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence_withheld":false,"date_of_birth":"1980-01-01","residence":[{"address_lines": ["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"},{"address_lines": ["2 The Road","The Village"],"postcode":"AA2 2AA","county":"The County"}],"investment_property":[{"address_lines": ["3 The Lane","The Hamlet"],"postcode":"AA3 3AA","county":"The County"},{"address_lines": ["4 The Avenue","The City"],"postcode":"AA4 4AA","county":"The County"}],"business_address":[{"address_lines": ["5 The Promenade","The Metropolis"],"postcode":"AA5 5AA","county":"The County"},{"address_lines": ["6 The Way","The Larger Urban Area"],"postcode":"AA6 6AA","county":"The County"}]}'

xml_data = 'This doesn\'t have to be XML - we\'re testing the header behaviour'

def errors_to_array(data)
  errors = []
  @return_data['errors'].each do |e|
    errors.push(e['error_message'])
  end
  errors
end

Given(/^registration data in XML/) do
  @current_data = xml_data
end

Given(/^valid registration data with (\d+) name(?:s?)$/) do |num|
  if num == '1'
    @current_data = one_name_valid
  elsif num == '2'
    @current_data = two_name_valid
  end
end

Given(/^registration data without a debtor name field$/) do
  @current_data = no_name_invalid
end

Given(/^registration data without application reference or type$/) do
  @current_data = no_type_or_ref_invalid
end

Given(/^registration data where the debtor names are strings$/) do
  @current_data = two_name_as_string_invalid
end

Given(/^registration data where the keynumber contains letters$/) do
  @current_data = one_name_alpha_kno
end

Given(/^registration data where the keynumber and date are missing$/) do
  @current_data = one_name_no_kno_date
end

Given(/^a successfully submitted registration with all of the data$/) do
  @current_data = all
end

When(/^I submit the data to the public API$/) do
  @public_api = RestAPI.new($B2B_API_URI)
  @return_data = @public_api.post("/bankruptcies", @current_data)
end

When(/^I submit the XML data to the public API/) do
  @public_api = RestAPI.new($B2B_API_URI)
  @return_data = @public_api.postXML("/bankruptcies", @current_data)
end

Then(/^it returns a (\d+) (.+) response$/) do |code, msg|
  expect(RestAPI.last_response.code).to eql code 
end

Then(/^the response contains the new registration details$/) do
  expect(@return_data.has_key?('new_registrations')).to be true
  expect(@return_data.has_key?('errors')).to be false
  expect(@return_data['application_ref']).to eql 'APP01'  
  expect(@return_data['new_registrations'][0]['surname']).to eql 'Howard'
end

Then(/^the response contains (\d+) registration(?:s?)$/) do |num|
  expect(@return_data['new_registrations'].length).to eq num.to_i
end

Then(/^the response contains (\d+) error(?:s?)$/) do |num|
  expect(@return_data.has_key?('new_registrations')).to be false
  expect(@return_data.has_key?('errors')).to be true
  expect(@return_data['errors'].length).to eq num.to_i
end

Then(/^the error indicates that the name is missing$/) do
  expect(errors_to_array(@return_data)).to include "'debtor_names' is a required property"
end

Then(/^the error indicates that the reference is missing$/) do
  expect(errors_to_array(@return_data)).to include "'application_ref' is a required property"
end

Then(/^the error indicates that the type is missing$/) do
  expect(errors_to_array(@return_data)).to include "'application_type' is a required property"
end

Then(/^the error indicates that the name is not an object$/) do
  expect(errors_to_array(@return_data)).to include "'Robert Howard' is not of type 'object'"
  expect(errors_to_array(@return_data)).to include "'Bob Oscar Francis Howard' is not of type 'object'"
end

Then(/^the error indicates that the keynumber is malformed$/) do
  expect(errors_to_array(@return_data)).to include "'1234EFGH' does not match '^\\\\d+$'"
end

Then(/^the error indicates that the keynumber is missing$/) do
  expect(errors_to_array(@return_data)).to include "'key_number' is a required property"
end

Then(/^the error indicates that the date is missing$/) do
  expect(errors_to_array(@return_data)).to include "'application_date' is a required property"
end

Given(/^a successfully submitted registration$/) do
  @public_api = RestAPI.new($B2B_API_URI)
  @return_data = @public_api.post("/bankruptcies", one_name_valid)
  @submitted = JSON.parse(one_name_valid);
end

Given(/^a successfully submitted registration with residence withheld$/) do
  @public_api = RestAPI.new($B2B_API_URI)
  @return_data = @public_api.post("/bankruptcies", one_name_no_residence)
  @submitted = JSON.parse(one_name_no_residence);
end

When(/^I query the land charge API for the registration$/) do
  date = @return_data['new_registrations'][0]['date']
  number = @return_data['new_registrations'][0]['number']
  
  @reg_api = RestAPI.new($LAND_CHARGES_URI)
  @reg_result = @reg_api.get("/registrations/#{date}/#{number}") 
end

Then(/^the registration is returned$/) do
  expect(@reg_api.response.code).to eql "200"
end

Then(/^the details match$/) do
  expect(@reg_result["parties"][0]["names"].length).to be @submitted['debtor_names'].length
  expect(@reg_result["parties"][0]["names"][0]['private']['surname']).to eql @submitted['debtor_names'][0]['surname']
  expect(@reg_result["parties"][0]["occupation"]).to eql @submitted['occupation']
  expect(@reg_result["status"]).to eql "current"  
  
#   if !@submitted['residence_withheld']
#     expect(@reg_result['residence'].length).to be @submitted['residence'].length
#     expect(@reg_result["residence"][0]["address_lines"][1]).to eql @submitted['residence'][0]['address_lines'][1]
#   end
  
#   if @submitted.has_key?('business_address')
#     expect(@reg_result['business_address'].length).to be @submitted['business_address'].length
#   else
#     expect(@reg_result['business_address'].length).to be 0
#   end 
  
#   if @submitted.has_key?('investment_property')
#     expect(@reg_result['investment_property'].length).to be @submitted['investment_property'].length
#   else
#     expect(@reg_result['investment_property'].length).to be 0
#   end
  
#   if @submitted.has_key?('investment_property') && @submitted['investment_property'].length > 0
#     expect(@reg_result["investment_property"][0]["address_lines"][1]).to eql @submitted['investment_property'][0]['address_lines'][1]
#   end
  
#   if @submitted.has_key?('business_address') && @submitted['business_address'].length > 0
#     expect(@reg_result["business_address"][0]["address_lines"][1]).to eql @submitted['business_address'][0]['address_lines'][1]
#   end
end
