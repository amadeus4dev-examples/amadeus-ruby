require 'spec_helper'

RSpec.describe Amadeus::Client::AccessToken do
  before do
    @client = double('Amadeus::Client')
    allow(@client).to receive(:logger).and_return(Logger.new(STDOUT))
    allow(@client).to receive(:api_key).and_return('123')
    allow(@client).to receive(:api_secret).and_return('234')

    @access_token = Amadeus::Client::AccessToken.new(@client)

    @response = double('Amadeus::Response')
    allow(@response).to receive(:data).and_return(
      'access_token' => 'abc',
      'expires_in' => 1799
    )
  end

  describe '.bearer_token' do
    it 'should make a new API call if no token has been loaded before' do
      expect(@client).to receive(:post).with('/v1/security/oauth2/token', {
                                               grant_type: 'client_credentials',
                                               client_id: '123',
                                               client_secret: '234'
                                             }, nil)
                                       .and_return(@response)

      expect(@access_token.bearer_token).to eq('Bearer abc')
    end

    it 'should return a cached token if it still valid' do
      expect(@client).to receive(:post).once
        .with('/v1/security/oauth2/token', {
                grant_type: 'client_credentials',
                client_id: '123',
                client_secret: '234'
              }, nil).and_return(@response)

      expect(@access_token.bearer_token).to eq('Bearer abc')
      expect(@access_token.bearer_token).to eq('Bearer abc')
    end

    it 'should make a new API call the old token expired' do
      expect(@client).to receive(:post).twice
        .with('/v1/security/oauth2/token', {
                grant_type: 'client_credentials',
                client_id: '123',
                client_secret: '234'
              }, nil).and_return(@response)

      expect(@access_token.bearer_token).to eq('Bearer abc')
      @access_token.expires_at = Time.now
      expect(@access_token.bearer_token).to eq('Bearer abc')
    end
  end
end
