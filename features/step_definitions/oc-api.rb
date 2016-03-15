date = Date.today.prev_day
yesterday = date.strftime("%Y-%m-%d")
today = Date.today.strftime("%Y-%m-%d")

#one_name_valid = '{"key_number":"1234567","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'
one_name_valid = '{"key_number":"2244095","application_ref":"APP01","application_type":"PA(B)","application_date":"2016-01-01","debtor_names":[{"forenames":["Bob","Oscar","Francis"],"surname":"Howard"}],"gender":"Unknown","occupation":"Civil Servant","trading_name":"","residence":[{"address_lines":["1 The Street","The Town"],"postcode":"AA1 1AA","county":"The County"}],"residence_withheld":false,"date_of_birth":"1980-01-01"}'

Given(/^I have submitted a b2b request$/) do
  @current_data = one_name_valid
  @public_api = RestAPI.new($B2B_API_URI)
  @return_data = @public_api.post("/bankruptcies", @current_data)
end

When(/^I request an office copy$/) do
  @oc_api = RestAPI.new($CASEWORK_API_URI)
  @number = @return_data['new_registrations'][0]['number']
  @date = @return_data['new_registrations'][0]['date']
  @result = @oc_api.getbin("/office_copy?class=PAB&reg_no=#{@number}&date=#{@date}")
end

Then(/^I receive the office copy result$/) do
  expect(@oc_api.response.code).to eql "200"
end