require 'net/https'
require 'json'
require 'logger'

module Amadeus
  # The Amadeus client library for accessing
  # the travel APIs.
  class Client
    attr_reader :api_key, :api_secret, :logger

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
    def initialize(options = {})
      @api_key = initialize_required(:api_key, options)
      @api_secret = initialize_required(:api_secret, options)
      @logger = initialize_logger(options)
      @logger.level = initialize_optional(:log_level, options, Logger::WARN)
    end

    private

    def initialize_required(key, options)
      initialize_optional(key, options, nil) ||
        raise(ArgumentError, "Missing required argument: #{key}")
    end

    def initialize_optional(key, options, default)
      options[key] ||
        options[key.to_s] ||
        ENV["AMADEUS_#{key.to_s.upcase}"] ||
        default
    end

    def initialize_logger(options)
      options[:logger] || options['logger'] || Logger.new(STDOUT)
    end
  end
end
