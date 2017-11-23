require 'net/https'

require 'amadeus/client/access_token'

module Amadeus
  class Client
    # A helper module for making generic API calls. It is used by
    # every namespaced API method.
    module Request
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
      # @param [String] :path the full path for the API call
      # @param [Hash] :params the optional GET params to pass to the API
      # @param [String] :token the optional OAuth2 bearer token
      #
      def get(path, params = {}, token = access_token.bearer_token)
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
      # @param [String] :path the full path for the API call
      # @param [Hash] :params the optional POST params to pass to the API
      # @param [String] :token the optional OAuth2 bearer token
      #
      def post(path, params = {}, token = access_token.bearer_token)
        request(:POST, path, params, token)
      end

      private

      # Builds the URI, the request object, and makes the actual API calls.
      #
      # Passes the response to a Amadeus::Response object for further parsing.
      def request(verb, path, params, token)
        log(verb, path, params, token)

        uri       = uri_for(verb, path, params)
        request   = request_for(verb, uri, params, token)
        response  = fetch(uri, request)

        Amadeus::Response.new(response, logger)
      end

      # Logs the request to be made
      def log(verb, path, params, token)
        logger.debug(self.class.name) { "#{verb} #{path}" }
        logger.debug(self.class.name) { JSON.pretty_generate(params) }
        logger.debug(self.class.name) { "Bearer #{token.inspect}" }
      end

      # Builds the URI object
      def uri_for(verb, path, params)
        uri       = URI("#{host}#{path}")
        uri.query = URI.encode_www_form(params) if verb == :GET
        uri
      end

      # Builds the request object
      def request_for(verb, uri, params, token)
        method = verb == :GET ? Net::HTTP::Get : Net::HTTP::Post
        request = method.new(uri)
        request.form_data = params if verb == :POST
        request['Authorization'] = token unless token.nil?
        request
      end

      # Makes the actual API call using the URL and request objects
      def fetch(uri, request)
        ssl = uri.scheme == 'https'
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: ssl) do |http|
          http.request(request)
        end
      rescue StandardError => error
        raise(Amadeus::Exceptions::NetworkError, error)
      end

      # A memoized access token object
      def access_token
        @access_token ||= AccessToken.new(self)
      end
    end
  end
end
