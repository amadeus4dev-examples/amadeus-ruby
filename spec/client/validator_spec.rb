# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Client::Validator do
  describe 'Amadeus::Client.initialize' do
    before do
      @valid_params = {
        client_id: '1234',
        client_secret: '4546'
      }
    end

    it 'should create a new client with direct variables' do
      expect(Amadeus::Client.new(@valid_params)).to(
        be_instance_of(Amadeus::Client)
      )
    end

    it 'should create a new client with string-key variables' do
      params = {
        'client_id' => '1234',
        'client_secret' => '4546'
      }

      expect(Amadeus::Client.new(params)).to(
        be_instance_of(Amadeus::Client)
      )
    end

    it 'should create a new client with environment variables' do
      ENV['AMADEUS_CLIENT_ID'] = '123'
      ENV['AMADEUS_CLIENT_SECRET'] = '234'

      expect(Amadeus::Client.new).to(
        be_instance_of(Amadeus::Client)
      )

      ENV.delete('AMADEUS_CLIENT_ID')
      ENV.delete('AMADEUS_CLIENT_SECRET')
    end

    describe 'with missing parameters' do
      %i[client_id client_secret].each do |key|
        it "should refuse to create a new client without #{key.inspect}" do
          @valid_params.delete(key)
          expect{ Amadeus::Client.new(@valid_params) }.to(
            raise_error(ArgumentError)
          )
        end
      end
    end

    it 'should by default have a logger' do
      amadeus = Amadeus::Client.new(@valid_params)
      expect(amadeus.logger).to be_instance_of(Logger)
      expect(amadeus.log_level).to eq('silent')
    end

    [:logger, 'logger'].each do |key|
      it "should allow for setting a custom logger (#{key.inspect})" do
        logger = Logger.new(STDOUT)
        logger.level = Logger::WARN
        @valid_params[key] = logger
        amadeus = Amadeus::Client.new(@valid_params)
        expect(amadeus.logger).to equal(logger)
        expect(amadeus.logger.level).to eq(Logger::WARN)
      end

      it "should persist a custom log level (#{key.inspect})" do
        logger = Logger.new(STDOUT)
        logger.level = Logger::DEBUG
        @valid_params[key] = logger
        amadeus = Amadeus::Client.new(@valid_params)
        expect(amadeus.logger).to equal(logger)
        expect(amadeus.logger.level).to eq(Logger::DEBUG)
      end
    end

    it 'should warn when an unrecognized option is passed in' do
      logger = double('Logger')
      allow(logger).to receive(:level=).with(2)
      allow(logger).to receive(:level).and_return(2)
      expect(logger).to receive(:warn).with('Amadeus::Client::Validator')

      @valid_params[:logger] = logger
      @valid_params[:foobar] = 'test'
      Amadeus::Client.new(@valid_params)
    end

    it 'should default to the test host' do
      amadeus = Amadeus::Client.new(@valid_params)
      expect(amadeus.host).to eq(Amadeus::Client::HOSTS[:test])
    end

    it 'should allow for setting a different hostname' do
      @valid_params[:hostname] = 'production'
      amadeus = Amadeus::Client.new(@valid_params)
      expect(amadeus.host).to eq(Amadeus::Client::HOSTS[:production])
    end

    it 'should allow for setting a full different host' do
      host = 'http://foo.bar.com/'
      @valid_params[:host] = host
      amadeus = Amadeus::Client.new(@valid_params)
      expect(amadeus.host).to eq(host)
    end
  end
end
