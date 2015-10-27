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
