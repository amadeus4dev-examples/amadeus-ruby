# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel::Predictions::FlightDelay do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Travel::Predictions::FlightDelay.new(
      @client
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = {  originLocationCode: 'BRU',
                  destinationLocationCode: 'FRA',
                  departureDate: '2020-01-14',
                  departureTime: '11:05:00',
                  arrivalDate: '2020-01-14',
                  arrivalTime: '12:10:00',
                  aircraftCode: '32A',
                  carrierCode: 'LH',
                  flightNumber: '1009',
                  duration: 'PT1H05M' }

      expect(@client).to receive(:get).with(
        '/v1/travel/predictions/flight-delay', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/predictions/flight-delay', {}
      )

      @api.get
    end
  end
end
