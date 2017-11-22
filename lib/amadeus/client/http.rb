require 'net/https'

require 'amadeus/client/access_token'

module Amadeus
  class Client
    # The HTTP client wrapper for the SDK
    module HTTP
      attr_accessor :access_token
      # A generic wrapper to make any API call
      #
      #  amadeus.get('/v1/reference_data/urls/checkin_links', {
      #    airline: '1X',
      #    language: 'en-GB'
      #  })
      #
      def get(path, params = {})
         _get(path, params, access_token.bearer_token)
      end

      def _get(path, params={}, token=nil)
        logger.debug('Amadeus::Client::HTTP') { "GET #{path}" }
        logger.debug('Amadeus::Client::HTTP') do
          "Params: #{params.inspect}"
        end
        uri = URI("#{host}#{path}")
        uri.query = URI.encode_www_form(params)
        request = Net::HTTP::Get.new(uri)
        request['Authorization'] = token if token

        Amadeus::Response.new(fetch(uri, request), logger)
      end

      def _post(path, params={}, token=nil)
        logger.debug('Amadeus::Client::HTTP') { "POST #{path}" }
        logger.debug('Amadeus::Client::HTTP') do
          "Params: #{params.inspect}"
        end
        uri = URI("#{host}#{path}")
        request = Net::HTTP::Post.new(uri)
        request['Authorization'] = token if token
        request.form_data = params

        Amadeus::Response.new(fetch(uri, request), logger)
      end

      private

      def fetch(uri, method)
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(method)
        end
      end

      def access_token
        @access_token ||= AccessToken.new(self)
      end
    end
  end
end
