# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Client::Pagination do
  before do
    @client = Amadeus::Client.new(client_id: '123', client_secret: '234')
    @http_response = double('Response')
    allow(@http_response).to receive(:code).and_return(200)
    allow(@http_response).to receive(:[]).with('Content-Type')
                                         .and_return('application/json')

    @request = double('Amadeus::Request')
  end

  %w[next previous last first].each do |key|
    describe "Client.#{key}" do
      it "should create a new request with the #{key} page and call it" do
        allow(@http_response).to receive(:body).and_return(
          "{\"meta\":{\"links\":{\"#{key}\":\"http://foo.com?page=1\"}}}"
        )
        @response = Amadeus::Response.new(@http_response, @request)
                                     .parse(@client)
        allow(@request).to receive(:params).and_return({})
        allow(@request).to receive(:verb).and_return(:GET)
        allow(@request).to receive(:path).and_return('/foo/bar')

        expect(@client).to receive(:request).with(:GET, '/foo/bar',
                                                  'page' => { 'offset' => 1 })
        @client.send(key.to_sym, @response)
      end

      it 'should return nil if the page was not found' do
        allow(@http_response).to receive(:body).and_return('{}')
        @response = Amadeus::Response.new(@http_response, @request)
        expect(@client.send(key.to_sym, @response)).to be_nil
      end
    end
  end
end
