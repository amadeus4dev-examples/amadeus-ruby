# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v1/airport+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.airport
    #
    class Airport < Amadeus::Client::Decorator
      # The namespace for the Ai APIs:
      #
      # @return [Amadeus::Namespaces::Airport::Predictions]
      # @example
      #   amadeus.airport.predictions
      #
      def predictions
        Amadeus::Namespaces::Airport::Predictions.new(client)
      end
    end
  end
end
