# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel::Analytics::AirTraffic do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Travel::Analytics::AirTraffic.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { origin: 'LHR', period: '2017-01' }

      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/traveled', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/travel/analytics/air-traffic/traveled', {}
      )

      @api.get
    end
  end
end
