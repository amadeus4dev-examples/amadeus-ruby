# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::FlightOffersSearch do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::FlightOffersSearch.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { originLocationCode: 'LHR',
                 destinationLocationCode: 'LAX',
                 departureDate: '202020-12-01' }

      expect(@client).to receive(:get).with(
        '/v2/shopping/flight-offers', params
      )

      @api.get(params)
    end
  end

  describe '.post' do
    it 'should call client.get with the right params' do
      body = { foo: :bar }

      expect(@client).to receive(:post).with(
        '/v2/shopping/flight-offers', body
      )

      @api.post(body)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v2/shopping/flight-offers', {}
      )

      @api.get
    end
  end
end
