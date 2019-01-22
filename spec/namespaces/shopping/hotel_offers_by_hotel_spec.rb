# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::HotelOffersByHotel do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::HotelOffersByHotel.new(@client)
  end

  describe '.hotel_offers_by_hotel.get(:hotel_id)' do
    it 'should make the right API call' do
      params = { hotelId: 'RTPAR001' }

      expect(@client).to receive(:get).with(
        '/v2/shopping/hotel-offers/by-hotel', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v2/shopping/hotel-offers/by-hotel', {}
      )

      @api.get
    end
  end
end
