# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::HotelOffer do
  before do
    @client = double('Amadeus::Client')
    @offer_id = '123'
    @api = Amadeus::Namespaces::Shopping::HotelOffer.new(@client, @offer_id)
  end

  describe '.hotel_offer(:offer_id).get' do
    params = { foo: :bar }

    it 'should call client.get with the right params' do
      expect(@client).to receive(:get).with(
        '/v2/shopping/hotel-offers/123', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v2/shopping/hotel-offers/123', {}
      )

      @api.get
    end
  end
end
