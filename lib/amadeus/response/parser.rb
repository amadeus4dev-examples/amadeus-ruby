require 'json'

module Amadeus
  class Response
    # Helper methods to for the {Amadeus::Response} object to help it
    # parse the response received from the API
    module Parser
      private

      def parse_response
        @data = parse_json(http_response)

        case http_response
        when Net::HTTPNotFound
          raise Amadeus::Exceptions::HTTPNotFound, self
        when Net::HTTPClientError
          raise Amadeus::Exceptions::HTTPClientError, self
        when Net::HTTPServerError
          raise Amadeus::Exceptions::HTTPServerError, self
        end
      end

      def parse_json(http_response)
        return unless json?(http_response)
        JSON.parse(http_response.body)
      rescue JSON::ParserError
        raise Amadeus::Exceptions::ParserError, self
      end

      def json?(http_response)
        json_header?(http_response) && body?(http_response)
      end

      def body?(http_response)
        http_response.body && !http_response.body.empty?
      end

      def json_header?(http_response)
        content_type = http_response['Content-Type']
        content_types = ['application/json', 'application/vnd.amadeus+json']
        content_type && content_types.include?(content_type.split(';').first)
      end
    end
  end
end
