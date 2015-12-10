
Given(/^I have a document that has been scanned onto the system$/) do
  f = IO.binread('blank_amend.jpg')


uri = URI("http://localhost:5014")
http = Net::HTTP.new(uri.host, uri.port)

# Save the image to the API
request = Net::HTTP::Post.new('/forms/66/images')
request['Content-Type'] = 'image/jpeg'
request.body = f
upload = Digest::SHA1.hexdigest(f)
response = http.request(request)

puts response.code

# Retrieve the image
get = Net::HTTP::Get.new('/forms/66/images/2')
get_resp = http.request(get)

download = Digest::SHA1.hexdigest(get_resp.body)

puts get_resp.code
File.open("output.jpg", 'wb' ) do |output|
  output.write get_resp.body
end


puts "#{upload} was uploaded"
puts "#{download} was downloaded"

end

When(/^I use the system to view the scanned document$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I access the DB(\d+) table to confirm row exists$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end