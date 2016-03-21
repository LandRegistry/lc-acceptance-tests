require 'net/http'
require 'json'

uri = URI(ENV['CASEWORK_API_URL'] || 'http://localhost:5006')
http = Net::HTTP.new(uri.host, uri.port)

response = http.request(Net::HTTP::Delete.new('/applications'))
puts "DELETE /applications: #{response.code}"
if response.code != "200"    
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/registered_forms'))
puts "DELETE /registered_forms: #{response.code}"
if response.code != "200"
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/counties'))
puts "DELETE /counties: #{response.code}"
if response.code != "200"    
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/forms'))
puts "DELETE /forms: #{response.code}"
if response.code != "200"    
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/results'))
puts "DELETE /results: #{response.code}"
if response.code != "200"    
    puts response.body
end

