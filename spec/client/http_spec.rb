# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Client::HTTP do
  before do
    @client = Amadeus::Client.new(
      client_id: 'abc123',
      client_secret: 'def234',
      log_level: 'silent'
    )
  end

  describe 'Amadeus::Client.get', :vcr do
    it 'should be able to make and parse a GET request' do
      begin
        @client.get('/v2/reference-data/urls/checkin-links')
      rescue Amadeus::ClientError => e
        response = e.response
        expect(response.result['errors'].first['status']).to eq(400)
      end
    end

    it 'should be able to  make and parse a GET request with params' do
      params = { airline: '1X' }
      response = @client.get('/v2/reference-data/urls/checkin-links', params)
      expect(response.result['meta']['count']).to eq(2)
    end

    it 'should be able to handle a broken connection' do
      allow(Net::HTTP).to receive(:start).and_raise(SocketError)

      expect { @client.get('/v2/reference-data/urls/checkin-links') }.to(
        raise_error(Amadeus::NetworkError)
      )
    end
  end

  describe 'Amadeus::Client.post', :vcr do
    before do
      @params = {
        grant_type: 'client_credentials',
        client_id: @client.client_id,
        client_secret: @client.client_secret
      }
    end

    # it 'should be able to make and parse a POST request' do
    #   begin
    #     @client.post('/v1/security/oauth2/token')
    #   rescue Amadeus::ClientError => error
    #     response = error.response
    #   end
    #   expect(response.result['error']).to eq('invalid_request')
    # end

    it 'should be able to make and parse a POST request with params' do
      response = @client.unauthenticated_request(
        :POST,
        '/v1/security/oauth2/token',
        @params
      )

      expect(response.result['access_token']).to(
        eq('rghQPhQhoud0gtghohg5HpRisfmN')
      )
    end

    it 'should be able to make and parse a POST request without access token' do
      response = @client.unauthenticated_request(
        :POST,
        '/v1/security/oauth2/token', @params
      )

      expect(response.result['access_token']).to(
        eq('ySBMXEC2ac0pEM8gFiU1Vc8B1F8m')
      )
    end
  end

  describe 'Amadeus::Client.request', :vcr do
    it 'should be able to make and parse any request' do
      begin
        @client.send(:request, :GET, '/v2/reference-data/urls/checkin-links')
      rescue Amadeus::ClientError => e
        response = e.response
        expect(response.result['errors'].first['status']).to eq(400)
      end
    end

    it 'should be able to  make and parse a GET request with params' do
      params = { airline: '1X' }
      response = @client.send(:request, :GET,
                              '/v2/reference-data/urls/checkin-links',
                              params)
      expect(response.result['meta']['count']).to eq(2)
    end

    it 'should be able to make and parse a GET request without access token' do
      begin
        @client.send(
          :unauthenticated_request,
          :GET, '/v2/reference-data/urls/checkin-links', {}
        )
      rescue Amadeus::AuthenticationError => e
        response = e.response
      end
      expect(response.result['errors'].first['status']).to eq('401')
    end

    it 'should be able to handle a broken connection' do
      allow(Net::HTTP).to receive(:start).and_raise(SocketError)

      expect do
        @client.send(:request, :GET, '/v2/reference-data/urls/checkin-links')
      end.to(
        raise_error(Amadeus::NetworkError)
      )
    end
  end
end
