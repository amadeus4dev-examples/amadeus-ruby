require 'spec_helper'

RSpec.describe Amadeus::Client::ReferenceData::Locations::Airports do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Client::ReferenceData::Locations::Airports.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { latitude: '123', longitude: '234' }

      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/airports', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/reference-data/locations/airports', {}
      )

      @api.get
    end
  end
end
