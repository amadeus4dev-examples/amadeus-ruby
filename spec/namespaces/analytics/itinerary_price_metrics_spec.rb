# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Analytics::ItineraryPriceMetrics do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Analytics::ItineraryPriceMetrics.new(
      @client
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { originIataCode: 'JFK', destinationIataCode: 'AKL', date: '2020-09-01' }

      expect(@client).to receive(:get).with(
        '/v1/analytics/itinerary-price-metrics', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/analytics/itinerary-price-metrics', {}
      )

      @api.get
    end
  end
end
