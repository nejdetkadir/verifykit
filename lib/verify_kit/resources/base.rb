# frozen_string_literal: true

module VerifyKit
  module Resources
    class Base < Core::Service
      param :client, type: Types.Instance(VerifyKit::Client)
      option :connection, type: Types.Instance(Faraday::Connection), default: proc { client.connection }

      private

      def get_request(url, params: {}, headers: {})
        connection.get(url, params, headers)
      end

      def post_request(url, body:, headers: {})
        connection.post(url, body, headers)
      end

      def patch_request(url, body:, headers: {})
        connection.patch(url, body, headers)
      end

      def put_request(url, body:, headers: {})
        connection.put(url, body, headers)
      end

      def delete_request(url, params: {}, headers: {})
        client.connection.delete(url, params, headers)
      end

      def error_response(response)
        # ...
      end
    end
  end
end
