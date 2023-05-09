# frozen_string_literal: true

module VerifyKit
  module Resources
    class SMS < VerifyKit::Resources::Base
      def send(body = {}, params = {})
        response = post_request('send-otp', body: body, params: params)
        return error_response(response) unless response.success?

        success_response(response)
      end

      def check(body = {}, params = {})
        response = post_request('check-otp', body: body, params: params)
        return error_response(response) unless response.success?

        success_response(response)
      end
    end
  end
end
