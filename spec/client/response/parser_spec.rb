# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Response::Parser do
  describe 'Amadeus::Response.parse_response' do
    before do
      @http = double('HTTPResponse')
      allow(@http).to receive(:[]).and_return('application/json')
      allow(@http).to receive(:body).and_return('{}')

      @logger = double('Logger')

      @client = double('Amadeus::Client')
      allow(@client).to receive(:logger).and_return(@logger)
      allow(@client).to receive(:log_level).and_return('silent')

      @request = double('Amadeus::Request')
      allow(@request).to receive(:client).and_return(@client)
    end

    describe 'with a JSON content type' do
      it 'should parse the body' do
        expect(@http).to receive(:[]).with('Content-Type')
                                     .and_return('application/json')

        expect(@http).to receive(:body).at_least(1).times
                                       .and_return('{ "data" : { "a" : 1 } }')

        expect(@http).to receive(:code).at_least(1).times.and_return('200')

        response = Amadeus::Response.new(@http, @request).parse(@client)
        expect(response.data).to eq('a' => 1)
      end

      it 'should parse the body if the content type was vnd.amadeus+json' do
        expect(@http).to(
          receive(:[]).with('Content-Type')
                      .and_return('application/vnd.amadeus+json')
        )

        expect(@http).to receive(:body).at_least(1).times
                                       .and_return('{ "data" : { "a" : 1 } }')

        expect(@http).to receive(:code).at_least(1).times.and_return('200')

        response = Amadeus::Response.new(@http, @request).parse(@client)
        expect(response.data).to eq('a' => 1)
      end

      it 'should raise a ParseError if the body could not be parsed' do
        expect(@http).to(
          receive(:[]).with('Content-Type').and_return('application/json')
        )

        expect(@http).to receive(:body).at_least(1).times.and_return('{')
        expect(@http).to receive(:code).at_least(1).times.and_return('200')

        expect do
          Amadeus::Response.new(@http, @request)
                           .parse(@client)
                           .detect_error(@client)
        end.to(
          raise_error(Amadeus::ParserError)
        )
      end
    end

    describe 'with a 2XX response' do
      it 'should return a Response object' do
        expect(@http).to(
          receive(:[]).with('Content-Type').and_return('application/json')
        )

        expect(@http).to receive(:body).at_least(1).times.and_return('{}')
        expect(@http).to receive(:code).at_least(1).times.and_return('200')

        response = Amadeus::Response.new(@http, @request).parse(@client)
        expect(response).to be_instance_of(Amadeus::Response)
      end
    end

    describe 'with a 400 response' do
      it 'should raise an error with a Response object' do
        @http = Net::HTTPBadRequest.new(1, 400, '')

        expect(@http).to(
          receive(:[]).with('Content-Type').and_return('application/json')
        )

        expect(@http).to receive(:body).at_least(1).times.and_return('{}')

        expect do
          Amadeus::Response.new(@http, @request)
                           .parse(@client)
                           .detect_error(@client)
        end.to(
          raise_error(Amadeus::ClientError)
        )
      end
    end

    describe 'with a 403 response' do
      it 'should raise an error with a Response object' do
        @http = Net::HTTPForbidden.new(1, 403, '')

        expect(@http).to(
          receive(:[]).with('Content-Type').and_return('application/json')
        )

        expect(@http).to receive(:body).at_least(1).times.and_return('{}')

        expect do
          Amadeus::Response.new(@http, @request)
                           .parse(@client)
                           .detect_error(@client)
        end.to(
          raise_error(Amadeus::ClientError)
        )
      end
    end

    describe 'with a 404 response' do
      it 'should raise an error with a Response object' do
        @http = Net::HTTPNotFound.new(1, 404, '')

        expect(@http).to(
          receive(:[]).with('Content-Type').and_return('application/json')
        )

        expect(@http).to receive(:body).at_least(1).times.and_return('{}')

        expect do
          Amadeus::Response.new(@http, @request)
                           .parse(@client)
                           .detect_error(@client)
        end.to(
          raise_error(Amadeus::NotFoundError)
        )
      end
    end

    describe 'with a 500 response' do
      it 'should raise an error with a Response object' do
        @http = Net::HTTPServerError.new(1, 500, '')

        expect(@http).to(
          receive(:[]).with('Content-Type').and_return('application/json')
        )

        expect(@http).to receive(:body).at_least(1).times.and_return('{}')

        expect do
          Amadeus::Response.new(@http, @request)
                           .parse(@client)
                           .detect_error(@client)
        end.to(
          raise_error(Amadeus::ServerError)
        )
      end
    end
  end
end
