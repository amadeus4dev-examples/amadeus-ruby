# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { latitude: '123', longitude: '234' }

      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/pois', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/pois', {}
      )

      @api.get
    end
  end
end
