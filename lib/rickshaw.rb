require "rickshaw/version"
require "rickshaw/parcel"
require "httparty"

module Rickshaw
  BASE_URL = 'https://gorickshaw.com'
  @auth = nil
  @headers = {
    'Content-Type' => 'application/json',
    'Accept'       => 'application/json'
  }

  class << self
    def configure(secret_key)
      if secret_key
        # TODO: test if key is valid before setting @auth
        @auth = {username: secret_key}
      else
        raise "No secret key provided"
      end
    end

    def get(url, id)
      HTTParty.get(BASE_URL + url + '/' + id, {basic_auth: @auth})
    end

    def get_all(url)
      HTTParty.get(BASE_URL + url, {basic_auth: @auth})
    end

    def create(url, body)
      HTTParty.post(BASE_URL + url, {headers: @headers, basic_auth: @auth, body: body.to_json})
    end
  end
end
