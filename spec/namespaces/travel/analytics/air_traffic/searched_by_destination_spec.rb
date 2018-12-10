# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel::Analytics::AirTraffic::SearchedByDestination do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Travel::Analytics::AirTraffic::SearchedByDestination.new(
      @client
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = {
        originCityCode: 'MAD',
        destinationCityCode: 'NYC',
        searchPeriod: '2017-08',
        marketCountryCode: 'ES'
      }

      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/searched/by-destination', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/searched/by-destination', {}
      )

      @api.get
    end
  end
end
