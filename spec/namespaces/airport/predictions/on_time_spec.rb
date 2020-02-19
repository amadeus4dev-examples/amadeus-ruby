# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Airport::Predictions::OnTime do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Airport::Predictions::OnTime.new(
      @client
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { airportcode: 'JFK', date: '2020-09-01' }

      expect(@client).to receive(:get).with(
        '/v1/airport/predictions/on-time', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/airport/predictions/on-time', {}
      )

      @api.get
    end
  end
end
