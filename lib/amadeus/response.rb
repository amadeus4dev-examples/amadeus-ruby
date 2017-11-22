require 'amadeus/response/parser'

module Amadeus
  # A wrapper for a HTTP response. Parses the data into a
  # JSON object if the response was JSON
  class Response
    include Parser

    attr_accessor :http_response
    attr_accessor :data
    attr_accessor :logger

    def initialize(http_response, logger)
      @http_response = http_response
      @logger = logger
      log_response
      parse_response
    end

    def log_response
      logger.debug('Amadeus::Response') do
        "#{http_response.class.name}\n#{http_response.body}"
      end
    end
  end
end
