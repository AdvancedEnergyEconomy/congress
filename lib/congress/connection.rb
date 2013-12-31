require 'faraday_middleware'

module Congress
  module Connection
  private

    def connection
      Faraday.new(:url => 'http://congress.api.sunlightfoundation.com') do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::Rashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
