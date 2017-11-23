require 'logger'
require 'amadeus/client/validator'
require 'amadeus/client/namespaces'
require 'amadeus/client/request'

module Amadeus
  # The Amadeus client library for accessing
  # the travel APIs
  class Client
    include Validator
    include Namespaces
    include Request

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

    # A list of available hosts
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
      @client_id =     init_required(:client_id, options)
      @client_secret = init_required(:client_secret, options)
      @logger =        init_optional(:logger, options, Logger.new(STDOUT))
      @logger.level =  init_optional(:log_level, options, Logger::WARN)
      @hostname =      init_optional(:hostname, options, :test).to_sym
      @host =          init_optional(:host, options, HOSTS[hostname])

      recognized_options = %i[client_id client_secret
                              logger log_level host hostname]
      warn_on_unrecognized_options(options, logger, recognized_options)
    end
  end
end
