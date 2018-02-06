module Amadeus
  # A custom namespace for all Amadeus exceptions
  module Exceptions
    # An abstract exception to provide shared functionality between all
    # Amadeus exceptions
    #
    # @abstract
    class Base < RuntimeError
      # The response object (if any) that raised this error
      #
      # @return [Amadeus::Response]
      attr_reader :response

      # Initializes an error by storing the {Amadeus::Response} object
      # that raised this error. The continues to determien the custom
      # error message
      #
      # @param [Amadeus::Response] response
      def initialize(response)
        @response = response
        super(error_message)
      end
    end

    # A 404 error
    class HTTPNotFoundError < Base
      # For a 404 we return the URL called
      def error_message
        response.http_response.uri
      end
    end

    # A 401 error
    class UnauthorizedError < Base
      # For a 401 we return the error description
      def error_message
        response.json['error_description']
      end
    end

    # A 4XX (non 404) error
    class HTTPClientError < Base
      # For a 400 we return the parsed errors as the message
      # @return [String]
      def error_message
        response.json['errors']
      end

      # Defines the error to throw for a 4XX (non 404 error)
      def self.for(http_response)
        return UnauthorizedError if http_response.code == '401'
        HTTPClientError
      end
    end

    # A 5XX error
    class HTTPServerError < Base
      # For a 500 error we return no extra message
      # @return [String]
      def error_message
        response.json['errors'].first['detail']
      rescue NoMethodError, JSON::ParserError
        'Server Error'
      end
    end

    # A network error
    class NetworkError < Base
      # For a network error we return no extra message
      # @return [String]
      def error_message
        response.message
      end
    end

    # A JSON parsing error
    class ParserError < Base
      # For a Parse error we return the raw data
      # @return [String]
      def error_message
        response.http_response.body
      end
    end
  end
end
