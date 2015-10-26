require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'rspec'
require 'capybara/cucumber'
require 'net/http'
require 'json'
require 'pg'
require 'date'
require_relative '../support/utility'

def prepare_data
    if is_gui?
        `vagrant ssh -c reset-data 2> /dev/null`
    else
        reset_data
    end
    `rabbitmqadmin purge queue name=bank-process`
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

if is_gui?
    Capybara.default_driver = :selenium
else
    Capybara.default_driver = :poltergeist
    Capybara.javascript_driver = :poltergeist
    require 'capybara/poltergeist'
    Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(
            app,
            inspector: true,
            timeout: 240,
            js_errors: false,
            window_size: [1600,1200],
            phantomjs_options: [
                '--ignore-ssl-errors=yes',
                '--local-to-remote-url-access=yes'
            ]
        )
    end
end

Before do |scenario|
    prepare_data
end

After do |scenario|
    # Cucumber.wants_to_quit = true if scenario.failed?
end

def create_registration
    no_alias = '{"key_number":"9056267","application_type":"PA(B)", "document_id":"22", "application_ref":"9763603","date":"2014-11-12","debtor_name":{"forenames":["Lamar","Sigmund"],"surname":"Effertz"},"debtor_alternative_name":[],"gender":"N/A","occupation":"Ship builder","residence":[{"address_lines":["942 Carley Unions","Cullenberg","Dimitrimouth"],"county": "Buckinghamshire", "postcode":"QF47 0HG"}],"residence_withheld":false,"business_address":{"address_lines":["122 Leuschke Creek","Alvaburgh"],"county": "Fife", "postcode":"NO03 1EU"},"date_of_birth":"1974-10-03","investment_property":[]}'
    uri = URI("http://localhost:5004")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new("/registration")
    request.body = no_alias
    request["Content-Type"] = "application/json"

    response = http.request(request)
    puts response.body
    data = JSON.parse(response.body)


    data['new_registrations'][0]
end


class RestAPI
    attr_reader :response, :data
    @@last_response = nil

    def self.last_response
        @@last_response
    end

    def initialize(uri)
        @uri = URI(uri)
        @http = Net::HTTP.new(@uri.host, @uri.port)
    end

    def post(url, data = nil)
        request = Net::HTTP::Post.new(url)
        unless data.nil?
            request.body = data
            request["Content-Type"] = "application/json"
        end
        @@last_response = @http.request(request)

        if @@last_response.body == ""
            nil
        else
            @data = JSON.parse(@@last_response.body)
        end
    end

    def get(url, data = nil)
        request = Net::HTTP::Get.new(url)
        unless data.nil?
            request.body = data
            request["Content-Type"] = "application/json"
        end
        @@last_response = @http.request(request)
        @data = JSON.parse(@@last_response.body)
    end

    def put(url, data)
        request = Net::HTTP::Put.new(url)
        request.body = data
        request["Content-Type"] = "application/json"
        @@last_response = @http.request(request)
        @@last_response.body
    end
end
