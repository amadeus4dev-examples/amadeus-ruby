require 'json'

module Amadeus
  class Response
    # Helper methods to for the {Amadeus::Response} object to help it
    # parse the response received from the API
    # @!visibility private
    module Parser
      private

      # Tries to parse the received data from raw string to parsed data and into
      # a data object
      def parse_data
        @parsed = false
        @result = parse_json(http_response)
        @data = @result.fetch('data', nil) if @result
      end

      # Tries to parse the HTTPResponse, parsing the JSON and raising the
      # appropriate errors
      def parse_response
        raise(Amadeus::Errors::ServerError, self) if @status_code >= 500
        raise(Amadeus::Errors::AuthenticationError, self) if @status_code == 401
        raise(Amadeus::Errors::NotFoundError, self) if @status_code == 404
        raise(Amadeus::Errors::ClientError, self) if @status_code >= 400
        raise(Amadeus::Errors::ParserError, self) unless @parsed
      end

      # Tries to parse the JSON, if there is any
      def parse_json(http_response)
        @body = http_response.body
        return unless json?(http_response)
        json = JSON.parse(@body)
        @parsed = true
        return json
      rescue JSON::ParserError
        raise Amadeus::Errors::ParserError, self
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
