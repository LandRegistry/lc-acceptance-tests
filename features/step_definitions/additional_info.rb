
part_cancel_plan_attached = {"applicant" => {"name" => "S & H Legal Group", "key_number" => "1234567", "address" => "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "reference" => "asda"}, "registration" => {"date" => ""}, "registration_no" => "", "update_registration" => {"type" => "Part Cancellation", "plan_attached" => ""}, "class_of_charge" => "C1", "fee_details" => {"type" => "dd", "delivery" => "Postal", "fee_factor" => 1}, "document_id" => 31}

part_cancel_no_plan = {"applicant" => {"name" => "S & H Legal Group", "key_number" => "1234567", "address" => "49 Camille Circles\r\nPort Eulah\r\nPP39 6BY", "reference" => "asda"}, "registration" => {"date" => ""}, "registration_no" => "", "update_registration" => {"type" => "Part Cancellation", "part_cancelled" => ""}, "class_of_charge" => "C1", "fee_details" => {"type" => "dd", "delivery" => "Postal", "fee_factor" => 1}, "document_id" => 31}

def get_registration(date, number)
    api = RestAPI.new($LAND_CHARGES_URI)
    api.get("/registrations/#{date}/#{number}")
end

def replace_placeholders(message, original, updated, pab=nil)
    # [ORIG_REGNO] REGD [ORIG_DATE]
    
    #puts message
    #puts original
    #puts updated
    #puts pab
    
    res = message.gsub("[ORIG_REGNO]", original['registration']['number'].to_s)
    odate = original['registration']['date'].sub(/(\d{4})\-(\d\d)\-(\d\d)/, "\\3/\\2/\\1")
    res = res.gsub("[ORIG_DATE]", odate)

    res = res.gsub("[NEW_REGNO]", updated['registration']['number'].to_s)
    ndate = updated['registration']['date'].sub(/(\d{4})\-(\d\d)\-(\d\d)/, "\\3/\\2/\\1")
    res = res.gsub("[NEW_DATE]", ndate)
    
    if pab
        
        res = message.gsub("[ORIG_WOB_REGNO]", original['registration']['number'].to_s)
        odate = original['registration']['date'].sub(/(\d{4})\-(\d\d)\-(\d\d)/, "\\3/\\2/\\1")
        res = res.gsub("[ORIG_WOB_DATE]", odate)

        res = res.gsub("[ORIG_PAB_REGNO]", pab['registration']['number'].to_s)
        ndate = pab['registration']['date'].sub(/(\d{4})\-(\d\d)\-(\d\d)/, "\\3/\\2/\\1")
        res = res.gsub("[ORIG_PAB_DATE]", ndate)
    end

    res
end


Given(/^an existing (.+?) registration$/) do |coc|
    if coc == 'C1'
        submit = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"}}
    elsif coc == 'WO'
        submit = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "WO", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"}}
    else
        puts "ERROR"
    end

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @existing_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-06", JSON.dump(submit))
    #puts @existing_data
    expect(@registration_api.response.code).to eql "200"
end

When(/^I part cancel the registration with "([^"]*)" set to "([^"]*)"$/) do |what, desc|
    if what == 'Plan attached'
        part_cancel_plan_attached['update_registration']['plan_attached'] = desc
        part_cancel_plan_attached['registration']['date'] = '2014-06-06'
        part_cancel_plan_attached['registration_no'] = @existing_data['new_registrations'][0]['number']
        data = part_cancel_plan_attached
    elsif what == 'part cancelled'
        part_cancel_no_plan['update_registration']['part_cancelled'] = desc
        part_cancel_no_plan['registration']['date'] = '2014-06-06'
        part_cancel_no_plan['registration_no'] = @existing_data['new_registrations'][0]['number']
        data = part_cancel_no_plan
    else
        puts "ERROR"
    end

    @altered_data = @registration_api.post('/cancellations', JSON.dump(data))
    #puts @altered_data
    expect(@registration_api.response.code).to eql "200"

    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'], @existing_data['new_registrations'][0]['number'])

    @new_regn = get_registration(@altered_data['cancellations'][0]['date'], @altered_data['cancellations'][0]['number'])
end

Then(/^the original registration's additional information will read "([^"]*)"$/) do |arg1|
#    puts @original_regn
#    puts @new_regn

    ai = replace_placeholders(arg1, @original_regn, @new_regn)

#    puts ai
#    puts @original_regn['additional_information']
    expect(@original_regn['revealed']).to be true
    expect(@original_regn['additional_information']).to eql ai
end

Then(/^the new registration is not revealed$/) do

    expect(@new_regn['revealed']).to be false
end

Given(/^an existing PAB and WOB registration with court details of "([^"]*)" ref "([^"]*)"$/) do |court, ref|
    @wob_court = court
    @wob_ref = ref
    
    pab = {"applicant" => {"name" => "Waste of space", "address" => "2 New Street, My Town", "key_number" => "1234567", "reference" => " "},
    "parties" =>[{"names" => [{"type" => "Private Individual", "private" => {"forenames" => ["Mister"], "surname" => "Bankrupt" }}], "trading_name" => " ", "addresses" => [{"county" => "Devon", "address_lines" => ["2 new street", "Plymouth"], "postcode" => "PL3 3PL", "type" => "Residence", "address_string" => "2 new street Plymouth Devon PL3 3PL"}], "occupation" => "", "type" => "Debtor", "residence_withheld" => false,
        "case_reference" => "#{court} #{ref}"}],
    "class_of_charge" => "PAB"}

    wob = {"parties" => [{"type" => "Debtor", "trading_name" => " ", "occupation" => "Unemployed", "names" => [{"type" => "Private Individual", "private" => {"surname" => "Bankrupt", "forenames" => ["Mister"]}}],
    "case_reference" => "#{court} #{ref}",
    "addresses" => [{"county" => "Devon", "type" => "Residence", "postcode" => "OT1 1AA", "address_lines" => ["1 Other Road", "Otherton"], "address_string" => "1 Other Road Otherton Devon OT1 1AA"}], "residence_withheld" => false}], "class_of_charge" => "WOB",
    "applicant" => {"key_number" => "1234567", "address" => "49 Camille Circles Port Eulah PP39 6BY", "reference" => " ", "name" => "S & H Legal Group"}}

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @existing_data_pab = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-06", JSON.dump(pab))
    #puts @existing_data_pab
    expect(@registration_api.response.code).to eql "200"

    @existing_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-16", JSON.dump(wob))
    #puts @existing_data
    expect(@registration_api.response.code).to eql "200"
    
    @pab_regn = get_registration(@existing_data_pab['new_registrations'][0]['date'], @existing_data_pab['new_registrations'][0]['number'])
end

When(/^I amend the WOB's address$/) do
    amendment = {"parties" => [{"type" => "Debtor", "trading_name" => " ", "occupation" => "Unemployed", "names" => [{"type" => "Private Individual", "private" => {"surname" => "Bankrupt", "forenames" => ["Mister"]}}],
    "case_reference" => "#{@wob_court} #{@wob_ref}",
    "addresses" => [{"county" => "Devon", "type" => "Residence", "postcode" => "OT1 1AA", "address_lines" => ["1 This Road", "Thiston"], "address_string" => "1 This Road Thiston Devon OT1 1AA"}], "residence_withheld" => false}], "class_of_charge" => "WOB",
    "applicant" => {"key_number" => "1234567", "address" => "49 Camille Circles Port Eulah PP39 6BY", "reference" => " ", "name" => "S & H Legal Group"}, 'update_registration' => {'type'=>'Amendment'}}
    
    amendment['pab_amendment'] = {
        "reg_no" => @existing_data_pab['new_registrations'][0]['number'],
        "date" => @existing_data_pab['new_registrations'][0]['date']
    }

    reg_no = @existing_data['new_registrations'][0]['number']
    date = @existing_data['new_registrations'][0]['date']
    @altered_data = @registration_api.put("/registrations/#{date}/#{reg_no}", JSON.dump(amendment))
    #puts @altered_data
    expect(@registration_api.response.code).to eql "200"
    
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'], @existing_data['new_registrations'][0]['number'])

    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'], @altered_data['new_registrations'][0]['number'])
end

Then(/^a new registration is created$/) do
    #puts @altered_data
    expect(@altered_data['amended_registrations'][0]['number']).to_not eq @altered_data['new_registrations'][0]['number']
end

Then(/^the new registration's additional information will read "([^"]*)"$/) do |arg1|
#    puts @original_regn
#    puts @new_regn

    ai = replace_placeholders(arg1, @original_regn, @new_regn, @pab_regn)

#    puts ai
#    puts @new_regn['additional_information']

    expect(@new_regn['revealed']).to be true
    expect(@new_regn['additional_information']).to eql ai
end

Then(/^the original registration is not revealed$/) do
    expect(@original_regn['revealed']).to be false
end

When(/^I amend the WOB's debtor name to "([^"]*)"$/) do |name|
    name_list = name.split(' ')
    forename = name_list[0..-2]
    surname = name_list[-1]
    
    amendment = {"parties" => [{"type" => "Debtor", "trading_name" => " ", "occupation" => "Unemployed", "names" => [{"type" => "Private Individual", "private" => {"surname" => surname, "forenames" => forename}}],
    "case_reference" => "#{@wob_court} #{@wob_ref}",
    "addresses" => [{"county" => "Devon", "type" => "Residence", "postcode" => "OT1 1AA", "address_lines" => ["1 Other Road", "Otherton"], "address_string" => "1 Other Road Otherton Devon OT1 1AA"}], "residence_withheld" => false}], "class_of_charge" => "WOB",
    "applicant" => {"key_number" => "1234567", "address" => "49 Camille Circles Port Eulah PP39 6BY", "reference" => " ", "name" => "S & H Legal Group"}, 'update_registration' => {'type'=>'Amendment'}}

    amendment['pab_amendment'] = {
        "reg_no" => @existing_data_pab['new_registrations'][0]['number'],
        "date" => @existing_data_pab['new_registrations'][0]['date']
    }

    reg_no = @existing_data['new_registrations'][0]['number']
    date = @existing_data['new_registrations'][0]['date']
    @altered_data = @registration_api.put("/registrations/#{date}/#{reg_no}", JSON.dump(amendment))
    #puts @altered_data
    expect(@registration_api.response.code).to eql "200"

    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'], @existing_data['new_registrations'][0]['number'])

    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'], @altered_data['new_registrations'][0]['number'])
end

Given(/^an existing C1 registration with a short description of "([^"]*)"$/) do |sdesc|
    submit = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => sdesc, "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"}}

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @existing_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-06", JSON.dump(submit))
    expect(@registration_api.response.code).to eql "200"
end

When(/^I rectify the short description to "([^"]*)"$/) do |sdesc|
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => sdesc, "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification"}}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

