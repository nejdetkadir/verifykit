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

      def post_request(url, body:, headers: {}, params: {})
        connection.post(url, body, headers) do |req|
          req.params = params
        end
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
        error_response = VerifyKit::Responses::Error.new(response.body)
        Failure(error_response)
      end

      def success_response(response)
        success_response = VerifyKit::Responses::Success.new(response.body)
        Success(success_response)
      end
    end
  end
end
