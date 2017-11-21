require 'spec_helper'

RSpec.describe Amadeus::Client do
  it 'should exist' do
    expect(Amadeus::Client).not_to be nil
  end

  describe '.initialize' do
    before do
      @valid_params = {
        api_key: '1234',
        api_secret: '4546'
      }
    end

    it 'should create a new client with direct variables' do
      expect(Amadeus::Client.new(@valid_params)).to(
        be_instance_of(Amadeus::Client)
      )
    end

    it 'should create a new client with string-key variables' do
      params = {
        'api_key' => '1234',
        'api_secret' => '4546'
      }

      expect(Amadeus::Client.new(params)).to(
        be_instance_of(Amadeus::Client)
      )
    end

    it 'should create a new client with environment variables' do
      ENV['AMADEUS_API_KEY'] = '123'
      ENV['AMADEUS_API_SECRET'] = '234'

      expect(Amadeus::Client.new).to(
        be_instance_of(Amadeus::Client)
      )

      ENV.delete('AMADEUS_API_KEY')
      ENV.delete('AMADEUS_API_SECRET')
    end

    describe 'with missing parameters' do
      %i[api_key api_secret].each do |key|
        it "should refuse to create a new client without #{key}" do
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
      expect(amadeus.logger.level).to eq(Logger::WARN)
    end

    [:logger, 'logger'].each do |key|
      it "should allow for setting a custom logger (#{key})" do
        logger = Logger.new(STDOUT)
        @valid_params[key] = logger
        amadeus = Amadeus::Client.new(@valid_params)
        expect(amadeus.logger).to equal(logger)
        expect(amadeus.logger.level).to eq(Logger::WARN)
      end
    end

    [:log_level, 'log_level'].each do |key|
      it "should allow for setting a custom log level (#{key})" do
        @valid_params[key] = Logger::FATAL
        amadeus = Amadeus::Client.new(@valid_params)
        expect(amadeus.logger.level).to eq(Logger::FATAL)
      end
    end
  end
end
