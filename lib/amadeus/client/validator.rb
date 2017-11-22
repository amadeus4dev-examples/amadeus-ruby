module Amadeus
  class Client
    # A set of helper methods to allow validating of
    # the method arguments
    module Validator
      # Tries to find a required option by string, symbol,
      # or environment variable.
      #
      # If it can not find any, it raises an +ArgumentError+
      def initialize_required(key, options)
        initialize_optional(key, options) ||
          raise(ArgumentError, "Missing required argument: #{key}")
      end

      # Tries to find an option option by string, symbol,
      # and when it can not find it defaults to the provided
      # default option.
      def initialize_optional(key, options, default = nil)
        options[key] ||
          options[key.to_s] ||
          ENV["AMADEUS_#{key.to_s.upcase}"] ||
          default
      end

      # Warns the user when an unrecognized option is passed in
      def warn_on_unrecognized_options(options, logger, recognized_options)
        options.each_key do |key|
          next if recognized_options.include?(key.to_sym)
          logger.warn('Amadeus::Client::Validator') do
            "Unrecognized option: #{key}"
          end
        end
      end
    end
  end
end
