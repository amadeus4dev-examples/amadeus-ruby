# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::ResponseError do
  describe '.to_s' do
    it 'should determine default value if no response is present' do
      error = Amadeus::NetworkError.new(nil)
      expect(error.to_s).to eq('[---]')
    end

    it 'should determine default value if response has no status code' do
      http_response = double('HTTPResponse')
      response = Amadeus::Response.new(http_response, nil)
      error = Amadeus::NetworkError.new(response)
      expect(error.to_s).to eq('[---]')
    end

    it 'should return just the status code of no errors are in the response' do
      http_response = double('HTTPResponse')
      allow(http_response).to receive(:code).and_return(400)
      allow(http_response).to receive(:body).and_return('{}')
      allow(http_response).to receive(:[]).and_return('application/json')

      response = Amadeus::Response.new(http_response, nil).parse(nil)
      error = Amadeus::ClientError.new(response)
      expect(error.to_s).to eq('[400]')
    end

    it 'should return a multiline response when multipel errors are present' do
      http_response = double('HTTPResponse')
      allow(http_response).to receive(:code).and_return(401)
      allow(http_response).to(
        receive(:body)
          .and_return(%(
            { "errors": [
               {
                 "status":400,
                 "code":32171,
                 "title":"MANDATORY DATA MISSING",
                 "detail":"This field must be filled.",
                 "source":{
                   "parameter":"departureDate"
                 }
               },
               {
                 "status":400,
                 "code":32171,
                 "title":"MANDATORY DATA MISSING",
                 "detail":"This field must be filled.",
                 "source":{
                   "parameter":"origin"
                 }
               },
               {
                 "status":400,
                 "code":32171,
                 "title":"MANDATORY DATA MISSING",
                 "detail":"This field must be filled.",
                 "source":{
                   "parameter":"destination"
                 }
               }
              ]}
          ))
      )
      allow(http_response).to receive(:[]).and_return('application/json')

      response = Amadeus::Response.new(http_response, nil).parse(nil)
      error = Amadeus::NetworkError.new(response)
      expect(error.to_s).to eq(%([401]
[departureDate] This field must be filled.
[origin] This field must be filled.
[destination] This field must be filled.))
    end

    it 'should return a single error if an error_description is present' do
      http_response = double('HTTPResponse')
      allow(http_response).to receive(:code).and_return(200)
      allow(http_response).to(
        receive(:body)
          .and_return('{ "error_description" : "error" }')
      )
      allow(http_response).to receive(:[]).and_return('application/json')

      response = Amadeus::Response.new(http_response, nil).parse(nil)
      error = Amadeus::NetworkError.new(response)
      expect(error.to_s).to eq("[200]\nerror")
    end
  end

  describe '.code' do
    it 'should determine the code off the class name' do
      error = Amadeus::NetworkError.new(nil)
      expect(error.code).to eq('NetworkError')
    end
  end
end
