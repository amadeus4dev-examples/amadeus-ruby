require 'spec_helper'

RSpec.describe Amadeus::Client::ReferenceData::Urls::CheckinLinks do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Client::ReferenceData::Urls::CheckinLinks.new(@client)
  end

  describe '.get' do
    it 'should call client.get with the right params' do
      params = { airline: '1X' }

      expect(@client).to receive(:get).with(
        '/v2/reference-data/urls/checkin-links', params
      )

      @api.get(params)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:get).with(
        '/v2/reference-data/urls/checkin-links', {}
      )

      @api.get
    end
  end
end
