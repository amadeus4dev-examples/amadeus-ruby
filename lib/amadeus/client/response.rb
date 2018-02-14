require 'amadeus/client/response/parser'

module Amadeus
  # The response object returned for every API call.
  class Response
    include Parser

    # The actual HTTPResponse object returned from the Net::HTTP request
    # @return [Net::HTTPResponse]
    attr_reader :http_response

    # The actual Amadeus::Request object used to make this API call
    # @return [Amadeus::Request]
    attr_reader :request

    # The parsed JSON received from the API, if the result was JSON
    # @return [Hash]
    attr_reader :result

    # The data extracted from the JSON data - if the body contained JSON
    # @return [Hash]
    attr_reader :data

    # The raw body received from the API
    # @return [String]
    attr_reader :body

    # Wether the raw body has been parsed into JSON
    # @return [Boolean]
    attr_reader :parsed

    # The HTTP status code for the response, if any
    # @return [Number]
    attr_reader :status_code

    # Initialize the Response object with the
    # HTTPResponse object to parse, the client that made the request
    # and the original request made
    #
    # @param [Net:::HTTPResponse] http_response the HTTPResponse returned
    # @param [Amadeus::Request] request the request object used to
    #   make the API call
    # @!visibility private
    def initialize(http_response, request)
      @http_response = http_response
      @request = request
      parse_response
    end
  end
end
