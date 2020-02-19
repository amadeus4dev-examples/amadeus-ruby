# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Airport
      # A namespaced client for the
      # +/v1/airport/predictions+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.airport.predictions
      #
      class Predictions < Amadeus::Client::Decorator
        # The namespace for the Airport-OnTime-Prediction API:
        #
        # @return [Amadeus::Namespaces::Airport::Predictions::OnTime]
        # @example
        #   amadeus.airport.predictions.on_time
        #
        def on_time
          Amadeus::Namespaces::Airport::Predictions::OnTime.new(client)
        end
      end
    end
  end
end
