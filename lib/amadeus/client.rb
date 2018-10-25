# frozen_string_literal: true

require 'logger'
require 'amadeus/client/validator'
require 'amadeus/namespaces/core'
require 'amadeus/client/http'
require 'amadeus/client/pagination'

module Amadeus
  # The Amadeus client library for accessing
  # the travel APIs
  class Client
    include Validator
    include HTTP
    include Pagination
    include Amadeus::Namespaces

    # The API key used to authenticate against the API
    attr_reader :client_id
    # The API secret used to authenticate against the API
    attr_reader :client_secret
    # The logger used to output warnings and debug messages
    attr_reader :logger
    # If this client is running in debug, warn, or silent mode
    attr_reader :log_level
    # The short name of the host used to make API calls against
    attr_reader :hostname
    # The host domain used to make API calls against
    attr_reader :host
    # Wether to use HTTPS to connect
    attr_reader :ssl
    # The port to connect to, if not the default 443
    attr_reader :port
    # A custom App ID to be passed in the User Agent to the server
    attr_reader :custom_app_id
    # A custom App version to be passed in the User Agent to the server
    attr_reader :custom_app_version
    # The Net:HTTP compatible HTTP client in use
    attr_reader :http

    # The available hosts for this API
    HOSTS = {
      test: 'test.api.amadeus.com',
      production: 'api.amadeus.com'
    }.freeze

    # Initialize using your credentials:
    #
    #   amadeus = Amadeus::Client.new(
    #     client_id:    'REPLACE_BY_YOUR_API_KEY',
    #     client_secret: 'REPLACE_BY_YOUR_API_SECRET'
    #   )
    #
    # Alternatively, initialize the library using
    # the environment variables +AMADEUS_CLIENT_ID+
    # and +AMADEUS_CLIENT_SECRET+
    #
    #   amadeus = Amadeus::Client.new
    #
    # @option options [string] :clientId the API key used to authenticate the
    #   API
    # @option options [string] :clientSecret the API secret used to authenticate
    #  the API
    # @option options [Object] :logger ('Logger') a `Logger`-compatible logger
    #  that accepts a debug call
    # @option options [string] :log_level ('silent') if this client is running
    #  in debug, warn, or silent mode
    # @option options [string] :hostname ('production') the name of the server
    #  API calls are made to (`production` or `test`)
    # @option options [string] :custom_app_id (null) a custom App ID to be
    #  passed in the User Agent to the server.
    # @option options [string] :custom_app_version (null) a custom App Version
    #  number to be passed in the User Agent to the server.
    # @option options [Object] :http (Net::HTTP) an optional
    #  Node/HTTPS-compatible client that accepts a 'request()' call with an
    #  array of options.
    # @option options [boolean] :ssl (true) if this client is will use HTTPS
    def initialize(options = {})
      initialize_client_credentials(options)
      initialize_logger(options)
      initialize_host(options)
      initialize_custom_app(options)
      initialize_http(options)

      recognized_options = %i[client_id client_secret
                              logger host hostname
                              custom_app_id custom_app_version
                              http log_level ssl port]
      warn_on_unrecognized_options(options, logger, recognized_options)
    end
  end
end
