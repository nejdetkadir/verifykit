# frozen_string_literal: true

RSpec.describe VerifyKit do
  before(:all) { VerifyKit.reset_config }

  it 'has a version number' do
    expect(VerifyKit::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'yields the global config' do
      expect { |b| VerifyKit.configure(&b) }.to yield_with_args(VerifyKit.config)
    end

    it 'sets the global config' do
      VerifyKit.configure { |c| c.server_key = 'deneme' }
      expect(VerifyKit.config.server_key).to eq('deneme')
    end

    it 'sets the global config with nested values' do
      VerifyKit.configure { |c| c.debug.enabled = true }
      expect(VerifyKit.config.debug.enabled).to eq(true)
    end
  end

  describe '.reset_config' do
    it 'resets the global config' do
      VerifyKit.configure { |c| c.server_key = 'deneme' }
      VerifyKit.reset_config
      expect(VerifyKit.config.server_key).to be_nil
    end

    it 'resets the global config with nested values' do
      VerifyKit.configure { |c| c.debug.enabled = true }
      VerifyKit.reset_config
      expect(VerifyKit.config.debug.enabled).to eq(false)
    end
  end
end
