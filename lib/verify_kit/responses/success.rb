# frozen_string_literal: true

module VerifyKit
  module Responses
    class Success < VerifyKit::Responses::Base
      attribute :meta, Types::Hash
      attribute :result, Types::Hash
    end
  end
end
