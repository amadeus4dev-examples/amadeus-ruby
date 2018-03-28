# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::Hotel do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping.new(@client)
  end

  describe '.hotels(:hotel_id).hotel_offers.get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotels/123/hotel-offers', {}
      ).once

      @api.hotel(123).hotel_offers.get
    end
  end

  describe '.hotel(:hotel_id).offers(:offer_id).get' do
    it 'should make the right API call' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/hotels/123/offers/345', {}
      ).once

      @api.hotel(123).offer(345).get
    end
  end
end
