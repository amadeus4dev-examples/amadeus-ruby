module Amadeus
  # A custom namespace for all Amadeus exceptions
  # An abstract exception to provide shared functionality between all
  # Amadeus exceptions
  #
  # @abstract
  class ResponseError < RuntimeError
    # The response object containing the raw HTTP response and the request
    # used to make the API call.
    #
    # @return [Amadeus::Response]
    attr_reader :response

    # A unique code for this type of error. Options include
    # +NetworkError+, +ParserError+, +ServerError+,
    # +AuthenticationError+, +NotFoundError+ and +UnknownError+.
    #
    # @return [String]
    attr_reader :code

    # A short description of the error, extracted from the returned JSON, if
    # any is present
    #
    # @return [Hash]
    attr_reader :description

    # Initializes an error by storing the {Amadeus::Response} object
    # that raised this error. The continues to determien the custom
    # error message
    #
    # @param [Amadeus::Response] response
    # @!visibility private
    def initialize(response)
      @response = response
      super(error_message)
    end
  end

  module Errors
    # A 404 error
    class NotFoundError < Amadeus::ResponseError
      # For a 404 we return the URL called
      def error_message
        response.http_response.uri
      end
    end

    # A 401 error
    class AuthenticationError < Amadeus::ResponseError
      # For a 401 we return the error description
      def error_message
        response.result['error_description']
      end
    end

    # A 4XX (non 404) error
    class ClientError < Amadeus::ResponseError
      # For a 400 we return the parsed errors as the message
      # @return [String]
      def error_message
        response.result['errors']
      end

      # Defines the error to throw for a 4XX (non 404 error)
      # @!visibility private
      def self.for(http_response)
        return AuthenticationError if http_response.code == '401'
        ClientError
      end
    end

    # A 5XX error
    class ServerError < Amadeus::ResponseError
      # For a 500 error we return no extra message
      # @return [String]
      def error_message
        response.result['errors'].first['detail']
      rescue NoMethodError, JSON::ParserError
        'Server Error'
      end
    end

    # A network error
    class NetworkError < Amadeus::ResponseError
      # For a network error we return no extra message
      # @return [String]
      def error_message
        response.message
      end
    end

    # A JSON parsing error
    class ParserError < Amadeus::ResponseError
      # For a Parse error we return the raw data
      # @return [String]
      def error_message
        response.http_response.body
      end
    end

    # When we are not sure what error is thrown
    class UnknownError < Amadeus::ResponseError
      # For a Parse error we return the raw data
      # @return [String]
      def error_message
        response.http_response.body
      end
    end
  end
end
