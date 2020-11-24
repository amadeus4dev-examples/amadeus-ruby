# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Safety::SafetyRatedLocations do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Safety::SafetyRatedLocations.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { latitude: 41.397158, longitude: 2.160873 }

      expect(@client).to receive(:get).with(
        '/v1/safety/safety-rated-locations', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/safety/safety-rated-locations', {}
      )

      @api.get
    end
  end
end
