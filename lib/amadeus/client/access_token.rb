require 'net/https'

module Amadeus
  class Client
    # A helper library to create an Access token
    class AccessToken < Amadeus::Client::Decorator

      attr_accessor :type
      attr_accessor :username
      attr_accessor :application_name
      attr_accessor :client_id
      attr_accessor :token_type
      attr_accessor :access_token
      attr_accessor :expires_at
      attr_accessor :state
      attr_accessor :scope

      TOKEN_BUFFER = 10.freeze

      def token
        return access_token if access_token && !needs_refresh?
        update_access_token
        access_token
      end

      def bearer_token
        "Bearer #{token}"
      end

      def needs_refresh?
        access_token.nil? ||
        (Time.now + TOKEN_BUFFER) > expires_at
      end

      def update_access_token
        client.logger.debug('Amadeus::Client::AccessToken') do
          'Refreshing Access Token'
        end

        response = client._post('/v1/security/oauth2/token', {
          grant_type: 'client_credentials',
          client_id: client.api_key,
          client_secret: client.api_secret
        })

        @type = response.data['type']
        @username = response.data['username']
        @application_name = response.data['application_name']
        @client_id = response.data['client_id']
        @token_type = response.data['token_type']
        @access_token = response.data['access_token']
        @expires_at = Time.now + response.data['expires_in']
        @state = response.data['state']
        @scope = response.data['scope']
      end
    end
  end
end
