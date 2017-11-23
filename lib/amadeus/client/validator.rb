module Amadeus
  class Client
    # A set of helper methods to allow the validating of
    # arguments past into the {Amadeus::Client}
    module Validator
      # Uses {init_optional} to find an entry, and it that returns
      # nil it raises an ArgumentError
      #
      # @param [String or Symbol] key the key to find the entry
      # @param [Hash] options the arguments were passed to the {Amadeus::Client}
      # @raise [ArgumentError] when no entry can be found
      #
      def init_required(key, options)
        init_optional(key, options) ||
          raise(ArgumentError, "Missing required argument: #{key}")
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
        options[key] ||
          options[key.to_s] ||
          ENV["AMADEUS_#{key.to_s.upcase}"] ||
          default
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
