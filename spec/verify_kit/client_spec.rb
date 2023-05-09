# frozen_string_literal: true

RSpec.describe VerifyKit::Client do
  subject(:client) { described_class.new }

  describe '#connection' do
    it 'returns a Faraday::Connection' do
      expect(client.connection).to be_a(Faraday::Connection)
    end

    it 'has the correct base url' do
      expect(client.connection.url_prefix.to_s).to eq(described_class.const_get(:BASE_URL) + "/#{client.api_version}")
    end

    it 'has the correct server key header' do
      expect(client.connection.headers).to include(described_class::SERVER_KEY_HEADER => client.server_key)
    end

    it 'has the correct adapter' do
      expect(client.connection.adapter).to eq(Faraday::Adapter::NetHttp)
    end

    context 'when debug is enabled' do
      before { VerifyKit.configure { |c| c.debug.enabled = true } }

      it 'logs the request and response' do
        expect(client.connection.builder.handlers).to include(Faraday::Response::Logger)
      end
    end

    context 'when debug is disabled' do
      before { VerifyKit.configure { |c| c.debug.enabled = false } }

      it 'does not log the request and response' do
        expect(client.connection.builder.handlers).not_to include(Faraday::Response::Logger)
      end
    end
  end
end
