# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Safety::SafetyRatedLocation do
  before do
    @client = double('Amadeus::Client')
    @location_id = 'Q930402753'
    @api = Amadeus::Namespaces::Safety::SafetyRatedLocation.new(
      @client, @location_id
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = {}

      expect(@client).to receive(:get).with(
        '/v1/safety/safety-rated-locations/Q930402753', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/safety/safety-rated-locations/Q930402753', {}
      )

      @api.get
    end
  end
end
