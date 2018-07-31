# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel::Analytics::
  AirTraffic::BusiestPeriod do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Travel::Analytics::AirTraffic::
      BusiestPeriod.new(
        @client
      )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { cityCode: 'MAD', period: '2017',
                 direction: Amadeus::Direction::ARRIVING }

      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/busiest-period', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/busiest-period', {}
      )

      @api.get
    end
  end
end
