# frozen_string_literal: true

require_relative 'lib/verify_kit/version'

# rubocop:disable Layout/LineLength, Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name = 'verifykit'
  spec.version = VerifyKit::VERSION
  spec.authors = ['nejdetkadir']
  spec.email = ['nejdetkadir.550@gmail.com']

  spec.summary = 'Ruby bindings for VerifyKit REST API'
  spec.description = 'Ruby bindings for VerifyKit REST API. VerifyKit is a service that offers alternative channels alongside SMS for phone number verification and it enables your users to log in or sign up to your apps quickly.'
  spec.homepage = "https://github.com/nejdetkadir/#{spec.name}"
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # HTTP/REST API client library [https://github.com/lostisland/faraday]
  spec.add_dependency 'faraday', '~> 2.7', '>= 2.7.4'

  # DSL for declaring params and options of the initializer [https://github.com/dry-rb/dry-initializer]
  spec.add_dependency 'dry-initializer', '~> 3.1', '>= 3.1.1'

  # Common monads for Ruby [https://github.com/dry-rb/dry-monads]
  spec.add_dependency 'dry-monads', '~> 1.6'

  # Typed structs and value objects [https://github.com/dry-rb/dry-struct]
  spec.add_dependency 'dry-struct', '~> 1.6'

  # Type system for Ruby supporting coercions, constraints and complex types [https://github.com/dry-rb/dry-types]
  spec.add_dependency 'dry-types', '~> 1.7', '>= 1.7.1'

  # A mixin to add configuration functionality to your classes [https://github.com/dry-rb/dry-configurable]
  spec.add_dependency 'dry-configurable', '~> 1.0', '>= 1.0.1'

  # Efficient and thread-safe code loader for Ruby [https://github.com/fxn/zeitwerk]
  spec.add_dependency 'zeitwerk', '~> 2.6', '>= 2.6.8'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
