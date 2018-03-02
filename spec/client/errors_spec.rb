# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::ResponseError do
  describe '.description' do
    it 'should determine no description if no response is present' do
      error = Amadeus::NetworkError.new(nil)
      expect(error.description).to be_nil
    end

    it 'should determine no description if no data is present' do
      http_response = double('HTTPResponse')
      allow(http_response).to receive(:code).and_return(200)
      allow(http_response).to receive(:body).and_return('{}')
      allow(http_response).to receive(:[]).and_return('application/json')

      response = Amadeus::Response.new(http_response, nil)
      error = Amadeus::NetworkError.new(response)
      expect(error.description).to be_nil
    end

    it 'should determine the description if errors are present' do
      http_response = double('HTTPResponse')
      allow(http_response).to receive(:code).and_return(200)
      allow(http_response).to(
        receive(:body)
          .and_return('{ "errors" : [ { "detail" : "error" }] }')
      )
      allow(http_response).to receive(:[]).and_return('application/json')

      response = Amadeus::Response.new(http_response, nil).parse({})
      error = Amadeus::NetworkError.new(response)
      expect(error.description).to eq([{ 'detail' => 'error' }])
    end

    it 'should determine the description if an error_description is present' do
      http_response = double('HTTPResponse')
      allow(http_response).to receive(:code).and_return(200)
      allow(http_response).to(
        receive(:body)
          .and_return('{ "error_description" : "error" }')
      )
      allow(http_response).to receive(:[]).and_return('application/json')

      response = Amadeus::Response.new(http_response, nil).parse({})
      error = Amadeus::NetworkError.new(response)
      expect(error.description).to eq('error_description' => 'error')
    end
  end

  describe '.code' do
    it 'should determine the code off the class name' do
      error = Amadeus::NetworkError.new(nil)
      expect(error.code).to eq('NetworkError')
    end
  end
end
