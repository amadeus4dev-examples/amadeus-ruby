module Amadeus
  module Exceptions
    # A basic exception that other exceptions inherit to
    # provide the same basic experience
    class Base < RuntimeError
      attr_accessor :response

      def initialize(response)
        @response = response
        super(error_message)
      end
    end

    # A 404 error
    class HTTPNotFound < Base
      def error_message
        response.http_response.uri
      end
    end

    # A 403 error
    class HTTPUnauthorized < Base
      def error_message
        response.data['errors']
      end
    end

    # A 400 error
    class HTTPBadRequest < Base
      def error_message
        response.data['errors']
      end
    end

    # A JSON parsing error
    class ParserError < Base
    end
  end
end
