require 'spec_helper'

RSpec.describe Amadeus::Client::Request do
  before do
    @client = Amadeus::Client.new(
      client_id: '123',
      client_secret: '345'
    )
  end

  describe 'User Agent' do
    it 'should set a custom user agent' do
      request = @client.send(:request_for, :GET, '/foo/bar', {}, nil)
      expect(request['User-Agent']).to(
        eq("amadeus-ruby/#{Amadeus::VERSION} ruby/#{RUBY_VERSION}")
      )
    end

    it 'should allow for adding a custom ' do
      @client = Amadeus::Client.new(
        client_id: 'abc123',
        client_secret: 'def345',
        custom_app_id: 'test',
        custom_app_version: '3.0'
      )

      request = @client.send(:request_for, :GET, '/foo/bar', {}, nil)
      expect(request['User-Agent']).to(
        eq("amadeus-ruby/#{Amadeus::VERSION} ruby/#{RUBY_VERSION} test/3.0")
      )
    end
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

    # it 'should be able to make and parse a POST request with params' do
    #   begin
    #     @client.post('/v1/security/oauth2/token', @params)
    #   rescue Amadeus::Exceptions::HTTPClientError => error
    #     response = error.response
    #   end
    #
    #   expect(response.data['error']).to eq('invalid_client')
    # end

    it 'should be able to make and parse a POST request without access token' do
      response = @client.post('/v1/security/oauth2/token', @params, nil)

      expect(response.data['access_token']).to(
        eq('ySBMXEC2ac0pEM8gFiU1Vc8B1F8m')
      )
    end
  end
end
