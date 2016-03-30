require 'net/http'
require 'json'
require 'digest/sha1'


uri = URI(ENV['CASEWORK_API_URL'] || 'http://localhost:5006')
http = Net::HTTP.new(uri.host, uri.port)

stock_data = '[' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:45:49", "work_type": "bank_regn", "application_type": "PA(B)", "document_id": 12},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:41:49", "work_type": "bank_regn", "application_type": "PA(B)", "document_id": 13},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:42:49", "work_type": "bank_regn", "application_type": "PA(B)", "document_id": 14},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:43:50", "work_type": "bank_regn", "application_type": "PA(B)", "document_id": 15},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:46:52", "work_type": "bank_regn", "application_type": "WO(B)", "document_id": 26},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:44:52", "work_type": "bank_regn", "application_type": "WO(B)", "document_id": 27},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:47:52", "work_type": "bank_regn", "application_type": "WO(B)", "document_id": 28},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:48:52", "work_type": "bank_regn", "application_type": "WO(B)", "document_id": 29},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:49:53", "work_type": "bank_regn", "application_type": "PA(B)", "document_id": 66},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:41:52", "work_type": "cancel", "application_type": "K11", "document_id": 31},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:45:53", "work_type": "cancel", "application_type": "K11", "document_id": 33},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:42:53", "work_type": "cancel", "application_type": "K11", "document_id": 35},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:43:53", "work_type": "cancel", "application_type": "K11", "document_id": 37},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:44:53", "work_type": "cancel", "application_type": "K11", "document_id": 39},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:46:54", "work_type": "cancel", "application_type": "K11", "document_id": 41},' +
    '{"delivery_method": "Fax", "date": "2015-11-05 13:41:54", "work_type": "bank_amend", "application_type": "WO(B) Amend", "document_id": 1},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:43:54", "work_type": "bank_amend", "application_type": "WO(B) Amend", "document_id": 1},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:42:55", "work_type": "bank_amend", "application_type": "WO(B) Amend", "document_id": 1},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:47:55", "work_type": "bank_amend", "application_type": "WO(B) Amend", "document_id": 1},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:45:56", "work_type": "bank_amend", "application_type": "WO(B) Amend", "document_id": 1},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:48:56", "work_type": "bank_amend", "application_type": "WO(B) Amend", "document_id": 1},' +
    '{"delivery_method": "Portal", "date": "2015-11-05 13:41:56", "work_type": "search_full", "application_type": "K15", "document_id": 60},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:45:56", "work_type": "search_full", "application_type": "K15", "document_id": 61},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:42:56", "work_type": "search_bank", "application_type": "K16", "document_id": 62},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:43:56", "work_type": "search_bank", "application_type": "K16", "document_id": 63},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:44:56", "work_type": "search_full", "application_type": "K15", "document_id": 64},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:01:57", "work_type": "lc_regn", "application_type": "K1", "document_id": 66},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:14:57", "work_type": "lc_regn", "application_type": "K1", "document_id": 66},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:23:57", "work_type": "lc_regn", "application_type": "K1", "document_id": 66},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:03:57", "work_type": "lc_regn", "application_type": "K2", "document_id": 67},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:17:57", "work_type": "lc_regn", "application_type": "K2", "document_id": 67},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:24:57", "work_type": "lc_regn", "application_type": "K2", "document_id": 67},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:06:57", "work_type": "lc_regn", "application_type": "K3", "document_id": 68},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:19:57", "work_type": "lc_regn", "application_type": "K3", "document_id": 68},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:29:57", "work_type": "lc_regn", "application_type": "K3", "document_id": 68},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:09:57", "work_type": "lc_regn", "application_type": "K4", "document_id": 69},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:19:57", "work_type": "lc_regn", "application_type": "K4", "document_id": 69},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:31:57", "work_type": "lc_regn", "application_type": "K4", "document_id": 69},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:48:57", "work_type": "search_bank", "application_type": "K16", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:01:57", "work_type": "lc_pn", "application_type": "K6", "document_id": 64},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:56:57", "work_type": "lc_pn", "application_type": "K6", "document_id": 64},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "lc_rect", "application_type": "K9", "document_id": 41},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:06:57", "work_type": "lc_renewal", "application_type": "K7", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 14:05:57", "work_type": "lc_renewal", "application_type": "K7", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "lc_stored", "application_type": "K2", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "lc_stored", "application_type": "K1", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "bank_stored", "application_type": "WO(B)", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "cancel_part", "application_type": "K11", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "cancel_part", "application_type": "K11", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "cancel_stored", "application_type": "K11", "document_id": 65},' +
    '{"delivery_method": "Postal", "date": "2015-11-05 13:55:57", "work_type": "cancel", "application_type": "K13", "document_id": 66},' +
    '{"delivery_method": "Postal", "date": "2016-03-07 06:34:49", "work_type": "unknown", "application_type": "Unknown", "document_id": 33},' +
    '{"delivery_method": "Postal", "date": "2016-03-07 16:16:16", "work_type": "unknown", "application_type": "Unknown", "document_id": 62},' +
    '{"delivery_method": "Postal", "date": "2016-03-07 15:15:15", "work_type": "unknown", "application_type": "Unknown", "document_id": 63},' +
    '{"delivery_method": "Postal", "date": "2016-03-07 06:06:06", "work_type": "unknown", "application_type": "Unknown", "document_id": 64},' +
    '{"delivery_method": "Postal", "date": "2016-03-07 09:09:09", "work_type": "unknown", "application_type": "Unknown", "document_id": 41},' +
    '{"delivery_method": "Postal", "date": "2016-03-07 01:01:01", "work_type": "unknown", "application_type": "Unknown", "document_id": 66},' +
    '{"delivery_method": "Portal", "date": "2015-11-05 22:22:22", "work_type": "unknown", "application_type": "Unknown", "document_id": 67},' +
    '{"delivery_method": "Portal", "date": "2016-03-09 09:01:22", "work_type": "bank_amend", "application_type": "LRRABO", "document_id": 43},' +
    '{"delivery_method": "Portal", "date": "2016-03-10 12:01:27", "work_type": "bank_amend", "application_type": "LRRABO", "document_id": 43}' +
