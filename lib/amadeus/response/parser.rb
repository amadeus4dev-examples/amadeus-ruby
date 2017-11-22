require 'json'

module Amadeus
  class Response
    # Helper methods to parse a response
    module Parser
      def parse_response
        logger.debug('Amadeus::Response::Parser') { http_response.class.name }

        @data = parse_json(http_response)

        case http_response
        when Net::HTTPNotFound
          raise Amadeus::Exceptions::HTTPNotFound, self
        when Net::HTTPUnauthorized
          raise Amadeus::Exceptions::HTTPUnauthorized, self
        when Net::HTTPBadRequest
          raise Amadeus::Exceptions::HTTPBadRequest, self
        end
      end

      def parse_json(http_response)
        return unless json?(http_response)
        JSON.parse(http_response.body)
      rescue JSON::ParserError
        raise Amadeus::Exceptions::ParserError, self
      end

      def json?(http_response)
        content_type = http_response['Content-Type']
        allowed_content_types = ['application/json',
                                 'application/vnd.amadeus+json']
        json_header = content_type &&
                      allowed_content_types.include?(
                        content_type.split(';').first
                      )

        has_body = http_response.body && !http_response.body.empty?
        json_header && has_body
      end
    end
  end
end
