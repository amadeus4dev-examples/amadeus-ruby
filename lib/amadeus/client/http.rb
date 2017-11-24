require 'net/https'

require 'amadeus/request'

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
      #
      # To make an unauthenticated API call, make sure to pass in an explicit
      # nil as a third parameter for the access token:
      #
      #   amadeus.get('/v2/reference-data/urls/checkin-links', {
      #     airline: '1X'
      #   }, nil)
      #
      # @param [String] path the full path for the API call
      # @param [Hash] params the optional GET params to pass to the API
      # @param [String] token the optional OAuth2 bearer token
      #
      def get(path, params = {}, token = access_token)
        request(:GET, path, params, token)
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
      # @param [String] token the optional OAuth2 bearer token
      #
      def post(path, params = {}, token = access_token)
        request(:POST, path, params, token)
      end

      # A helper module for making generic GET/POST requests calls. It is
      # used by every namespaced API POST method.
      #
      #   amadeus.foo.bar.post(some: 'data')
      #
      # It can be used to make any generic API call that is automatically
      # authenticated using your API credentials:
      #
      #   amadeus.call(:GET, '/v2/foo/bar', { some: 'data' })
      #
      # To make an unauthenticated API call, make sure to pass in an explicit
      # nil for the access token:
      #
      #   amadeus.call(:GET, '/v2/foo/bar', { some: 'data' }, nil)
      #
      # @param [String] path the full path for the API call
      # @param [Hash] params the optional POST params to pass to the API
      # @param [String] token the optional OAuth2 bearer token
      #
      def call(verb, path, params = {}, token = access_token)
        request(verb, path, params, token)
      end

      private

      # Builds the URI, the request object, and makes the actual API calls.
      #
      # Passes the response to a Amadeus::Response object for further parsing.
      def request(verb, path, params, token)
        request = Amadeus::Request.new(self, verb, path, params, token)
        response = request.call

        Amadeus::Response.new(response, request)
      end

      # A memoized AccessToken object, so we don't keep reauthenticating
      def access_token
        @access_token ||= AccessToken.new(self)
      end
    end
  end
end
