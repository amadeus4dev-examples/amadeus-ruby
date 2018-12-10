# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel::Analytics::AirTraffic::Booked do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Travel::Analytics::AirTraffic::Booked.new(
      @client
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { originCityCode: 'LHR', period: '2017-01' }

      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/booked', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/booked', {}
      )

      @api.get
    end
  end
end
