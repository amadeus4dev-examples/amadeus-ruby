# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::ReferenceData::Locations::PointOfInterest do
  before do
    @client = double('Amadeus::Client')
    @location_id = '9CB40CB5D0'
    @api = Amadeus::Namespaces::ReferenceData::Locations::PointOfInterest.new(
      @client, @location_id
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = {}

      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/pois/9CB40CB5D0', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/pois/9CB40CB5D0', {}
      )

      @api.get
    end
  end
end
