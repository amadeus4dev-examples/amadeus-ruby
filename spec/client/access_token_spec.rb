# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Client::AccessToken do
  before do
    logger = double('Logger')
    allow(logger).to receive(:debug)

    @client = double('Amadeus::Client')
    allow(@client).to receive(:logger).and_return(logger)
    allow(@client).to receive(:client_id).and_return('123')
    allow(@client).to receive(:client_secret).and_return('234')

    @access_token = Amadeus::Client::AccessToken.new(@client)

    @response = double('Amadeus::Response')
    allow(@response).to receive(:result).and_return(
      'access_token' => 'abc',
      'expires_in' => 1799
    )
  end

  describe '.bearer_token' do
    it 'should make a new API call if no token has been loaded before' do
      expect(@client).to(
        receive(:unauthenticated_request).with(:POST,
                                               '/v1/security/oauth2/token',
                                               grant_type: 'client_credentials',
                                               client_id: '123',
                                               client_secret: '234')
        .and_return(@response)
      )

      expect(@access_token.bearer_token).to eq('Bearer abc')
    end

    it 'should return a cached token if it still valid' do
      expect(@client).to receive(:unauthenticated_request)
        .once
        .with(:POST,
              '/v1/security/oauth2/token',
              grant_type: 'client_credentials',
              client_id: '123',
              client_secret: '234').and_return(@response)

      expect(@access_token.bearer_token).to eq('Bearer abc')
      expect(@access_token.bearer_token).to eq('Bearer abc')
    end

    it 'should make a new API call the old token expired' do
      expect(@client).to receive(:unauthenticated_request)
        .twice
        .with(:POST,
              '/v1/security/oauth2/token',
              grant_type: 'client_credentials',
              client_id: '123',
              client_secret: '234').and_return(@response)

      expect(@access_token.bearer_token).to eq('Bearer abc')
      @access_token.instance_variable_set(:@expires_at, Time.now)
      expect(@access_token.bearer_token).to eq('Bearer abc')
    end
  end
end
