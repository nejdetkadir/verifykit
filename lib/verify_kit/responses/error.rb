# frozen_string_literal: true

module VerifyKit
  module Responses
    class Error < VerifyKit::Responses::Base
      attribute :meta, Types::Hash
    end
  end
end
