def is_gui?
    if RUBY_PLATFORM =~ /darwin/ # MacOS
        true
    elsif RUBY_PLATFORM =~ /mingw32/ # Windows
        true
    else
        false
    end
end

def prepare_data
    puts "Prepare data"
    if is_gui?
        #puts "vagrant"
        #puts `vagrant ssh -c reset-data`# 2> /dev/null`
        puts `ruby C:\\dev\\devenv-diti\\apps\\acceptance-tests\\features\\support\\reset-data.rb`
    else
        reset_data
    end
    # `rabbitmqadmin purge queue name=bank-process`
end

def maximise_browser
    if is_gui?
        page.driver.browser.manage.window.maximize
    end
end

def close_browser
    if is_gui?
        page.driver.browser.close
    end
end

def create_registration
    no_alias = '{"key_number":"9056267","class_of_charge":"PA(B)", "application_type":"PA(B)", "document_id":"22", "application_ref":"9763603","date":"2014-11-12","debtor_names":[{"forenames":["Lamar","Sigmund"],"surname":"Effertz"}],"gender":"N/A","occupation":"Ship builder","residence":[{"address_lines":["942 Carley Unions","Cullenberg","Dimitrimouth"],"county": "Buckinghamshire", "postcode":"QF47 0HG"}],"residence_withheld":false,"business_address":[],"date_of_birth":"1974-10-03","investment_property":[],"customer_name":"", "customer_address":""}'
    uri = URI($BANKRUPTCY_REGISTRATION_URI)
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new("/registrations")
    request.body = no_alias
    request["Content-Type"] = "application/json"

    response = http.request(request)
    puts response.body
    data = JSON.parse(response.body)

    puts(data)
    data['new_registrations'][0]
end
