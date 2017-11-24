require 'json'

module Amadeus
  class Response
    # Helper methods to for the {Amadeus::Response} object to help it
    # parse the response received from the API
    module Parser
      private

      # Tries to parse the HTTPResponse, parsing the JSON and raising the
      # appropriate errors
      def parse_response
        @json = parse_json(http_response)
        @data = @json.fetch('data', nil) if @json

        case http_response
        when Net::HTTPNotFound
          raise Amadeus::Exceptions::HTTPNotFound, self
        when Net::HTTPClientError
          raise Amadeus::Exceptions::HTTPClientError, self
        when Net::HTTPServerError
          raise Amadeus::Exceptions::HTTPServerError, self
        end
      end

      # Tries to parse the JSON, if there is any
      def parse_json(http_response)
        return unless json?(http_response)
        JSON.parse(http_response.body)
      rescue JSON::ParserError
        raise Amadeus::Exceptions::ParserError, self
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
