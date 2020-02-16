# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel::Predictions::TripPurpose do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Travel::Predictions::TripPurpose.new(
      @client
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { originCityCode: 'LHR', period: '2017-01' }

      expect(@client).to receive(:get).with(
        '/v1/travel/predictions/trip-purpose', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/predictions/trip-purpose', {}
      )

      @api.get
    end
  end
end
