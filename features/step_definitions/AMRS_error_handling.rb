Given(/^the system has created an error$/) do
 # reg_no = rand(1000..1000000).to_s #  how to ensure uniqueness?
#day_start = (Date.today).strftime("%Y-%m-%d")
#day_end = (Date.today + 1).strftime("%Y-%m-%d")

#date_range = "/begin?start_date=#{day_start}&end_date=#{day_end}"
#legacy_date_range = "/land_charge?start_date=#{day_start}&end_date=#{day_end}"
#'/land_charge?start_date=2015-07-17&end_date=2015-07-18'
#mytime = Time.new.strftime("%Y-%m-%d %H:%M:%S.%6N")
#legacy_row = '{"time":"' + mytime + '","registration_no":"' + reg_no + '","priority_notice":"","reverse_name":"YDRUPYDDERFD","property_county":255,"registration_date":"' + day_start + '","class_type":"PA(B)","remainder_name":"STANFOR","punctuation_code":"28C6","name":"","address":"52413 LILYAN PINE EAST ILIANA FA16 0XD BERKSHIRE","occupation":"","counties":"","amendment_info":"NORTH JAMEYSHIRE COUNTY COURT 677 OF 2015","property":"","parish_district":"","priority_notice_ref":""}'

  #legacy_row = '{"time":"' + "mytime" + '","registration_no":"' + "reg_no" + '","priority_notice":"","reverse_name":"YDRUPYDDERFD","property_county":255,"registration_date":"' + "day_start" + '","class_type":"PA(B)","remainder_name":"STANFOR","punctuation_code":"28C6","name":"","address":"52413 LILYAN PINE EAST ILIANA FA16 0XD BERKSHIRE","occupation":"","counties":"","amendment_info":"NORTH JAMEYSHIRE COUNTY COURT 677 OF 2015","property":"","parish_district":"","priority_notice_ref":""}'

  #@legacy_api = RestAPI.new($LEGACY_DB_URI)
  #@return_data = @legacy_api.post("/land_charge","hello")
end  

When(/^the error is returned to the system$/) do
  # Write code here that turns the phrase above into concrete actions
end

Then(/^a report is sent to AMRS$/) do
   # Write code here that turns the phrase above into concrete actions
end