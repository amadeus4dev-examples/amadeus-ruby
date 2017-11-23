require 'spec_helper'

RSpec.describe Amadeus::Client::Request do
  before do
    @client = Amadeus::Client.new(
      client_id: 'abc123',
      client_secret: 'def345'
    )
  end

  describe 'Amadeus::Client.get', :vcr do
    it 'should be able to make and parse a GET request' do
      begin
        @client.get('/v2/reference-data/urls/checkin-links')
      rescue Amadeus::Exceptions::HTTPClientError => error
        response = error.response
      end

      expect(response.data['errors'].first['status']).to eq(400)
    end

    it 'should be able to  make and parse a GET request with params' do
      params = { airline: '1X' }
      response = @client.get('/v2/reference-data/urls/checkin-links', params)
      expect(response.data['meta']['count']).to eq(2)
    end

    it 'should be able to make and parse a GET request without access token' do
      begin
        @client.get('/v2/reference-data/urls/checkin-links', {}, false)
      rescue Amadeus::Exceptions::HTTPClientError => error
        response = error.response
      end
      expect(response.data['errors'].first['status']).to eq('401')
    end

    it 'should be able to handle a broken connection' do
      allow(Net::HTTP).to receive(:start).and_raise(SocketError)

      expect { @client.get('/v2/reference-data/urls/checkin-links') }.to(
        raise_error(Amadeus::Exceptions::NetworkError)
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

    it 'should be able to make and parse a POST request' do
      begin
        @client.post('/v1/security/oauth2/token')
      rescue Amadeus::Exceptions::HTTPClientError => error
        response = error.response
      end

      expect(response.data['error']).to eq('invalid_request')
    end

    it 'should be able to make and parse a POST request with params' do
      begin
        @client.post('/v1/security/oauth2/token', @params)
      rescue Amadeus::Exceptions::HTTPClientError => error
        response = error.response
      end

      expect(response.data['error']).to eq('invalid_client')
    end

    it 'should be able to make and parse a POST request without access token' do
      response = @client.post('/v1/security/oauth2/token', @params, nil)
      ap response.data
      expect(response.data['access_token']).to(
        eq('uhYY5m8JidHZwCUUvhyLUecBEQuy')
      )
    end
  end
end
