# frozen_string_literal: true

require 'dry-initializer'
require 'dry/monads/all'

module VerifyKit
  module Core
    class Service
      extend Dry::Initializer

      include Dry::Monads
      include Dry::Monads::Do
    end
  end
end
