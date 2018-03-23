# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::ReferenceData::Location do
  before do
    @client = double('Amadeus::Client')
    @location_id = 'ALHR'
    @api = Amadeus::Namespaces::ReferenceData::Location.new(
      @client, @location_id
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { foo: :bar }

      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/ALHR', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/ALHR', {}
      )

      @api.get
    end
  end
end
