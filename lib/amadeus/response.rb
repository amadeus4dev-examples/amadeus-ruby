require 'amadeus/response/parser'
require 'amadeus/response/pagination'

module Amadeus
  # A wrapper for a HTTPResponse object. Parses the body if the
  # response was JSON.
  class Response
    include Parser
    include Pagination

    # The actual HTTPResponse object returned from the API
    # @return [Net::HTTPResponse]
    attr_reader :http_response

    # The actual Amadeus::Request object used to make the API call
    # @return [Amadeus::Request]
    attr_reader :request

    # The parsed JSON data - if the body contained JSON
    # @return [Hash]
    attr_reader :json

    # The data extracted from the JSON data - if the body contained JSON
    # @return [Hash]
    attr_reader :data

    # Initialize the Response object with the
    # HTTPResponse object to parse, the client that made the request
    # and the original request made
    #
    # @param [Net:::HTTPResponse] http_response the HTTPResponse returned
    # @param [Amadeus::Request] request the request object used to make the API
    #   call
    #
    def initialize(http_response, request)
      @http_response = http_response
      @request = request

      log_response
      parse_response
    end

    private

    def log_response
      @request.client.logger.debug('Amadeus::Response') do
        # :nocov:
        "#{http_response.class.name}\n#{http_response.body}"
        # :nocov:
      end
    end
  end
end
