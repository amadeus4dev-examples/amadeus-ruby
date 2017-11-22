module Amadeus
  # A wrapper around all exceptions
  module Exceptions
    # A basic exception that other exceptions inherit to
    # provide the same basic experience
    class Base < RuntimeError
      # The Amadeus::Response object (if any) that raised this error
      attr_accessor :response

      # Initializes an error, stores the HTTPResponse object,
      # abd determines the error message
      def initialize(response)
        @response = response
        super(error_message)
      end
    end

    # A 404 error
    class HTTPNotFound < Base
      # For a 404 we return the URL called
      def error_message
        response.http_response.uri
      end
    end

    # A 403 error
    class HTTPUnauthorized < Base
      # For a 403 we return the parsed errors as the message
      def error_message
        response.data['errors']
      end
    end

    # A 400 error
    class HTTPBadRequest < Base
      # For a 400 we return the parsed errors as the message
      def error_message
        response.data['errors']
      end
    end

    # A JSON parsing error
    class ParserError < Base; end
  end
end
