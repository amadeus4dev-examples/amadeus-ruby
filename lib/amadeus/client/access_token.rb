# frozen_string_literal: true

require 'net/https'

module Amadeus
  class Client
    # A helper library to create and maintain the
    # OAuth2 AccessTokens between requests
    # @!visibility private
    class AccessToken < Amadeus::Client::Decorator
      # The number of seconds before the token expires, when
      # we will already try to refresh it
      TOKEN_BUFFER = 10

      # The bearer token that can be used directly in API request headers
      #
      # @example A full token
      #     Bearer 12345678
      def bearer_token
        "Bearer #{token}"
      end

      private

      # Returns the access token if it is still valid,
      # or refreshes it if it is not (or about to expire)
      def token
        return @access_token if @access_token && !needs_refresh?

        update_access_token
        @access_token
      end

      # Checks if the token needs a refesh by checking if the token
      # is nil or (about to) expire(d)
      def needs_refresh?
        @access_token.nil? ||
          (Time.now + TOKEN_BUFFER) > @expires_at
      end

      # Fetches a new access token and stores it and its expiry date
      def update_access_token
        response = fetch_access_token
        store_access_token(response.result)
      end

      # Fetches a new access token
      def fetch_access_token
        client.unauthenticated_request(:POST, '/v1/security/oauth2/token',
                                       grant_type: 'client_credentials',
                                       client_id: client.client_id,
                                       client_secret: client.client_secret)
      end

      # Store an access token and calculates the expiry date
      def store_access_token(data)
        @access_token = data['access_token']
        @expires_at = Time.now + data['expires_in']
      end
    end
  end
end
