require 'net/http'
require 'json'

uri = URI(ENV['LAND_CHARGES_URL'] || 'http://localhost:5004')
http = Net::HTTP.new(uri.host, uri.port)

counties = counties = '[' +
    '{ "eng": "Avon" },' +
    '{ "eng": "Bath and North East Somerset" },' +
    '{ "eng": "Bedford" },' +
    '{ "eng": "Bedfordshire" },' +
    '{ "eng": "Berkshire" },' +
    '{ "eng": "Blackburn with Darwen" },' +
    '{ "eng": "Blackpool" },' +
    '{ "eng": "Bournemouth" },' +
    '{ "eng": "Bracknell Forest" },' +
    '{ "eng": "Brecknockshire" },' +
    '{ "eng": "Brighton and Hove" },' +
    '{ "eng": "Bristol (city of)" },' +
    '{ "eng": "Buckinghamshire" },' +
    '{ "eng": "Cambridgeshire" },' +
    '{ "eng": "Cardiganshire" },' +
    '{ "eng": "Carnarvonshire" },' +
    '{ "eng": "Central Bedfordshire" },' +
    '{ "eng": "Cheshire" },' +
    '{ "eng": "Cheshire East" },' +
    '{ "eng": "Cheshire West and Chester" },' +
    '{ "eng": "Cleveland" },' +
    '{ "eng": "Cornwall" },' +
    '{ "eng": "County Durham" },' +
    '{ "eng": "Cumbria" },' +
    '{ "eng": "Darlington" },' +
    '{ "eng": "Derby (city of)" },' +
    '{ "eng": "Derbyshire" },' +
    '{ "eng": "Devon" },' +
    '{ "eng": "Dorset" },' +
    '{ "eng": "East Riding of Yorkshire" },' +
    '{ "eng": "East Sussex" },' +
    '{ "eng": "Essex" },' +
    '{ "eng": "Glamorganshire" },' +
    '{ "eng": "Gloucestershire" },' +
    '{ "eng": "Greater London" },' +
    '{ "eng": "Greater Manchester" },' +
    '{ "eng": "Gwent" },' +
    '{ "eng": "Halton" },' +
    '{ "eng": "Hampshire" },' +
    '{ "eng": "Hartlepool" },' +
    '{ "eng": "Herefordshire" },' +
    '{ "eng": "Hereford and Worcester" },' +
    '{ "eng": "Hertfordshire" },' +
    '{ "eng": "Humberside" },' +
    '{ "eng": "Huntingdonshire and Peterborough" },' +
    '{ "eng": "Isle of Anglesey" },' +
    '{ "eng": "Isle of Wight" },' +
    '{ "eng": "Kent" },' +
    '{ "eng": "Kingston upon Hull (city of)" },' +
    '{ "eng": "Lancashire" },' +
    '{ "eng": "Leicester" },' +
    '{ "eng": "Leicestershire" },' +
    '{ "eng": "Lincolnshire" },' +
    '{ "eng": "Luton" },' +
    '{ "eng": "Medway Towns" },' +
    '{ "eng": "Merionethshire" },' +
    '{ "eng": "Merseyside" },' +
    '{ "eng": "Mid Glamorgan" },' +
    '{ "eng": "Middlesbrough" },' +
    '{ "eng": "Middlesex" },' +
    '{ "eng": "Milton Keynes" },' +
    '{ "eng": "Montgomeryshire" },' +
    '{ "eng": "Norfolk" },' +
    '{ "eng": "North Lincolnshire" },' +
    '{ "eng": "North East Lincolnshire" },' +
    '{ "eng": "North Somerset" },' +
    '{ "eng": "North Yorkshire" },' +
    '{ "eng": "Northamptonshire" },' +
    '{ "eng": "Northumberland" },' +
    '{ "eng": "Nottingham (city of)" },' +
    '{ "eng": "Nottinghamshire" },' +
    '{ "eng": "Oxfordshire" },' +
    '{ "eng": "Peterborough (city of)" },' +
    '{ "eng": "Plymouth (city of)" },' +
    '{ "eng": "Poole" },' +
    '{ "eng": "Portsmouth" },' +
    '{ "eng": "Radnorshire" },' +
    '{ "eng": "Reading" },' +
    '{ "eng": "Redcar and Cleveland" },' +
    '{ "eng": "Rutland" },' +
    '{ "eng": "Shropshire" },' +
    '{ "eng": "Slough" },' +
    '{ "eng": "Somerset" },' +
    '{ "eng": "South Glamorgan" },' +
    '{ "eng": "South Gloucestershire" },' +
    '{ "eng": "South Yorkshire" },' +
    '{ "eng": "Southampton" },' +
    '{ "eng": "Southend on Sea" },' +
    '{ "eng": "Staffordshire" },' +
    '{ "eng": "Stockton on Tees" },' +
    '{ "eng": "Stoke on Trent" },' +
    '{ "eng": "Suffolk" },' +
    '{ "eng": "Surrey" },' +
    '{ "eng": "Swindon" },' +
    '{ "eng": "Thamesdown" },' +
    '{ "eng": "Thurrock" },' +
    '{ "eng": "Torbay" },' +
    '{ "eng": "Tyne and Wear" },' +
    '{ "eng": "Warrington" },' +
    '{ "eng": "Warwickshire" },' +
    '{ "eng": "West Berkshire" },' +
    '{ "eng": "West Glamorgan" },' +
    '{ "eng": "West Midlands" },' +
    '{ "eng": "West Sussex" },' +
    '{ "eng": "West Yorkshire" },' +
    '{ "eng": "Westmoreland" },' +
    '{ "eng": "Wiltshire" },' +
    '{ "eng": "Windsor and Maidenhead" },' +
    '{ "eng": "Wokingham" },' +
    '{ "eng": "Worcestershire" },' +
    '{ "eng": "Wrekin" },' +
    '{ "eng": "York" },' +
    '{ "eng": "Blaenau Gwent", "cym": "Blaenau Gwent" },' +
    '{ "eng": "Bridgend", "cym": "Pen-y-Bont ar Ogwr" },' +
    '{ "eng": "Caerphilly", "cym": "Caerffili" },' +
    '{ "eng": "Cardiff", "cym": "Sir Caerdydd" },' +
    '{ "eng": "Carmarthenshire", "cym": "Sir Gaerfyrddin" },' +
    '{ "eng": "Ceredigion", "cym": "Sir Ceredigion" },' +
    '{ "eng": "Conwy", "cym": "Conwy" },' +
    '{ "eng": "Clwyd" },' +
    '{ "eng": "Dyfed" },' +
    '{ "eng": "Gwynedd" },' +
    '{ "eng": "Denbighshire", "cym": "Sir Ddinbych" },' +
    '{ "eng": "Flintshire", "cym": "Sir y Fflint" },' +
    '{ "eng": "Gwynedd", "cym": "Gwynedd" },' +
    '{ "eng": "Isle of Anglesey", "cym": "Sir Ynys Mon" },' +
    '{ "eng": "Merthyr Tydfil", "cym": "Merthyr Tudful" },' +
    '{ "eng": "Monmouthshire", "cym": "Sir Fynwy" },' +
    '{ "eng": "Neath Port Talbot", "cym": "Castell-Nedd Port Talbot" },' +
    '{ "eng": "Newport", "cym": "Casnewydd" },' +
    '{ "eng": "Pembrokeshire", "cym": "Sir Benfro" },' +
    '{ "eng": "Powys", "cym": "Powys" },' +
    '{ "eng": "Rhondda Cynon Taff", "cym": "Rhondda Cynon Taf" },' +
    '{ "eng": "Swansea", "cym": "Sir Abertawe" },' +
    '{ "eng": "The Vale of Glamorgan", "cym": "Bro Morgannwg" },' +
    '{ "eng": "Torfaen", "cym": "Tor-Faen" },' +
    '{ "eng": "Wrexham", "cym": "Wrecsam" }' +  
']'

request = Net::HTTP::Post.new('/counties')
request.body = counties
request["Content-Type"] = "application/json"
response = http.request(request)
puts "banks-reg/counties: #{response.code}"
if response.code != "200"    
    puts response.body
end
puts ">> Inserted Counties"

folder = File.dirname(__FILE__)
county_data = File.readlines("#{folder}/counties.csv")
data = []
ref_nums = {}
refs = 0
county_data.each do |line|
    line_array = line.split(',')
    item = {
        'name' => line_array[0],
        'key' => line_array[2],
        'variant_of' => line_array[1],
        'county_council' => (!line_array[3].nil? && line_array[3].strip == 'Y')
    }

    #if line_array[3] == 'Y'
    #    item['county_council'] = 'true'
    #end

    data.push(item)
end



request = Net::HTTP::Put.new('/area_variants')
request.body = JSON.dump(data)
request["Content-Type"] = "application/json"
response = http.request(request)
puts "land-charges/area_variants: #{response.code}"
if response.code != "200"    
    puts response.body
end
puts ">> Inserted Area Variants"