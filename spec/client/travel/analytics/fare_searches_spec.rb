require 'spec_helper'

RSpec.describe Amadeus::Client::Travel::Analytics::FareSearches do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Client::Travel::Analytics::FareSearches.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { origin: 'LHR', period: '2017-01' }

      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/fare-searches', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/fare-searches', {}
      )

      @api.get
    end
  end
end
