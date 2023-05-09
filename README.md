[![Gem Version](https://badge.fury.io/rb/verifykit.svg)](https://badge.fury.io/rb/verifykit)
![test](https://github.com/nejdetkadir/verifykit/actions/workflows/test.yml/badge.svg?branch=main)
![rubocop](https://github.com/nejdetkadir/verifykit/actions/workflows/rubocop.yml/badge.svg?branch=main)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
![Ruby Version](https://img.shields.io/badge/ruby_version->=_2.7.0-blue.svg)

# VerifyKit

![cover](docs/cover.png)

The easiest and most complete unofficial [VerifyKit](https://verifykit.com) API client for Ruby.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
$ bundle add verifykit
```

Or add the following line to the application's Gemfile:

```ruby
gem 'verifykit', github: 'nejdetkadir/verifykit', branch: 'main'
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install verifykit
```

## Usage

### Configuration

```ruby
# config/initializers/verifykit.rb

VerifyKit.configure do |config|
  # it's optional, you can set manually when you create a VerifyKit::Client instance too
  config.server_key = ENV.fetch('VERIFYKIT_SERVER_KEY')

  # it's optional, default is Logger.new(STDOUT)
  config.logger = Rails.logger

  # it's optional, default is false
  config.debug.enabled = true

  # it's optional, default is 'v1.0', you can set manually when you create a VerifyKit::Client instance too but VerifyKit doesn't support any other version yet, so don't change it
  config.api_version = 'v1.0'
end

# or

VerifyKit.config.server_key = ENV.fetch('VERIFYKIT_SERVER_KEY')
VerifyKit.config.logger = Rails.logger
VerifyKit.config.debug.enabled = true
VerifyKit.config.api_version = 'v1.0'
```

### Client

```ruby
# you can create a client instance with default configuration
client = VerifyKit::Client.new

# or you can create a client instance with custom configuration
client = VerifyKit::Client.new(server_key: 'your-server-key', api_version: 'v1.0')
```

### Verification

VerifyKit supports two verification methods: `sms` and `whatsapp`.

#### SMS Verification

Send a verification code to the phone number like this:

```ruby
client = VerifyKit::Client.new

params = { phoneNumber: '555 555 55 55', countryCode: 'TR' }
query = { lang: 'tr' } # optional, default is 'en'

result = client.sms.send(params) # or client.sms.send(params, query)

if result.success?
  success_response = result.success
  # success_response is a VerifyKit::Response::Success instance

  # do something
else
  error_response = result.failure
  # error_response is a VerifyKit::Response::Error instance

  # do something
end
```

Check the verification code like this:

```ruby
client = VerifyKit::Client.new

params = { phoneNumber: '554 597 46 46',
           countryCode: 'TR',
           reference: 'reference code',
           code: 'verification code' }
query = { lang: 'tr' } # optional, default is 'en'

result = client.sms.check(params) # or client.sms.check(params, query)

if result.success?
  success_response = result.success
  # success_response is a VerifyKit::Response::Success instance

  # do something
else
  error_response = result.failure
  # error_response is a VerifyKit::Response::Error instance

  # do something
end
```

#### WhatsApp Verification

Send a verification code to the phone number like this:

```ruby
client = VerifyKit::Client.new

params = { phoneNumber: '555 555 55 55', countryCode: 'TR' }
query = { lang: 'tr' } # optional, default is 'en'

result = client.whatsapp.send(params) # or client.whatsapp.send(params, query)

if result.success?
  success_response = result.success
  # success_response is a VerifyKit::Response::Success instance

  # do something
else
  error_response = result.failure
  # error_response is a VerifyKit::Response::Error instance

  # do something
end
```

Check the verification code like this:

```ruby
client = VerifyKit::Client.new

params = { reference: 'reference code',
           code: 'verification code' }
query = { lang: 'tr' } # optional, default is 'en'

result = client.whatsapp.check(params) # or client.whatsapp.check(params, query)

if result.success?
  success_response = result.success
  # success_response is a VerifyKit::Response::Success instance

  # do something
else
  error_response = result.failure
  # error_response is a VerifyKit::Response::Error instance

  # do something
end
```

### Response Objects

- [VerifyKit::Response::Success](lib/verify_kit/responses/success.rb)
- [VerifyKit::Response::Error](lib/verify_kit/responses/error.rb)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nejdetkadir/verifykit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/nejdetkadir/verifykit/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).

## Code of Conduct

Everyone interacting in the Verifykit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nejdetkadir/verifykit/blob/main/CODE_OF_CONDUCT.md).
