require 'spec_helper'

RSpec.describe Amadeus::Client::Shopping::Hotels do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Client::Shopping.new(@client)
  end

  describe '.hotels(:hotel_id).hotel_offers.get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotel/123/hotel-offers', {}
      ).once

      @api.hotels(123).hotel_offers.get
    end
  end

  describe '.hotels.get(:hotel_id).hotel_offers.get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotel/123/hotel-offers', {}
      ).once

      @api.hotels.get(id: 123).hotel_offers.get
    end
  end

  describe '.hotels.get(:hotel_id).offers.get(:offer_id)' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotel/123/offers/345', {}
      ).once

      @api.hotels.get(id: 123).offers.get(id: 345)
    end
  end

  describe '.hotels(:hotel_id).offers(:offer_id).get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotel/123/offers/345', {}
      ).once

      @api.hotels(123).offers(345).get
    end
  end

  describe '.hotels.get(:hotel_id).offers(:offer_id).get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotel/123/offers/345', {}
      ).once

      @api.hotels.get(id: 123).offers(345).get
    end
  end

  describe '.hotels.get(:hotel_id).offers(:offer_id).get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotel/123/offers/345', {}
      ).once

      @api.hotels(123).offers.get(id: 345)
    end
  end
end
