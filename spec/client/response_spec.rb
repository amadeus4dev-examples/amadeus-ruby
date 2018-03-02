# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Response do
  describe '.initialize' do
    before do
      @http_response = double('HTTPResponse')
      allow(@http_response).to receive(:[]).and_return('application/json')
      allow(@http_response).to receive(:body).and_return('{}')
      allow(@http_response).to receive(:code).at_least(1).times
                                             .and_return('200')

      @client = double('Amadeus::Client')
      allow(@client).to receive(:logger).and_return(@logger)

      @request = double('Amadeus::Request')
      allow(@request).to receive(:client).and_return(@client)
    end

    it 'should take a http response object and request' do
      response = Amadeus::Response.new(@http_response, @request)
      expect(response.http_response).to eq(@http_response)
    end
  end
end
