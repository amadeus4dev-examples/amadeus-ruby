require 'spec_helper'

RSpec.describe Amadeus::Response do
  describe '.initialize' do
    before do
      @http_response = double('HTTPResponse')
      allow(@http_response).to receive(:[])
      allow(@http_response).to receive(:body).and_return('{}')

      @logger = double('logger')
    end

    it 'should take a http response object and logger' do
      allow(@logger).to receive(:debug)

      response = Amadeus::Response.new(@http_response, @logger)
      expect(response.http_response).to eq(@http_response)
    end

    it 'should log the response' do
      expect(@logger).to receive(:debug).with('Amadeus::Response')
      allow(@logger).to receive(:debug).with('Amadeus::Response::Parser')
      Amadeus::Response.new(@http_response, @logger)
    end
  end
end
