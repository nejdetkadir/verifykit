# frozen_string_literal: true

require 'faraday'

module VerifyKit
  class Client < Core::Service
    BASE_URL = 'https://web-rest.verifykit.com'
    SERVER_KEY_HEADER = 'X-Vfk-Server-Key'

    option :server_key, type: Types::String | Types::Nil, default: proc { VerifyKit.config.server_key }
    option :api_version, type: Types::String, default: proc { VerifyKit.config.api_version }
    option :adapter, type: Types::Symbol, default: proc { Faraday.default_adapter }

    def connection
      @connection ||= Faraday.new(connection_url) do |conn|
        conn.headers[SERVER_KEY_HEADER] = server_key
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter

        if VerifyKit.config.debug.enabled
          conn.response :logger, VerifyKit.config.logger, body: true,
                                                          bodies: { request: true, response: true }
        end
      end
    end

    private

    def connection_url
      BASE_URL + "/#{api_version}"
    end
  end
end
