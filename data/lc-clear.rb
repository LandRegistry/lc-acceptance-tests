require 'net/http'
require 'json'

uri = URI(ENV['LAND_CHARGES_URL'] || 'http://localhost:5004')
http = Net::HTTP.new(uri.host, uri.port)

response = http.request(Net::HTTP::Delete.new('/registrations'))
if response.code != "200"
    puts "DELETE /registrations: #{response.code}"
    puts response.body
end

response = http.request(Net::HTTP::Delete.new('/area_variants'))
if response.code != "200"
    puts "DELETE /area_variants: #{response.code}"
    puts response.body
end