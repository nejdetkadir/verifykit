# frozen_string_literal: true

module VerifyKit
  module Resources
    class WhatsApp < VerifyKit::Resources::Base
      def send(body = {}, params = {})
        response = post_request('start', body: body, params: params)
        return error_response(response) unless response.success?

        success_response(response)
      end

      def check(body = {}, params = {})
        response = post_request('check-whatsapp', body: body, params: params)
        return error_response(response) unless response.success?

        success_response(response)
      end
    end
  end
end
