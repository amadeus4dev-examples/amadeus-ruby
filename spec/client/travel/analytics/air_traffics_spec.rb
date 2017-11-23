require 'spec_helper'

RSpec.describe Amadeus::Client::Travel::Analytics::AirTraffics do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Client::Travel::Analytics::AirTraffics.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { origin: 'LHR', period: '2017-01' }

      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffics', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffics', {}
      )

      @api.get
    end
  end
end
