# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::ReferenceData::Locations do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::ReferenceData::Locations.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { keyword: 'lon', subType: Amadeus::Location::ANY }

      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations', {}
      )

      @api.get
    end
  end
end
