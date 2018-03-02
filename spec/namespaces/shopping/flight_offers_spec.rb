# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::FlightOffers do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::FlightOffers.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { origin: 'LHR',
                 destination: 'LAX',
                 departureDate: '2017-12-01' }

      expect(@client).to receive(:get).with(
        '/v1/shopping/flight-offers', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/flight-offers', {}
      )

      @api.get
    end
  end
end
