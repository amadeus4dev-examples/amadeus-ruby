module Amadeus
  module Exceptions
    class Base < Exception
      attr_accessor :response

      def initialize(response)
        @response = response
        super(error_message)
      end
    end

    class HTTPNotFound < Base
      def error_message
        response.http_response.uri
      end
    end

    class HTTPUnauthorized < Base
      def error_message
        response.data['errors']
      end
    end

    class HTTPBadRequest < Base
      def error_message
        response.data['errors']
      end
    end

    class ParserError < Base
    end
  end
end
