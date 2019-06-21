# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::EReputation::HotelSentiments do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::EReputation::HotelSentiments.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { hotelIds: 'BQMUCJAG,HVSTRAVS' }

      expect(@client).to receive(:get).with(
        '/v2/e-reputation/hotel-sentiments', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v2/e-reputation/hotel-sentiments', {}
      )

      @api.get
    end
  end
end
