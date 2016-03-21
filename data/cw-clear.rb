require 'net/http'
require 'json'

uri = URI(ENV['CASEWORK_API_URL'] || 'http://localhost:5006')
http = Net::HTTP.new(uri.host, uri.port)

response = http.request(Net::HTTP::Delete.new('/applications'))
if response.code != "200"
    puts "DELETE /applications: #{response.code}"
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/registered_forms'))
if response.code != "200"
    puts "DELETE /registered_forms: #{response.code}"
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/counties'))
if response.code != "200"
    puts "DELETE /counties: #{response.code}"
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/forms'))
if response.code != "200"
    puts "DELETE /forms: #{response.code}"
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/results'))
if response.code != "200"
    puts "DELETE /results: #{response.code}"
    puts response.body
end

