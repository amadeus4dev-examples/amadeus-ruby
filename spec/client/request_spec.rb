require 'spec_helper'

RSpec.describe Amadeus::Request do
  describe '.initialize' do
    before do
      @verb = :GET
      @path = '/foo/bar'
      @params = { foo: :bar }
      @client = Amadeus::Client.new(client_id: 123, client_secret: 234)
      @access_token = double('Amadeus::Client::AccessToken')
    end

    it 'should store the params' do
      request = Amadeus::Request.new(@client, @verb, @path, @params,
                                     nil)
      expect(request.client).to equal(@client)
      expect(request.verb).to equal(@verb)
      expect(request.path).to equal(@path)
      expect(request.params).to equal(@params)
      expect(request.bearer_token).to be_nil
      expect(request.user_agent).to eq(
        "amadeus-ruby/#{Amadeus::VERSION} ruby/#{RUBY_VERSION}"
      )
    end

    it 'should set the bearer_token if an access token was provided' do
      expect(@access_token).to receive(:bearer_token).and_return('Bearer 123')

      request = Amadeus::Request.new(@client, @verb, @path,
                                     @params, @access_token)

      expect(request.bearer_token).to eq('Bearer 123')
    end

    it 'should determine a cust user agent if provided' do
      client = Amadeus::Client.new(client_id: 123,
                                   client_secret: 234,
                                   custom_app_id: 'app',
                                   custom_app_version: 1)

      request = Amadeus::Request.new(client, @verb, @path, @params, nil)
      expect(request.user_agent).to eq(
        "amadeus-ruby/#{Amadeus::VERSION} ruby/#{RUBY_VERSION} app/1"
      )
    end
  end

  describe '.merge' do
    before do
      @client = Amadeus::Client.new(client_id: 123, client_secret: 234)
      @request = Amadeus::Request.new(@client, :GET, '/foo/bar',
                                      { a: :b }, nil)
    end

    it 'should return a new Request with the params merged in' do
      request = @request.merge(page: { offset: 2 })
      expect(request).to be_instance_of(Amadeus::Request)
      expect(request.params).to eq(a: :b, page: { offset: 2 })
    end
  end
end
