require 'net/http'
require 'json'

uri = URI(ENV['LAND_CHARGES_URL'] || 'http://localhost:5004')
http = Net::HTTP.new(uri.host, uri.port)

response = http.request(Net::HTTP::Delete.new('/registrations'))
response = http.request(Net::HTTP::Delete.new('/area_variants'))