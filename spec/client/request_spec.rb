# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Request do
  describe '.initialize' do
    before do
      @host = 'example.com'
      @verb = :GET
      @path = '/foo/bar'
      @params = { foo: :bar }
      @bearer_token = 'Bearer 123'
      @client_version = '1.2.3'
      @language_version = '2.3.4'
      @app_id = 'amadeus-cli'
      @app_version = '3.4.5'
      @ssl = true
      @port = 443

      @request = Amadeus::Request.new(
        host: @host,
        verb: @verb,
        path: @path,
        params: @params,
        bearer_token: @bearer_token,
        client_version: @client_version,
        language_version: @language_version,
        app_id: @app_id,
        app_version: @app_version,
        ssl: @ssl,
        port: @port
      )
    end

    it 'should store the params' do
      expect(@request.host).to equal(@host)
      expect(@request.verb).to equal(@verb)
      expect(@request.path).to equal(@path)
      expect(@request.params).to equal(@params)
      expect(@request.bearer_token).to equal(@bearer_token)
      expect(@request.client_version).to equal(@client_version)
      expect(@request.language_version).to equal(@language_version)
      expect(@request.app_id).to equal(@app_id)
      expect(@request.app_version).to equal(@app_version)
    end

    describe '.http_request' do
      it 'should return a GET HTTP Request' do
        expect(@request.http_request).to be_kind_of(Net::HTTP::Get)
        expect(@request.http_request.body).to be_nil
        expect(@request.http_request['Content-Type']).to be_nil
        expect(@request.http_request['Authorization']).to eq(@bearer_token)
        expect(@request.http_request['Accept']).to(
          eq('application/json, application/vnd.amadeus+json')
        )
        expect(@request.http_request['User-Agent']).to(
          eq('amadeus-ruby/1.2.3 ruby/2.3.4 amadeus-cli/3.4.5')
        )
      end

      it 'should return a POST HTTP Request' do
        @request = Amadeus::Request.new(
          host: @host,
          verb: :POST,
          path: @path,
          params: @params,
          bearer_token: @bearer_token,
          client_version: @client_version,
          language_version: @language_version,
          app_id: @app_id,
          app_version: @app_version,
          ssl: @ssl,
          port: @port
        )

        expect(@request.http_request).to be_kind_of(Net::HTTP::Post)
        expect(@request.http_request.uri.to_s).to(
          eq('https://example.com/foo/bar')
        )
        expect(@request.http_request.body).to eq(:foo => :bar)
        expect(@request.http_request['Content-Type']).to(
          eq('application/vnd.amadeus+json')
        )
      end

      it 'should allow for setting a different scheme/port' do
        @request = Amadeus::Request.new(
          host: @host,
          verb: :POST,
          path: @path,
          params: @params,
          bearer_token: @bearer_token,
          client_version: @client_version,
          language_version: @language_version,
          app_id: @app_id,
          app_version: @app_version,
          ssl: false,
          port: 5000
        )

        expect(@request.http_request.uri.to_s).to(
          eq('http://example.com:5000/foo/bar')
        )
      end
    end
  end
end
