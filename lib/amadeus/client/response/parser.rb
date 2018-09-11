# frozen_string_literal: true

require 'json'

module Amadeus
  class Response
    # Helper methods to for the {Amadeus::Response} object to help it
    # parse the response received from the API
    # @!visibility private
    module Parser
      # Tries to parse the HTTPResponse, parsing the JSON and raising the
      # appropriate errors
      def detect_error(client)
        raise_error(Amadeus::ServerError, client) if @status_code >= 500
        raise_error(Amadeus::AuthenticationError, client) if @status_code == 401
        raise_error(Amadeus::NotFoundError, client) if @status_code == 404
        raise_error(Amadeus::ClientError, client) if @status_code >= 400
        raise_error(Amadeus::ParserError, client) unless @parsed
      end

      private

      # Tries to parse the received data from raw string to parsed data and into
      # a data object
      def parse_data(client)
        @parsed = false
        @result = parse_json(http_response, client)
        @data = @result.fetch('data', nil) if @result
      end

      # Logs and raises the error
      def raise_error(error_class, client)
        error = error_class.new(self)
        error.log(client)
        raise error
      end

      # Tries to parse the JSON, if there is any
      def parse_json(http_response, client)
        @body = http_response.body
        return unless json?(http_response)

        json = JSON.parse(@body)
        @parsed = true
        json
      rescue JSON::ParserError
        raise_error(Amadeus::ParserError, client)
      end

      def parse_status_code
        @status_code = http_response.code
        @status_code = @status_code.to_i if @status_code
      end

      # checks if the HTTPResponse included JSON
      def json?(http_response)
        json_header?(http_response) && body?(http_response)
      end

      # checks if the HTTPResponse has a non-empty body
      def body?(http_response)
        http_response.body && !http_response.body.empty?
      end

      # checks if the HTTPResponse has a JSON header
      def json_header?(http_response)
        content_type = http_response['Content-Type']
        content_types = ['application/json', 'application/vnd.amadeus+json']
        content_type && content_types.include?(content_type.split(';').first)
      end
    end
  end
end
