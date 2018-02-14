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
    # The short name of the host used to make API calls against
    attr_reader :hostname
    # The host domain used to make API calls against
    attr_reader :host
    # A custom App ID to be passed in the User Agent to the server
    attr_reader :custom_app_id
    # A custom App version to be passed in the User Agent to the server
    attr_reader :custom_app_version
    # The Net:HTTP compatible HTTP client in use
    attr_reader :http

    # The available hosts for this API
    HOSTS = {
      test: 'https://test.api.amadeus.com',
      production: 'https://production.api.amadeus.com'
    }.freeze

    # Initialize using your credentials:
    #
    #   amadeus = Amadeus::Client.new(
    #     client_id:    'YOUR_CLIENT_ID',
    #     client_secret: 'YOUR_CLIENT_SECRET'
    #   )
    #
    # Alternatively, initialize the library using
    # the environment variables +AMADEUS_CLIENT_ID+
    # and +AMADEUS_CLIENT_SECRET+
    #
    #   amadeus = Amadeus::Client.new
    #
    def initialize(options = {})
      initialize_client_credentials(options)
      initialize_logger(options)
      initialize_host(options)
      initialize_custom_app(options)
      initialize_http(options)

      recognized_options = %i[client_id client_secret
                              logger log_level host hostname
                              custom_app_id custom_app_version
                              http]
      warn_on_unrecognized_options(options, logger, recognized_options)
    end

    private

    def initialize_client_credentials(options)
      @client_id = init_required(:client_id, options)
      @client_secret = init_required(:client_secret, options)
    end

    def initialize_logger(options)
      @logger = init_optional(:logger, options, Logger.new(STDOUT))
      @logger.level = init_optional(:log_level, options, Logger::WARN)
    end

    def initialize_host(options)
      @hostname = init_optional(:hostname, options, :test).to_sym
      @host = init_optional(:host, options, HOSTS[hostname])
    end

    def initialize_custom_app(options)
      @custom_app_id = init_optional(:custom_app_id, options, nil)
      @custom_app_version = init_optional(:custom_app_version, options, nil)
    end

    def initialize_http(options)
      @http = init_optional(:http, options, Net::HTTP)
    end
  end
end
