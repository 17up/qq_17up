require "digest/md5"
require "base64"

module Qq
  class Oauth
    API_URL = "https://graph.qq.com/"

    def initialize(access_token,openid)
      filename = "#{Rails.root}/config/service.yml"
      config = YAML.load(File.open(filename))[Rails.env]
      @app_key = config['qq_connect']['app_id']
      @access_token = access_token
      @openid = openid
    end

    def get(path, parameters = {})
      parameters.merge!(openid: @openid,access_token: @access_token,oauth_consumer_key: @app_key)
      JSON.parse RestClient.get(api_url(path), :params => parameters)
    end

    def post(path, parameters = {})
      parameters.merge!(openid: @openid,access_token: @access_token,oauth_consumer_key: @app_key)
      JSON.parse RestClient.post(api_url(path), parameters)
    end

    ######################################################
    #
    # @param string $signed_request 应用框架在加载iframe时会通过向Canvas URL post的参数signed_request
    #
    #####################################################
    def self.parse_signed_request(signed_request)
      encoded_sig, payload = signed_request.split(".")
      sig = Base64.decode64_url(encoded_sig)
      begin
        data = JSON.parse(Base64.decode64_url(payload))
      rescue Exception => e
        return nil
      end
      return nil if data["algorithm"].upcase != "HMAC-SHA256"

      expected_sig = OpenSSL::HMAC.digest("sha256", Config.app_secret, payload)
      (sig != expected_sig) ? nil : data
    end

    private
    def api_url(path)
      path = path.gsub /^\//, ""
      "#{API_URL}#{path}"
    end

  end
end
