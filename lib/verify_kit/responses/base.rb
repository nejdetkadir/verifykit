# frozen_string_literal: true

require 'dry-struct'

module VerifyKit
  module Responses
    class Base < Dry::Struct
      transform_keys(&:to_sym)
    end
  end
end
