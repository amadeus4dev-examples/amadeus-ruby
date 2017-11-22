require 'logger'
require 'amadeus/client/validator'
require 'amadeus/client/namespaces'
require 'amadeus/client/http'

module Amadeus
  # The Amadeus client library for accessing
  # the travel APIs.
  class Client
    include Validator
    include Namespaces
    include HTTP

    # The API key used to authenticate against the API
    attr_reader :api_key
    # The API secret used to authenticate against the API
    attr_reader :api_secret
    # The logger used to output warnings and debug messages
    attr_reader :logger
    # The short name of the host used to make API calls against
    attr_reader :hostname
    # The host domain used to make API calls against
    attr_reader :host

    # A list of hosts available to the
    HOSTS = {
      test: 'https://test.api.amadeus.com',
      production: 'https://production.api.amadeus.com'
    }.freeze

    # Initialize using your credentials:
    #
    #   amadeus = Amadeus::Client.new(
    #     api_key:    'YOUR_API_KEY',
    #     api_secret: 'YOUR_API_SECRET'
    #   )
    #
    # Alternatively, initialize the library using
    # the environment variables +AMADEUS_API_KEY+
    # and +AMADEUS_API_SECRET+
    #
    #   amadeus = Amadeus::Client.new
    #
    def initialize(options = {})
      @api_key =      initialize_required(:api_key, options)
      @api_secret =   initialize_required(:api_secret, options)
      @logger =       initialize_optional(:logger, options, Logger.new(STDOUT))
      @logger.level = initialize_optional(:log_level, options, Logger::WARN)
      @hostname =     initialize_optional(:hostname, options, :test).to_sym
      @host =         initialize_optional(:host, options, HOSTS[hostname])

      recognized_options = %i[api_key api_secret logger log_level]
      warn_on_unrecognized_options(options, logger, recognized_options)
    end
  end
end
