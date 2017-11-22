require 'json'

module Amadeus
  class Response
    module Parser
      def parse_response
        logger.debug('Amadeus::Response::Parser') { http_response.class.name }

        @data = parse_json(http_response)

        case http_response
        when Net::HTTPSuccess
        when Net::HTTPNotFound
          raise Amadeus::Exceptions::HTTPNotFound.new(self)
        when Net::HTTPUnauthorized
          raise Amadeus::Exceptions::HTTPUnauthorized.new(self)
        when Net::HTTPBadRequest
          raise Amadeus::Exceptions::HTTPBadRequest.new(self)
        end
      end

      def parse_json(http_response)
        return unless is_json?(http_response)
        logger.debug('Amadeus::Response::Parser') { "Parsing JSON" }
        logger.debug('Amadeus::Response::Parser') { http_response.body }
        JSON.parse(http_response.body)
      rescue JSON::ParserError
        raise Amadeus::Exceptions::ParserError.new(self)
      end

      def is_json?(http_response)
        content_type = http_response['Content-Type']
        allowed_content_types = ['application/json', 'application/vnd.amadeus+json']
        json_header = content_type &&
                      allowed_content_types.include?(content_type.split(';').first)


        has_body = http_response.body && http_response.body.length > 0
        json_header && has_body
      end
    end
  end
end
