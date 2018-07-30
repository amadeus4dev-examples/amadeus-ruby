# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::ReferenceData::Airlines do
  before do
    @client = double('Amadeus::Client')
    @airline_id = 'U2'
    @api = Amadeus::Namespaces::ReferenceData::Airlines.new(
      @client, @airline_id
    )
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { foo: :bar }

      expect(@client).to receive(:get).with(
        '/v1/reference-data/airlines', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v1/reference-data/airlines', {}
      )

      @api.get
    end
  end
end
