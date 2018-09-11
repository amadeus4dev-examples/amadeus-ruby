# frozen_string_literal: true

module Amadeus
  class Client
    # A set of helper methods to allow the validating of
    # arguments past into the {Amadeus::Client}
    # @!visibility private
    module Validator
      # PROTECTED

      # Ensures credentials were provided
      # @!visibility private
      def initialize_client_credentials(options)
        @client_id = init_required(:client_id, options)
        @client_secret = init_required(:client_secret, options)
      end

      # Initializes the logger
      # @!visibility private
      def initialize_logger(options)
        @logger       = init_optional(:logger, options, Logger.new(STDOUT))
        @log_level    = init_optional(:log_level, options, 'silent')
      end

      # Initializes the port, hostname, and use of SSL
      # @!visibility private
      def initialize_host(options)
        @hostname = init_optional(:hostname, options, :test).to_sym
        @host = init_optional(:host, options, HOSTS[hostname])
        @ssl =  init_optional(:ssl, options, true)
        @port = init_optional(:port, options, 443)
      end

      # Initializes the custom app ID and secret
      # @!visibility private
      def initialize_custom_app(options)
        @custom_app_id = init_optional(:custom_app_id, options, nil)
        @custom_app_version = init_optional(:custom_app_version, options, nil)
      end

      # Initializes the HTTP object
      # @!visibility private
      def initialize_http(options)
        @http = init_optional(:http, options, Net::HTTP)
      end

      private

      # Uses {init_optional} to find an entry, and it that returns
      # nil it raises an ArgumentError
      #
      # @param [String or Symbol] key the key to find the entry
      # @param [Hash] options the arguments were passed to the {Amadeus::Client}
      # @raise [ArgumentError] when no entry can be found
      #
      def init_required(key, options)
        init_optional(key, options).tap do |val|
          raise(ArgumentError, "Missing required argument: #{key}") if val.nil?
        end
      end

      # Tries to find an option by string or symbol in the options hash and
      # in the environment variables.When it can not find it anywhere it
      # defaults to the provided default option.
      #
      # @param [String or Symbol] key the key to find the entry
      # @param [Hash] options the arguments were passed to the {Amadeus::Client}
      # @param [Object] default an optional default value to return
      #
      def init_optional(key, options, default = nil)
        value = options[key]
        value = options[key.to_s] if value.nil?
        value = ENV["AMADEUS_#{key.to_s.upcase}"] if value.nil?
        value = default if value.nil?
        value
      end

      # Checks a list of options for unrecognized keys and warns the user.
      # This is mainly used to provide a nice experience when users make a typo
      # in their arguments.
      #
      # @param [Hash] options the arguments were passed to the {Amadeus::Client}
      # @param [Logger] logger the logger used to send warnings to
      # @param [Hash] recognized_options a whitelist of recognized options
      # @return [nil]

      def warn_on_unrecognized_options(options, logger, recognized_options)
        options.each_key do |key|
          next if recognized_options.include?(key.to_sym)

          logger.warn('Amadeus::Client::Validator') do
            # :nocov:
            "Unrecognized option: #{key}"
            # :nocov:
          end
        end
        nil
      end
    end
  end
end
