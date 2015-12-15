
Given(/^I have a document that has been scanned onto the system$/) do
  #this is a given place holder

end

When(/^document is added retrieved deleted replaced the system returns a positive response code$/) do
  f = IO.binread('test.tiff')


  uri = URI("http://localhost:5014")
  http = Net::HTTP.new(uri.host, uri.port)
  
  # Save the image to the API
  request = Net::HTTP::Post.new('/forms/66/images')
  request['Content-Type'] = 'image/tiff'
  request.body = f
  upload = Digest::SHA1.hexdigest(f)
  response = http.request(request)
  
  puts response.code
  expect(response.code).to eql "201"

  puts "#{upload} was uploaded"
  
  
  # Retrieve the image
  get = Net::HTTP::Get.new('/forms/66/images/2')
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
  
  puts "#{download} was downloaded"
  
  # Delete the image
  get = Net::HTTP::Delete.new('/forms/66/images/2')
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "404"

  download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
  
  
  uri = URI("http://localhost:5014")
  http = Net::HTTP.new(uri.host, uri.port)
  
  # Save the image to the API
  request = Net::HTTP::Post.new('/forms/66/images')
  request['Content-Type'] = 'image/tiff'
  request.body = f
  upload = Digest::SHA1.hexdigest(f)
  response = http.request(request)
  
  puts response.code
  expect(response.code).to eql "201"


  # Replace the image
  
  #recall image
  get = Net::HTTP::Get.new('/forms/66/images/2')
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
 
  puts "#{download} was downloaded"
  
  f = IO.binread('img2_1.jpeg')

  
  # replace the image to the API
  request = Net::HTTP::Put.new('/forms/66/images/2')
  request['Content-Type'] = 'image/jpeg'
  request.body = f
  upload = Digest::SHA1.hexdigest(f)
  response = http.request(request)
  
  puts response.code
  expect(response.code).to eql "201"
  
  puts "#{upload} was uploaded"
  puts "#{download} was downloaded"
  
  #recall replacement image
  get = Net::HTTP::Get.new('/forms/66/images/2')
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
 
  puts "#{download} was downloaded"
end

Then(/^I access the DB(\d+) table to confirm row exists$/) do |arg1|
  #this will be done with synchronise
end