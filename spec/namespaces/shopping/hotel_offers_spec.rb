# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::HotelOffers do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::HotelOffers.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { cityCode: 'LON' }

      expect(@client).to receive(:get).with(
        '/v2/shopping/hotel-offers', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v2/shopping/hotel-offers', {}
      )

      @api.get
    end
  end
end
