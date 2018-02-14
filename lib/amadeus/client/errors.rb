module Amadeus
  # A custom generic Amadeus error.
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

    # The content of the response that describes the error
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
      @description = determine_description
      super(@description)
      @code = determine_code
    end

    private

    def determine_description
      return nil unless response && response.parsed
      result = response.result
      return result['errors'] if result['errors']
      return result if result['error_description']
    end

    def determine_code
      self.class.to_s.split('::').last
    end
  end

  # The errors that can be thrown by the SDK
  module Errors
    # This error occurs when there is some kind of error in the network
    class NetworkError < Amadeus::ResponseError; end
    # This error occurs when the response type was JSOn but could not be parsed
    class ParserError < Amadeus::ResponseError; end
    # This error occurs when there is an error on the server
    class ServerError < Amadeus::ResponseError; end
    # This error occurs when the client did not provide the right parameters
    class ClientError < Amadeus::ResponseError; end
    # This error occurs when the client did not provide the right credentials
    class AuthenticationError < Amadeus::ResponseError; end
    # This error occurs when the path could not be found
    class NotFoundError < Amadeus::ResponseError; end
  end
end
