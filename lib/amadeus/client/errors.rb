# frozen_string_literal: true

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

    # Initializes an error by storing the {Amadeus::Response} object
    # that raised this error. The continues to determien the custom
    # error message
    #
    # @param [Amadeus::Response] response
    # @!visibility private
    def initialize(response)
      @response = response
      @code = determine_code

      super(description)
    end

    # PROTECTED

    def log(client)
      # :nocov:
      return unless client.log_level == 'warn'

      client.logger.warn("Amadeus #{@code}") do
        JSON.pretty_generate(@description) if @description
      end
      # :nocov:
    end

    private

    # Determines the description for this error, as used in in the error output
    def description
      description = short_description
      description += long_description
      description
    end

    # Determines the short description, printed after on the same line as the
    # error class name
    def short_description
      if response.respond_to?(:status_code) && response.status_code
        "[#{response.status_code}]"
      else
        '[---]'
      end
    end

    # Determines the longer description, printed after the initial error
    def long_description
      message = ''
      if response&.parsed
        message += error_description if response.result['error_description']
        message += errors_description if response.result['errors']
      end

      message
    end

    # Returns the description of a single error
    def error_description
      message = ''
      message += "\n#{response.result['error']}" if response.result['error']
      message += "\n#{response.result['error_description']}"
      message
    end

    # Returns the description of multiple errors
    def errors_description
      response.result['errors'].map do |error|
        message = "\n"
        if error['source'] && error['source']['parameter']
          message += "[#{error['source']['parameter']}] "
        end
        message + error['detail'] if error['detail']
      end.join
    end

    # Determines the code for this error
    def determine_code
      self.class.to_s.split('::').last
    end
  end

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
