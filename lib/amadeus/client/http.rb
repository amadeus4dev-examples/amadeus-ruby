# frozen_string_literal: true

require 'net/https'

require 'amadeus/client/request'

module Amadeus
  class Client
    # A helper module for making generic API calls. It is used by
    # every namespaced API method.
    module HTTP
      # A helper module for making generic GET requests calls. It is used by
      # every namespaced API GET method.
      #
      #   amadeus.reference_data.urls.checkin_links.get(airline: '1X')
      #
      # It can be used to make any generic API call that is automatically
      # authenticated using your API credentials:
      #
      #   amadeus.get('/v2/reference-data/urls/checkin-links', {
      #     airline: '1X'
      #   })
      # @param [String] path the full path for the API call
      # @param [Hash] params the optional GET params to pass to the API
      #
      def get(path, params = {})
        request(:GET, path, params)
      end

      # A helper module for making generic POST requests calls. It is used by
      # every namespaced API POST method.
      #
      #   amadeus.foo.bar.post(some: 'data')
      #
      # It can be used to make any generic API call that is automatically
      # authenticated using your API credentials:
      #
      #   amadeus.post('/v2/foo/bar', { some: 'data' })
      #
      # To make an unauthenticated API call, make sure to pass in an explicit
      # nil for the access token:
      #
      #   amadeus.post('/v2/foo/bar', { some: 'data' }, nil)
      #
      # @param [String] path the full path for the API call
      # @param [Hash] params the optional POST params to pass to the API
      #
      def post(path, params = {})
        request(:POST, path, params)
      end

      # A more generic helper for making authenticated API calls
      #
      # @param [Symbol] verb the HTTP verb to use
      # @param [String] path the full path for the API call
      # @param [Hash] params the optional POST params to pass to the API
      # @!visibility private
      #
      def request(verb, path, params = {})
        unauthenticated_request(verb, path, params, access_token.bearer_token)
      end

      # Builds the URI, the request object, and makes the actual API calls.
      #
      # Used by the AccessToken to fetch a new Bearer Token
      #
      # Passes the response to a Amadeus::Response object for further
      # parsing.
      #
      # @param [Symbol] verb the HTTP verb to use
      # @param [String] path the full path for the API call
      # @param [Hash] params the optional POST params to pass to the API
      # @param [String] bearer_token the optional OAuth2 bearer token
      #
      # @!visibility private
      def unauthenticated_request(verb, path, params, bearer_token = nil)
        request = build_request(verb, path, params, bearer_token)
        log(request)
        execute(request)
      end

      private

      # Builds a HTTP request object that contains all the information about
      # this request
      def build_request(verb, path, params, bearer_token)
        Amadeus::Request.new(
          host: @host, verb: verb, path: path, params: params,
          bearer_token: bearer_token, client_version: Amadeus::VERSION,
          language_version: RUBY_VERSION, app_id: @custom_app_id,
          app_version: @custom_app_version, ssl: @ssl, port: @port
        )
      end

      # Executes the request and wraps it in a Response
      def execute(request)
        http_response = fetch(request)
        response = Amadeus::Response.new(http_response, request).parse(self)
        log(response)
        response.detect_error(self)
        response
      end

      # Actually make the HTTP call, making sure to catch it in case of an error
      def fetch(request)
        @http.start(
          request.host, request.port, use_ssl: request.ssl
        ) do |http|
          http.request(request.http_request)
        end
      rescue StandardError
        error = Amadeus::NetworkError.new(nil)
        error.log(self)
        raise error
      end

      # A memoized AccessToken object, so we don't keep reauthenticating
      def access_token
        @access_token ||= AccessToken.new(self)
      end

      # Log any object
      def log(object)
        # :nocov:
        return unless @log_level == 'debug'

        logger.debug(object.class.name.to_s) do
          JSON.pretty_generate(
            ::Hash[object.instance_variables.map do |ivar|
              [ivar, object.instance_variable_get(ivar)]
            end]
          )
        end
        # :nocov:
      end
    end
  end
end
