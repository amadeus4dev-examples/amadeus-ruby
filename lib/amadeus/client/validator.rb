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
    end
  end
end
