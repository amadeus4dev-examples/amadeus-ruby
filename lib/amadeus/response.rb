require 'amadeus/response/parser'

module Amadeus
  # A wrapper for a HTTP response. Parses the data into a
  # JSON object if the response was JSON
  class Response
    include Parser

    # The actual HTTPResonse object for inspection
    attr_accessor :http_response
    # The parsed JSON data (if any)
    attr_accessor :data

    # Initialize the Response object with the client logger and the
    # HTTPResponse object to parse
    def initialize(http_response, logger)
      @http_response = http_response
      @logger = logger
      log_response
      parse_response
    end

    private

    def log_response
      @logger.debug('Amadeus::Response') do
        "#{http_response.class.name}\n#{http_response.body}"
      end
    end
  end
end