']'

request = Net::HTTP::Put.new('/applications')
request.body = stock_data
request["Content-Type"] = "application/json"
response = http.request(request)
if response.code != "200"
    puts "casework-api/workitem/bulk: #{response.code}"
    puts response.body
end



standard_data = [
    { "type" => "WO(B)", "images" => ["img53_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img53_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img53_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img53_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img53_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img7_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img8_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img9_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img10_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img11_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img12_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img13_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img14_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img15_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img16_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img17_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img18_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img19_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img20_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img21_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img22_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img23_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img24_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img25_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img26_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img27_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img28_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img29_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img30_1.tiff"] },
    { "type" => "K11", "images" => ["img31_1.tiff","img31_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img32_1.tiff"] },
    { "type" => "K11", "images" => ["img33_1.tiff","img33_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img34_1.tiff"] },
    { "type" => "K11", "images" => ["img35_1.tiff","img35_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img36_1.tiff"] },
    { "type" => "K11", "images" => ["img37_1.tiff","img37_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img38_1.tiff"] },
    { "type" => "K11", "images" => ["img39_1.tiff","img39_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img40_1.tiff"] },
    { "type" => "K11", "images" => ["img41_1.tiff","img41_2.tiff"] },
    { "type" => "K9", "images" => ["img42_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img43_1.tiff"] },
    { "type" => "Unknown", "images" => ["img44_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img45_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img46_1.tiff"] },
    { "type" => "Unknown", "images" => ["img47_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img48_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img49_1.tiff"] },
    { "type" => "Unknown", "images" => ["img50_1.tiff","img50_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img51_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img52_1.tiff"] },
    { "type" => "Unknown", "images" => ["img53_1.tiff"] },
    { "type" => "WO(B)", "images" => ["img54_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img55_1.tiff"] },
    { "type" => "Unknown", "images" => ["img56_1.tiff", "img56_2.tiff"] },
    { "type" => "WO(B)", "images" => ["img57_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img58_1.tiff"] },
    { "type" => "Unknown", "images" => ["img59_1.tiff"] },
    { "type" => "K15", "images" => ["img60_1.tiff"] },
    { "type" => "K15", "images" => ["img61_1.tiff", "img62_1.tiff"] },
    { "type" => "K16", "images" => ["img62_1.tiff"] },
    { "type" => "K16", "images" => ["img63_1.tiff"] },
    { "type" => "K15", "images" => ["img64_1.tiff"] },
    { "type" => "K16", "images" => ["img65_1.tiff"] },
    { "type" => "PA(B)", "images" => ["img66_1.tiff"] },
    { "type" => "K1", "images" => ["img_67_1.tiff"] },
    { "type" => "K2", "images" => ["img_68_1.tiff"] },
    { "type" => "K3", "images" => ["img69_1.tiff"] },
    { "type" => "K4", "images" => ["img70_1.tiff"] },
    { "type" => "K13", "images" => ["img71_1.tiff"] },
]

folder = File.dirname(__FILE__)
uri = URI(ENV['CASEWORK_API_URL'] || 'http://localhost:5006')
http = Net::HTTP.new(uri.host, uri.port)

standard_data.each do |item|
    request = Net::HTTP::Post.new("/forms/A4?type=#{item['type']}")
    request["Content-Type"] = "image/tiff"
    element = item['images'][0]
    image = "#{folder}/images/#{element}"
    f = IO.binread(image)
    request.body = f
    response = http.request(request)
    if response.code != "201"
        puts "casework-api/forms/A4: #{response.code}"
        puts response.body
    end
    if item["images"].length > 1
        result = JSON.parse(response.body)
        id = result['id']
        request = Net::HTTP::Post.new('/forms/' + id.to_s + '/A4')
        request["Content-Type"] = "image/tiff"
        element = item["images"][1]
        image = "#{folder}/images/#{element}"
        f = IO.binread(image)
        request.body = f
        response = http.request(request)
        if response.code != "201"
            puts "casework-api/forms/id/A4: #{response.code}"
            puts response.body
        end
    end
end


res = '[' +
      '{"request_id": "1", "print_status": "", "res_type": "search"},' +
      '{"request_id": "2", "print_status": "", "res_type": "search nr"},' +
      '{"request_id": "3", "print_status": "", "res_type": "registration"},' +
      '{"request_id": "4", "print_status": "", "res_type": "registration"},' +
      '{"request_id": "5", "print_status": "", "res_type": "registration"},' +
      '{"request_id": "6", "print_status": "", "res_type": "registration"}' +
	']'
request = Net::HTTP::Post.new('/results')
request.body = res
request["Content-Type"] = "application/json"
response = http.request(request)
if response.code != "200"
    puts "/results: #{response.code}"
end

#`cp #{folder}/images/*.tiff ~/interim/`



