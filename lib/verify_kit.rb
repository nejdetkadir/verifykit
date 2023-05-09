# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module VerifyKit
  class Error < StandardError; end
  # Your code goes here...
end
