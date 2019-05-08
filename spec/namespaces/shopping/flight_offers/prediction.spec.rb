# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::FlightOffers::Prediction do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::FlightOffers::Prediction.new(@client)
  end

  describe '.post' do
    it 'should call client.post with the right body' do
      body = { foo: :bar }

      expect(@client).to receive(:post).with(
        '/v1/shopping/flight-offers/prediction', body
      )

      @api.post(body)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:post).with(
        '/v1/shopping/flight-offers/prediction', {}
      )

      @api.post
    end
  end
end
