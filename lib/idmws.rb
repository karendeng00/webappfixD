require 'net/http'
require 'json'
require 'uri'

class Idmws

    def self.getName(duid)
        url = "https://idms-web-ws.oit.duke.edu/idm-ws/user/findById/#{duid}?attributes=USR_FIRST_NAME,USR_LAST_NAME"
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(uri.request_uri)
        request.basic_auth(ENV["IDMS_USER"], ENV["IDMS_PASSWORD"])
        response = http.request(request).body
        doc = JSON.parse(response)
        username = doc["userQueryResult"]["users"][0]["attributes"]["USR_FIRST_NAME"][0] + " " + doc["userQueryResult"]["users"][0]["attributes"]["USR_LAST_NAME"][0]
        username 
    end

end