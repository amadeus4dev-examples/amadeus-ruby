# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::FlightDates do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::FlightDates.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { origin: 'LHR', destination: 'PAR' }

      expect(@client).to receive(:get).with(
        '/v1/shopping/flight-dates', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/shopping/flight-dates', {}
      )

      @api.get
    end
  end
end
