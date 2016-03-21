require 'net/http'
require 'json'

uri = URI(ENV['LAND_CHARGES_URL'] || 'http://localhost:5004')
http = Net::HTTP.new(uri.host, uri.port)

response = http.request(Net::HTTP::Delete.new('/registrations'))
puts "DELETE /registrations: #{response.code}"
if response.code != "200"    
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/area_variants'))
puts "DELETE /area_variants: #{response.code}"
if response.code != "200"    
    puts response.body
end