Then(/^the original registration is updated$/) do
#    puts @original_regn
#    puts "----"
#    puts @new_regn

    expect(@original_regn['registration']['sequence']).to eq 2

end

Given(/^an existing C1 registraton with a district of "([^"]*)"$/) do |district|
    submit = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => district}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"}}

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @existing_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-06", JSON.dump(submit))
    expect(@registration_api.response.code).to eql "200"
end

When(/^I rectify the district to "([^"]*)"$/) do |district|
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => district}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification"}}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

Given(/^an existing C1 registration with a name of "([^"]*)"$/) do |name|
    name_list = name.split(' ')
    forename = name_list[0..-2]
    surname = name_list[-1]

    submit = {"parties" => [{"names" => [{"private" => {"forenames" => forename, "surname" => surname}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"}}

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @existing_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-06", JSON.dump(submit))
    expect(@registration_api.response.code).to eql "200"
end

When(/^I rectify the name to "([^"]*)"$/) do |name|
    name_list = name.split(' ')
    forename = name_list[0..-2]
    surname = name_list[-1]

    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => forename, "surname" => surname}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification"}}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

Given(/^an existing C1 registration with a county of "([^"]*)"$/) do |county|
    submit = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => [county], "description" => "Short Desc Here", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"}}

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @existing_data = @registration_api.post("/registrations?suppress_queue=yes&dev_date=2014-06-06", JSON.dump(submit))
    expect(@registration_api.response.code).to eql "200"
end

When(/^I rectify the county to "([^"]*)"$/) do |county|
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => [county], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification"}}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

When(/^I rectify with an additional county of "([^"]*)"$/) do |county|
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon", county], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification"}}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

