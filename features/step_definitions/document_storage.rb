
Given(/^I have a document that has been scanned onto the system$/) do
  #this is a given place holder

end

When(/^document is added retrieved deleted replaced the system returns a positive response code$/) do
  f = IO.binread('test.tiff')


  uri = URI("http://localhost:5006")
  http = Net::HTTP.new(uri.host, uri.port)
  
  # Save the image to the API
  request = Net::HTTP::Post.new('/forms/A4')
  request['Content-Type'] = 'image/tiff'
  request.body = f
  upload = Digest::SHA1.hexdigest(f)
  response = http.request(request)
  
  puts response.code
  image = JSON.parse(response.body)
  id = image['id']
  expect(response.code).to eql "201"

  puts "#{upload} was uploaded as a new document"
  
  
  # Retrieve the image
  get = Net::HTTP::Get.new("/forms/#{id}/1")
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
  
  puts "#{download} was retrieved"
  
  # Delete the image
  get = Net::HTTP::Delete.new('/forms/#{id}/1')
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "404" #delete was successful
  
  puts "#{download} was deleted"
  puts get_resp.code
  
  # Try to Retrieve the deleted image
  get = Net::HTTP::Get.new('/forms/#{id}/1')
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "404"
  puts "#{download} was deleted and couldn't be retrieved"
  #download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  #File.open("output.jpg", 'wb' ) do |output|
  #output.write get_resp.body
  #end
  
  
  
  f = IO.binread('test.tiff')


  uri = URI("http://localhost:5006")
  http = Net::HTTP.new(uri.host, uri.port)
  
  # Save the image to the API
  request = Net::HTTP::Post.new('/forms/A4')
  request['Content-Type'] = 'image/tiff'
  request.body = f
  upload = Digest::SHA1.hexdigest(f)
  response = http.request(request)
  
  puts response.code
  image = JSON.parse(response.body)
  id = image['id']
  expect(response.code).to eql "201"

  puts "#{upload} was uploaded as a new document"
  
  # Retrieve the image
  get = Net::HTTP::Get.new("/forms/#{id}/1")
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
  
  puts "#{download} was retrieved" 
  

  # Replacment image
    
 
  
  g = IO.binread('img2_1.jpeg')

  
  # replace the image to the API
  
  
  upload = Digest::SHA1.hexdigest(g)
  
  
    request = Net::HTTP::Put.new("/forms/#{id}/1/A4")
request['Content-Type'] = 'image/jpeg'
  request.body = g
  response = http.request(request)
  puts response.code
  #image = JSON.parse(response.body)
  #id2 = image['id']
  #puts id2
  expect(response.code).to eql "200"
  
  puts "#{upload} is the replacement"
  
  #recall replacement image
  get = Net::HTTP::Get.new("/forms/#{id}")
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  download = Digest::SHA1.hexdigest(get_resp.body)
  puts id
  #puts id2
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
 
  puts "#{download} was downloaded"
end
When(/^document is added the correct response code is returned$/) do 
   @f = IO.binread('test.tiff')


  uri = URI("http://localhost:5006")
  http = Net::HTTP.new(uri.host, uri.port)
  
  # Save the image to the API
  request = Net::HTTP::Post.new('/forms/A4')
  request['Content-Type'] = 'image/tiff'
  request.body = @f
  upload = Digest::SHA1.hexdigest(@f)
  response = http.request(request)
  
  puts response.code
  image = JSON.parse(response.body)
  @id = image['id']
  expect(response.code).to eql "201"

  puts "#{upload} was uploaded as a new document"
  puts @id
end

When(/^document is retrieved the correct response code is returned$/) do
   # Retrieve the image
   id =@id

  uri = URI("http://localhost:5006")
  http = Net::HTTP.new(uri.host, uri.port)
  
  get = Net::HTTP::Get.new("/forms/#{@id}/1")
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "200"

  @download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
  File.open("output.jpg", 'wb' ) do |output|
    output.write get_resp.body
  end
  
  
  puts "#{@download} was retrieved"
end

When(/^document is deleted the correct response code is returned$/) do 
  # Delete the image
  
  uri = URI("http://localhost:5006")
  http = Net::HTTP.new(uri.host, uri.port)
  
  get = Net::HTTP::Delete.new("/forms/#{@id}/1")
  get_resp = http.request(get)
  puts get_resp.code
  expect(get_resp.code).to eql "200" #delete was successful THIS SHOULD RETURN A 404
  
  puts "#{@download} was deleted"
  puts get_resp.code
  
  # Try to Retrieve the deleted image
  get = Net::HTTP::Get.new("/forms/#{@id}/1")
  get_resp = http.request(get)
  
  expect(get_resp.code).to eql "404"
  puts "#{@download} was deleted and couldn't be retrieved"
  #download = Digest::SHA1.hexdigest(get_resp.body)
  
  puts get_resp.code
end

When(/^document is replaced the correct response code is returned$/) do
  @g = IO.binread('img2_1.jpeg')
  
  # replace the image to the API
   uri = URI("http://localhost:5006")
  http = Net::HTTP.new(uri.host, uri.port)
  
  upload = Digest::SHA1.hexdigest(@g)
  
  
    request = Net::HTTP::Put.new("/forms/#{@id}/1/A4")
  request['Content-Type'] = 'image/jpeg'
  request.body = @g
  response = http.request(request)
  puts response.code
  #image = JSON.parse(response.body)
  #id2 = image['id']
  #puts id2
  expect(response.code).to eql "200"
  
  puts "#{upload} is the replacement"

end
Then(/^I access the DB(\d+) table to confirm row exists$/) do |arg1|
  #this will be done with synchronise
end