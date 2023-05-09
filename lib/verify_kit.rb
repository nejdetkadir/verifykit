# frozen_string_literal: true

require 'zeitwerk'
require 'logger'
require 'dry-configurable'
require 'dry/configurable/test_interface'

loader = Zeitwerk::Loader.for_gem
loader.setup

module VerifyKit
  extend Dry::Configurable

  enable_test_interface

  setting :server_key, default: nil, reader: true
  setting :api_version, default: 'v1.0', reader: true
  setting :logger, default: Logger.new($stdout), reader: true
  setting :debug do
    setting :enabled, default: false, reader: true
  end
end