When(/^I rectify the date of instrument from "([^"]*)" to "([^"]*)"$/) do |arg1, arg2|
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification", "instrument" =>
        {"original" => arg1, "current" => arg2} }}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

Then(/^the original registration's addtional information will read "([^"]*)"$/) do |arg1|
#    puts @original_regn
#    puts @new_regn

    ai = replace_placeholders(arg1, @original_regn, @new_regn, @pab_regn)
    expect(@original_regn['revealed']).to be true
    expect(@original_regn['additional_information']).to eql ai
end

When(/^I rectify the chargee from "([^"]*)" to "([^"]*)"$/) do |arg1, arg2|
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C1", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification", "chargee" =>
        {"original" => arg1, "current" => arg2} }}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

When(/^I rectify the class of charge to "C2"$/) do
    rectibob = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "C2", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Rectification"}}

    @altered_data = @registration_api.put(
        "/registrations/#{@existing_data['new_registrations'][0]['date']}/#{@existing_data['new_registrations'][0]['number']}", JSON.dump(rectibob))

    expect(@registration_api.response.code).to eql "200"

    #puts @existing_data
    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

#    puts '===='
#    puts @altered_data
    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end

When(/^I renew the registration$/) do
    submit = {"parties" => [{"names" => [{"private" => {"forenames" => ["Joyce", "Lyn"], "surname" => "West"}, "type" => "Private Individual"}], "type" => "Estate Owner"}], "particulars" => {"counties" => ["Devon"], "description" => "45 New street", "district" => "Plymouth"}, "class_of_charge" => "WO", "applicant" => {"address" => "2 New Street", "name" => "Mr Conveyancer", "key_number" => "244095", "reference" => "reference 11"},
    "update_registration" => {"type" => "Renewal"},
    "registration" => {"date" => @existing_data['new_registrations'][0]['date']},
    "registration_no" => @existing_data['new_registrations'][0]['number']
    }

    @registration_api = RestAPI.new($LAND_CHARGES_URI)
    @altered_data = @registration_api.post("/renewals", JSON.dump(submit))
    #puts @altered_data
    expect(@registration_api.response.code).to eql "200"

    @original_regn = get_registration(@existing_data['new_registrations'][0]['date'],
        @existing_data['new_registrations'][0]['number'])

    @new_regn = get_registration(@altered_data['new_registrations'][0]['date'],
        @altered_data['new_registrations'][0]['number'])
end
