# frozen_string_literal: true

require_relative 'lib/verify_kit/version'

# rubocop:disable Layout/LineLength
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

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
# rubocop:enable Layout/LineLength
