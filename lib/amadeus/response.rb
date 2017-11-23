require 'amadeus/response/parser'

module Amadeus
  # A wrapper for a HTTPResponse object. Parses the body if the
  # response was JSON.
  class Response
    include Parser

    # The actual HTTPResponse object returned from the API
    # @return [Net::HTTPResponse]
    attr_reader :http_response
    # The parsed JSON data - if the body contained JSON
    # @return [Hash]
    attr_reader :data

    # Initialize the Response object with the client logger and the
    # HTTPResponse object to parse
    #
    # @param [Net:::HTTPResponse] http_response the HTTPResponse returned
    # @param [Logger] logger the logger used to debug the parsed data
    #
    def initialize(http_response, logger)
      @http_response = http_response
      @logger = logger
      log_response
      parse_response
    end

    private

    def log_response
      @logger.debug('Amadeus::Response') do
        # :nocov:
        "#{http_response.class.name}\n#{http_response.body}"
        # :nocov:
      end
    end
  end
end
